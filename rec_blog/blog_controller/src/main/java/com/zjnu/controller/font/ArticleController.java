package com.zjnu.controller.font;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjnu.model.*;
import com.zjnu.pojo.*;
import com.zjnu.recom.booleanrec.BooleaReco;
import com.zjnu.redis.JedisUtil;
import com.zjnu.service.*;
import org.apache.commons.lang.ArrayUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.zjnu.recom.common.ItemSimilarity;
import com.zjnu.recom.youkeRec.BasedItemRec;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/29.
 */
@Controller
public class ArticleController {
    private static final Logger log = Logger.getLogger(ArticleController.class);
    @Resource
    private UserService userService;
    @Resource
    private ArticleCommentService articleCommentService;
    @Resource
    private ArticleAttachService articleAttachService;
    @Resource
    private ArticleRatingService articleRatingService;
    @Resource
    private RatingService ratingService;
    @Resource
    private ArticleKindService articleKindService;

    @Resource
    private ArticleService articleService;

    @RequestMapping("/rec/{userId}")
    @ResponseBody
    public RecommendedItems getRecom(@PathVariable("userId") Integer userId) throws Exception {
        RecommendedItems recommendedItems = new RecommendedItems();

        // Stage 1: get user's items
        String key = String.format("UI:%s", userId);
        String value = JedisUtil.getJedis().get(key);

        if (value == null || value.length() <= 0) {
            return recommendedItems;
        }

        List<Long> userItems = JSON.parseArray(value, Long.class);
        Set<Long> userItemsSet = new TreeSet<Long>(userItems);

        // Stage 2: get similar items to the user's items
        List<String> userItemStrs = new ArrayList<>();
        for (Long item : userItems) {
            userItemStrs.add("II:" + item);
        }

        List<String> similarItems = JedisUtil.getJedis().mget(userItemStrs.toArray(new String[userItemStrs.size()]));
        Set<ItemSimilarity> similarItemsSet = new TreeSet<>();
        int i = 0;
        for (String item : similarItems) {
            i++;
            if (item == null || item.length() == 0) {
                System.out.println("cuowu zai " + i);
                continue;
            } else {
                String s = item.replaceAll(",null", "");
                List<ItemSimilarity> result = JSON.parseArray(s, ItemSimilarity.class);
                similarItemsSet.addAll(result);
            }

        }

        List<Long> recommendedItemIDs = new ArrayList<>();
        Map similarity = new HashMap();
        for (ItemSimilarity item : similarItemsSet) {
            if (!userItemsSet.contains(item.getId())) {
                recommendedItemIDs.add((item.getId()));
                similarity.put(item.getId(), item.getS());
            }
            if (recommendedItemIDs.size() >= 100)
                break;
        }
        recommendedItems.setItems(recommendedItemIDs.toArray(new Long[0]));
        recommendedItems.setSimilarity(similarity);

        return recommendedItems;

    }

    //登陆之后获取离线推荐
    @ResponseBody
    @RequestMapping(value = "/loadRecom")
    public PageResult loadRecom(int userId, int currentPage, int rows) throws Exception {

        PageResult pageResult;
        RecommendedItems recommendedItems = new RecommendedItems();

        // Stage 1: get user's items
        String key = String.format("UI:%s", userId);
        String value = JedisUtil.getJedis().get(key);

        if (value == null || value.length() <= 0) {
            //基于用户无偏好推荐
            RecommendedItems recommendedItems2 = BooleaReco.recBooleanBaseUser(userId, 30);
            Long[] items = recommendedItems2.getItems();
            PageHelper.startPage(currentPage, rows);
            List<Article> articles = articleService.selectByArray(items);
            PageInfo<Article> info = new PageInfo<Article>(articles);
            long total;
            if (info.getTotal() % rows == 0) {
                total = info.getTotal() / rows;
            } else
                total = info.getTotal() / rows + 1;
            PageResult pageResult2 = new PageResult(total, articles, currentPage);
            return pageResult2;
        }

        List<Long> userItems = JSON.parseArray(value, Long.class);
        Set<Long> userItemsSet = new TreeSet<Long>(userItems);

        // Stage 2: get similar items to the user's items
        List<String> userItemStrs = new ArrayList<>();
        String[] strings = new String[userItems.size()];
        List<String> similarItems = new ArrayList<>();
        int j = 0;
        for (Long item : userItems) {
//            userItemStrs.add("II:" + item);
            strings[j] = "II:" + item;
            similarItems.add(JedisUtil.getJedis().get(strings[j]));
            j++;
        }
        similarItems.removeAll(Collections.singleton(null));
//        List<String> similarItems = JedisUtil.getJedis().mget(userItemStrs.toArray(new String[userItemStrs.size()]));
        Set<ItemSimilarity> similarItemsSet = new TreeSet<>();
        int i = 0;
        for (String item : similarItems) {
            i++;
            List<ItemSimilarity> result = JSON.parseArray(item, ItemSimilarity.class);
            similarItemsSet.addAll(result);
        }

        List<Long> recommendedItemIDs = new ArrayList<>();
        Map similarity = new HashMap();
        for (ItemSimilarity item : similarItemsSet) {
            if (!userItemsSet.contains(item.getId())) {
                recommendedItemIDs.add((item.getId()));
                similarity.put(item.getId(), item.getS());
            }
            if (recommendedItemIDs.size() >= 30)
                break;
        }
        recommendedItems.setItems(recommendedItemIDs.toArray(new Long[0]));
        recommendedItems.setSimilarity(similarity);

        Long[] items = recommendedItems.getItems();
        log.info("当前页为====" + currentPage);
        List<Article> articles = new ArrayList<>();
        RecommendedItems recommendedItems1 = new RecommendedItems();
        if (items.length >= 30) {
            PageHelper.startPage(currentPage, rows);
            articles = articleService.selectByArray(items);
        } else if (items.length > 0 && items.length < 30) {
            int a = 30 - items.length;
            recommendedItems1 = BooleaReco.recBooleanBaseUser(userId, a);
            Long[] item2 = recommendedItems1.getItems();
            Long[] ff = (Long[]) ArrayUtils.addAll(items, item2);
            PageHelper.startPage(currentPage, rows);
            articles = articleService.selectByArray(ff);
        } else {
            //无偏好推荐
            recommendedItems1 = BooleaReco.recBooleanBaseUser(userId, 30);
            items = recommendedItems1.getItems();
            PageHelper.startPage(currentPage, rows);
            articles = articleService.selectByArray(items);
        }
        PageInfo<Article> info = new PageInfo<Article>(articles);
        long total;
        if (info.getTotal() % rows == 0) {
            total = info.getTotal() / rows;
        } else
            total = info.getTotal() / rows + 1;
        pageResult = new PageResult(total, articles, currentPage);
        return pageResult;
    }

    //主页游客读取
    @ResponseBody
    @RequestMapping(value = "/json")
    public PageResult ajaxLoad(int currentPage, int rows) {
        log.info("当前页为====" + currentPage);
        PageHelper.startPage(currentPage, rows);
        List<Article> articles = articleService.selectAllArticle();
        PageInfo<Article> info = new PageInfo<Article>(articles);
        long total;
        if (info.getTotal() % rows == 0) {
            total = info.getTotal() / rows;
        } else
            total = info.getTotal() / rows + 1;
        PageResult pageResult = new PageResult(total, articles, currentPage);

        return pageResult;
    }

    @ResponseBody
    @RequestMapping(value = "/kind")
    public List<ArticleKind> kind() {
        List<ArticleKind> allPKind = articleKindService.getAllPKind();
        return allPKind;
    }

    @ResponseBody
    @RequestMapping(value = "/rewen")
    public PageResult rewen() {
        PageHelper.startPage(1, 5);
        List<Article> articles = articleService.selectFirstFiveArticle();
        PageInfo<Article> info = new PageInfo<Article>(articles);
        long total;
        if (info.getTotal() % 5 == 0) {
            total = info.getTotal() / 5;
        } else
            total = info.getTotal() / 5 + 1;
        PageResult pageResult = new PageResult(total, articles, 1);

        return pageResult;
    }

    //换一批
    @ResponseBody
    @RequestMapping("/changeReco")
    public PageResult changeReco(HttpSession session, int currentPage, int rows) throws Exception {
        PageResult pageResult;
        RecommendedItems recommendedItems = new RecommendedItems();
        User user = (User) session.getAttribute("user");
        if (null == user || null == user.getUserName()) {
            log.info("无Session");
            //游客
            String pre_str = "youke:";
            Set<String> set = JedisUtil.getJedis().keys(pre_str + "*");
            Iterator<String> it = set.iterator();
            System.out.println("-");
            List<NewClickEvent> newClickEvents = new ArrayList<>();
            Set<Long> mostItemIds = new HashSet<>();
            while (it.hasNext()) {
                String keyStr = it.next();
                String value = JedisUtil.getJedis().get(keyStr);
                mostItemIds.add(Long.valueOf(value));
            }
            Long[] longs1;
            //基于物品的推荐
            List<ArticleRating> articleRating = ratingService.getArticleRating();
            if (mostItemIds.size() > 0) {
                Set<Long> longs = mostItemIds;
                longs1 = BasedItemRec.itemRec(longs);
            } else {
                //没有点击，就应该随机
//                longs1 = ItemRec.itemRec(mostItemIds, articleRating);
                Random random = new Random();
                int itemid = random.nextInt(1000);
                RecommendedItems recommendedItems1 = BooleaReco.recBooleanBaseItem(itemid, rows);
                longs1 = recommendedItems1.getItems();
            }
            PageHelper.startPage(currentPage, rows);
            List<Article> articles = articleService.selectByArray(longs1);
            PageInfo<Article> info = new PageInfo<Article>(articles);
            long total;
            if (info.getTotal() % rows == 0) {
                total = info.getTotal() / rows;
            } else
                total = info.getTotal() / rows + 1;
            pageResult = new PageResult(total, articles, currentPage);
            return pageResult;
        } else {
            //已经推荐好的物品id
            String key = String.format("RUI:%s", user.getUserId() + "");
            String value = JedisUtil.getJedis().get(key);
            if (value == null || value.length() <= 0) {
                //基于用户无偏好推荐
                RecommendedItems recommendedItems2 = BooleaReco.recBooleanBaseUser(user.getUserId(), 30);
                Long[] items = recommendedItems2.getItems();
                PageHelper.startPage(currentPage, rows);
                List<Article> articles = articleService.selectByArray(items);
                PageInfo<Article> info = new PageInfo<Article>(articles);
                long total;
                if (info.getTotal() % rows == 0) {
                    total = info.getTotal() / rows;
                } else
                    total = info.getTotal() / rows + 1;
                PageResult pageResult2 = new PageResult(total, articles, currentPage);
                return pageResult2;
            }

            List<ItemSimilarity> userItems = JSON.parseArray(value, ItemSimilarity.class);
            Long[] items = new Long[userItems.size()];
            int i = 0;
            for (ItemSimilarity item : userItems) {
                items[i] = item.getId();
                i++;
            }
            List<Article> articles = new ArrayList<>();
            RecommendedItems recommendedItems1 = new RecommendedItems();
            Long[] ff;
            if (items.length < 30) {
                //无偏好推荐
                int a = 30 - items.length;
                recommendedItems1 = BooleaReco.recBooleanBaseUser(user.getUserId(), a);
                Long[] item2 = recommendedItems1.getItems();
                ff = (Long[]) ArrayUtils.addAll(items, item2);
                PageHelper.startPage(currentPage, rows);
                articles = articleService.selectByArray(ff);
            } else {
                PageHelper.startPage(currentPage, rows);
                articles = articleService.selectByArray(items);
            }
            PageInfo<Article> info = new PageInfo<Article>(articles);
            long total;
            if (info.getTotal() % rows == 0) {
                total = info.getTotal() / rows;
            } else
                total = info.getTotal() / rows + 1;
            pageResult = new PageResult(total, articles, currentPage);
            return pageResult;
        }

    }

    //评分
    @ResponseBody
    @RequestMapping("/loadTime")
    public void loadTime(HttpSession session, String times, Integer articleId) {
        User user = (User) session.getAttribute("user");
        if (null == user || null == user.getUserName()) {
            log.info("无Session");
        } else {
            ArticleRating articleRating = new ArticleRating();
            articleRating.setArticleId(Long.valueOf(articleId));
            articleRating.setUserId(user.getUserId());
            log.info(user.getUserId() + "|||" + times + "|||" + articleId);
            Integer time = Integer.valueOf(times);
            if (time > 0 && time < 3) {
                articleRating.setRating(Float.valueOf(1));
            } else if (time >= 3 && time <= 6) {
                articleRating.setRating(Float.valueOf(2));
            } else if (time >= 7 && time <= 15) {
                articleRating.setRating(Float.valueOf(3));
            } else if (time >= 16 && time <= 20) {
                articleRating.setRating(Float.valueOf(4));
            } else {
                articleRating.setRating(Float.valueOf(5));
            }
            articleRatingService.insertOneorUpdate(articleRating);
        }
    }

    //查看文章
    @RequestMapping("/toarticle/{articleId}")
    public String article(@PathVariable("articleId") Integer articleId, HttpSession session, Model model) throws Exception {
        User user = (User) session.getAttribute("user");
        if (null != user && null != user.getUserName()) {
            Date day = new Date();
            SimpleDateFormat df = new SimpleDateFormat("MMddHHmmss");
            System.out.println(df.format(day));
            JedisUtil.getJedis().set("user:" + user.getUserId() + df.format(day), "" + articleId);
        } else {
            //游客查看
            Date day = new Date();
            SimpleDateFormat df = new SimpleDateFormat("MMddHHmmss");
            System.out.println(df.format(day));
            JedisUtil.getJedis().set("youke:" + df.format(day), "" + articleId);
        }
        ArticleDetail articleDetail = new ArticleDetail();
        try {
            //文章详细
            Article one = articleService.getOne(Long.valueOf(articleId));
            articleDetail.setArticle(one);
            //人信息
            Long userId = one.getUserId();
            User userById = userService.getUserById(userId);
            articleDetail.setUser(userById);
            //评论
            List<ArticleComment> commsByArticleId = articleCommentService.getCommsByArticleId(Long.valueOf(articleId));
            articleDetail.setArticleComments(commsByArticleId);
            //tag
            ArticleAttachPojo oneByArticleId = articleAttachService.getOneByArticleId(Long.valueOf(articleId));
            articleDetail.setArticleAttachPojo(oneByArticleId);
            model.addAttribute("state", 1);
            model.addAttribute("articleDetail", articleDetail);
            return "font/article";
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("state", 0);
        return "font/article";
    }

    //kind = zanPlus,zanMinus
    //kind = caiPlus,caiMinus
    @RequestMapping("/zanOrCai/{articleId}/{opKind}/{orNumber}")
    @ResponseBody
    public Integer zanOrCai(@PathVariable("articleId") Integer articleId, @PathVariable("opKind") String opKind, @PathVariable("orNumber") Integer orNumber) {
        Article article = new Article();
        article.setArticleId(Long.valueOf(articleId));
        if (opKind.equalsIgnoreCase("zanPlus")) {
            article.setArticleUp(orNumber + 1);
            orNumber += 1;
        }
        if (opKind.equalsIgnoreCase("zanMinus")) {
            article.setArticleUp(orNumber - 1);
            orNumber -= 1;

        }
        if (opKind.equalsIgnoreCase("caiPlus")) {
            article.setArticleDown(orNumber + 1);
            orNumber += 1;
        }

        if (opKind.equalsIgnoreCase("caiMinus")) {
            article.setArticleDown(orNumber + 1);
            orNumber -= 1;
        }
        articleService.updateOne(article);
        return orNumber;
    }


}
