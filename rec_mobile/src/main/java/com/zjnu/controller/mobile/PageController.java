package com.zjnu.controller.mobile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjnu.lucene.InitParams;
import com.zjnu.lucene.api.FullTextResult;
import com.zjnu.lucene.api.FullTextSearchParams;
import com.zjnu.lucene.api.FullTextService;
import com.zjnu.lucene.api.ServerFactory;
import com.zjnu.lucene.index.IndexServer;
import com.zjnu.lucene.spi.LuceneService;
import com.zjnu.model.Article;
import com.zjnu.model.ArticleComment;
import com.zjnu.model.User;
import com.zjnu.pojo.ArticleAttachPojo;
import com.zjnu.pojo.ArticleDetail;
import com.zjnu.pojo.PageResult;
import com.zjnu.redis.JedisUtil;
import com.zjnu.service.ArticleService;
import com.zjnu.service.UserService;
import com.zjnu.utils.ConvertSwfUtil;
import com.zjnu.utils.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class PageController {
    private LuceneService luceneService = null;
    private FullTextService searchService = null;
    public static FullTextService solrService = null;
    @Resource
    private ArticleService articleService;
    @Resource
    private UserService userService;

    @ResponseBody
    @RequestMapping(value = "/clearReadis")
    public String clearReadis() {
        //清除redis缓存
        JedisUtil.getJedis().flushDB();
        return "清楚成功";
    }



    /*在线浏览*/
    @RequestMapping("/toReadOnline/{kind}")
    public String toReadOnline(@PathVariable("kind") Integer kind, HttpServletRequest request, HttpSession session) {

        String path = request.getServletContext().getRealPath("");
        String filePath = "";
        if (kind == 1) {
            filePath = "/attached/file/docx.docx";
        } else if (kind == 2) {
            filePath = "/attached/file/pdf.pdf";
        }else if (kind == 3) {
            filePath = "/attached/file/word.doc";
        }else if (kind == 4) {
            filePath = "/attached/file/xls.xls";
        }
        String wholePath = path + filePath;
        String fileName = StringUtil.getFileNameOnly(filePath);
        String outPutPath = request.getServletContext().getRealPath("/") + "attached/";
        String outPath = new ConvertSwfUtil().beginConvert(outPutPath, wholePath, fileName);
        System.out.println("生成swf文件:" + outPath);
        File swfFile = new File(outPath);
//        swfPath = swfFile.getName();
        System.out.println(swfFile.getName());
        session.setAttribute("swfPath", swfFile.getName());
        return "mobile/readFile";
    }


    @RequestMapping("/m")
    public String main() {
        return "mobile/main";
    }
    @RequestMapping("/mget")
    @ResponseBody
    public PageResult mget( Integer currentPage, Integer rows) {
        PageHelper.startPage(currentPage, rows);
        List<Article> allSend = articleService.getAllSend();
        PageInfo<Article> info = new PageInfo<Article>(allSend);
        long total;
        if (info.getTotal() % rows == 0) {
            total = info.getTotal() / rows;
        } else
            total = info.getTotal() / rows + 1;
        PageResult pageResult = new PageResult(total, allSend, currentPage);
        return pageResult;
    }

    @RequestMapping("/toarticle/{id}")
    public String toarticl(@PathVariable("id") Integer id,Model model) {
        ArticleDetail articleDetail = new ArticleDetail();
            //文章详细
            Article one = articleService.getOne(Long.valueOf(id));
            articleDetail.setArticle(one);
            //人信息
            Long userId = one.getUserId();
            User userById = userService.getUserById(userId);
            articleDetail.setUser(userById);
            model.addAttribute("state", 1);
            model.addAttribute("articleDetail", articleDetail);
            return "mobile/article";
    }

    @RequestMapping("/tma/{id}")
    public String tma(@PathVariable("id") String id,Model model) {
        ArticleDetail articleDetail = new ArticleDetail();
        //文章详细
        Article one = articleService.getOne(Long.valueOf(id));
        articleDetail.setArticle(one);
        //人信息
        Long userId = one.getUserId();
        User userById = userService.getUserById(userId);
        articleDetail.setUser(userById);
        model.addAttribute("state", 1);
        model.addAttribute("articleDetail", articleDetail);
        return "mobile/marticle";
    }

    @RequestMapping("/toms")
    public String toms() {
        return "mobile/search";
    }

    //android查找
    @RequestMapping("/mS/{query}")
    public String mS(@PathVariable("query") String query, Model model) {
        beginService();
        FullTextSearchParams fullTextSearchParams = new FullTextSearchParams();
        fullTextSearchParams.setQueryWord(query);
        //sousuo yu
        List<String> assignmentFields = new ArrayList<String>();
        assignmentFields.add("title");
        assignmentFields.add("conten");
        assignmentFields.add("summ");
        fullTextSearchParams.setAssignmentFields(assignmentFields);
        //shitu yu
        String[] viewFields = new String[]{"id","title","conten","summ","name","time"};
        fullTextSearchParams.setViewFields(viewFields);

        fullTextSearchParams.setViewNums(30);
        fullTextSearchParams.setIsHighlight(true);
        String[] highlightFields = {"title","conten","summ","name"};
        fullTextSearchParams.setHighlightFields(highlightFields);
        fullTextSearchParams.setPreHighlight("<em>");
        fullTextSearchParams.setPostHighlight("</em>");

        //guolv
        /*Map<String,String> filterField = new HashMap<String,String>();
        filterField.put("columnId", columnId+"");
        fullTextSearchParams.setFilterField(filterField);*/

        FullTextResult result = searchService.doQuery(fullTextSearchParams);
        long numFound = result.getNumFound();
        List tempList = result.getResultList();

        int pageRow = tempList.size();
        int pageSize = 10;
        model.addAttribute("queryString", query);
        model.addAttribute("num", numFound);
        model.addAttribute("searchList", tempList);
        return "mobile/msearch";
    }
	
	 //android查找2
    @RequestMapping("/mSearch")
    public String mS2(String query, Model model) {
        beginService();
        FullTextSearchParams fullTextSearchParams = new FullTextSearchParams();
        fullTextSearchParams.setQueryWord(query);
        //sousuo yu
        List<String> assignmentFields = new ArrayList<String>();
        assignmentFields.add("title");
        assignmentFields.add("conten");
        assignmentFields.add("summ");
        fullTextSearchParams.setAssignmentFields(assignmentFields);
        //shitu yu
        String[] viewFields = new String[]{"id","title","conten","summ","name","time"};
        fullTextSearchParams.setViewFields(viewFields);

        fullTextSearchParams.setViewNums(30);
        fullTextSearchParams.setIsHighlight(true);
        String[] highlightFields = {"title","conten","summ","name"};
        fullTextSearchParams.setHighlightFields(highlightFields);
        fullTextSearchParams.setPreHighlight("<em>");
        fullTextSearchParams.setPostHighlight("</em>");

        //guolv
        /*Map<String,String> filterField = new HashMap<String,String>();
        filterField.put("columnId", columnId+"");
        fullTextSearchParams.setFilterField(filterField);*/

        FullTextResult result = searchService.doQuery(fullTextSearchParams);
        long numFound = result.getNumFound();
        List tempList = result.getResultList();

        int pageRow = tempList.size();
        int pageSize = 10;
        model.addAttribute("queryString", query);
        model.addAttribute("num", numFound);
        model.addAttribute("searchList", tempList);
        return "mobile/msearch";
    }

    //wap query
    @RequestMapping("/S")
    public String S(String query, Model model) {
        beginService();
        FullTextSearchParams fullTextSearchParams = new FullTextSearchParams();
        fullTextSearchParams.setQueryWord(query);
        //sousuo yu
        List<String> assignmentFields = new ArrayList<String>();
        assignmentFields.add("title");
        assignmentFields.add("conten");
        assignmentFields.add("summ");
        fullTextSearchParams.setAssignmentFields(assignmentFields);
        //shitu yu
        String[] viewFields = new String[]{"id","title","conten","summ","name","time"};
        fullTextSearchParams.setViewFields(viewFields);

        fullTextSearchParams.setViewNums(30);
        fullTextSearchParams.setIsHighlight(true);
        String[] highlightFields = {"title","conten","summ","name"};
        fullTextSearchParams.setHighlightFields(highlightFields);
        fullTextSearchParams.setPreHighlight("<em>");
        fullTextSearchParams.setPostHighlight("</em>");

        //guolv
        /*Map<String,String> filterField = new HashMap<String,String>();
        filterField.put("columnId", columnId+"");
        fullTextSearchParams.setFilterField(filterField);*/

        FullTextResult result = searchService.doQuery(fullTextSearchParams);
        long numFound = result.getNumFound();
        List tempList = result.getResultList();

        int pageRow = tempList.size();
        int pageSize = 10;
        model.addAttribute("queryString", query);
        model.addAttribute("num", numFound);
        model.addAttribute("searchList", tempList);

        return "mobile/search";
    }
    @RequestMapping("/mL")
    public String mL() {
        return "mobile/login";
    }
    @RequestMapping("/mR")
    public String mR() {
        return "mobile/register";
    }
    @RequestMapping("/mA")
    public String mA() {
        return "mobile/article";
    }


    public void beginService(){
        Map<String,String> params = new HashMap<String,String>();
        String type = StringUtil.getConfigParam(InitParams.SERVERTYPE, "", InitParams.SEARCH_PROPERTIES);
        params.put("type", type);
        String serverName = StringUtil.getConfigParam(InitParams.SERVERNAME, "", InitParams.SEARCH_PROPERTIES);
        params.put("serverName", serverName);
        String url = StringUtil.getConfigParam(InitParams.SOLR_URL, "", InitParams.SEARCH_PROPERTIES);
        params.put("url", url);
        params.put("className", IndexServer.class.getName());
        ServerFactory serverFactory = new ServerFactory();
        searchService = serverFactory.beginService(params);
        searchService.setServerName(serverName);
    }

}
