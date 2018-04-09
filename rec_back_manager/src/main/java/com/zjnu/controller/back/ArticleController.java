package com.zjnu.controller.back;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjnu.lucene.api.FullTextIndexParams;
import com.zjnu.lucene.api.FullTextService;
import com.zjnu.lucene.spi.LuceneService;
import com.zjnu.model.Article;
import com.zjnu.model.User;
import com.zjnu.pojo.PageResult;
import com.zjnu.pojo.SensitiveWordPojo;
import com.zjnu.sensitivewdfilter.SensitivewordFilter;
import com.zjnu.service.ArticleService;
import com.zjnu.service.UserService;
import com.zjnu.utils.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.DefaultValue;
import java.util.*;

import static com.zjnu.lucene.index.IndexServer.getService;

@Controller
public class ArticleController {

    @Resource
    private ArticleService articleService;
    @Resource
    private UserService userService;
    private LuceneService luceneService = null;
    private FullTextService searchService = null;
    public static FullTextService solrService = null;


    @RequestMapping("/setBig/{articleId}")
    public String setBig(@PathVariable("articleId") Integer articleId) throws Exception {
        Article article = articleService.getOneById(articleId);
        article.setArticleBig(1);
        articleService.updateIndex(article);
        return "redirect:/article/1/10";
    }
        //单个文件建立索引，同意建立索引
    @RequestMapping("/addIndex/{articleId}")
    public String checkIndex(@PathVariable("articleId") Integer articleId) throws Exception {
        solrService = getService();
        Article article = articleService.getOneById(articleId);
        User oneById = userService.getOneById(article.getUserId());
        articleService.updateIndex(article);
        List<Map<String, Object>> indexData = StringUtil.prepareIndexData(article,oneById);
        FullTextIndexParams fullTextIndexParams = new FullTextIndexParams();
        fullTextIndexParams.setIndexData(indexData);
        solrService.doIndex(fullTextIndexParams);


     /*   KlKnowledge klKnowledge = klKnowledgeService.selectByPrimaryKey(klId);
        klKnowledge.setKlCheckState(1);

        String indexPath = ConstantParams.INDEXPATH;
        //清除原有索引
        String realPath = request.getServletContext().getRealPath("/") + "index";
        FileUtil.deleteDir(new File(realPath));
        klKnowledgeService.updateKl(klKnowledge);
        //获取所有state=1
        List<KlKnowledge> indexed = klKnowledgeService.getIndexed();
        //重新放入
        //启动服务
        beginService("writer",indexPath);
        FullTextIndexParams fullTextIndexParams = new FullTextIndexParams();
        List<Map<String,Object>> indexData = new ArrayList<Map<String,Object>>();
        Map<String,Object> map = null;
        for (KlKnowledge klKnowledge1 : indexed) {
            map = new HashMap<String,Object>();
            map.put("klTitle", klKnowledge1.getKlTitle());
            map.put("klIntro", klKnowledge1.getKlIntroduction());
            map.put("klContent", StringUtil.html2Text(klKnowledge1.getKlContent()));
            indexData.add(map);
        }
        fullTextIndexParams.setIndexData(indexData);
        luceneService.doIndex(fullTextIndexParams);*/
        return "redirect:/article/1/10";
    }


    @RequestMapping("/article/{currentPage}/{rows}")
    public String article(Model model, @PathVariable("currentPage") Integer currentPage,@PathVariable("rows") Integer rows) {
        PageHelper.startPage(currentPage, rows);
        List<Article> allSend = articleService.getAllSend();
        PageInfo<Article> info = new PageInfo<Article>(allSend);
        long total;
        if (info.getTotal() % rows == 0) {
            total = info.getTotal() / rows;
        } else
            total = info.getTotal() / rows + 1;
        PageResult pageResult = new PageResult(total, allSend, currentPage);
        model.addAttribute("pga", pageResult);
        return "back/article";
    }
    //根据状态来查找
    @RequestMapping("/state/{ArtState}/{currentPage}/{rows}")
    public String article(Model model,@PathVariable("ArtState") Integer ArtState, @PathVariable("currentPage") Integer currentPage,@PathVariable("rows") Integer rows) {
        PageHelper.startPage(currentPage, rows);
        List<Article> allSend = articleService.getAllSendByState(ArtState);
        PageInfo<Article> info = new PageInfo<Article>(allSend);
        long total;
        if (info.getTotal() % rows == 0) {
            total = info.getTotal() / rows;
        } else
            total = info.getTotal() / rows + 1;
        PageResult pageResult = new PageResult(total, allSend, currentPage);
        model.addAttribute("pga", pageResult);
        return "back/article";
    }


    //敏感词检测
    @RequestMapping("wordTest/{articleId}")
    @ResponseBody
    public SensitiveWordPojo wordTest(@PathVariable("articleId") Integer articleId) {
        SensitivewordFilter filter = new SensitivewordFilter();
        SensitiveWordPojo sensitiveWordPojo = new SensitiveWordPojo();
        Article one = articleService.getOneById(articleId);
        String sWord = "三级片";
        sWord += one.getArticleTitle() + one.getArticleSummary() + StringUtil.html2Text(one.getArticleContent());
        long beginTime = System.currentTimeMillis();
        Set<String> set = filter.getSensitiveWord(sWord, 1);
        long endTime = System.currentTimeMillis();
        String time = String.valueOf(endTime - beginTime);
//        System.out.println("语句中包含敏感词的个数为：" + set.size() + "。包含：" + set);
        sensitiveWordPojo.setExcuteTime(time);
        sensitiveWordPojo.setWords(set);
        int len = sWord.length();
        sensitiveWordPojo.setWordSize(set.size());
        String percentage = StringUtil.calPercentage(set.size(), sWord.length());
        sensitiveWordPojo.setPassProb(percentage + "%");
        return sensitiveWordPojo;
    }


    @RequestMapping("/SaveA/{currentPage}/{rows}")
    public String SaveA(Model model, @PathVariable("currentPage") Integer currentPage,@PathVariable("rows") Integer rows) {
        PageHelper.startPage(currentPage, rows);
        List<Article> allSend = articleService.getAllSave();
        PageInfo<Article> info = new PageInfo<Article>(allSend);
        long total;
        if (info.getTotal() % rows == 0) {
            total = info.getTotal() / rows;
        } else
            total = info.getTotal() / rows + 1;
        PageResult pageResult = new PageResult(total, allSend, currentPage);
        model.addAttribute("pga", pageResult);
        return "back/nosavearticle";
    }

}
