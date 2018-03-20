package com.zjnu.controller.font;

import com.zjnu.lucene.InitParams;
import com.zjnu.lucene.api.FullTextResult;
import com.zjnu.lucene.api.FullTextSearchParams;
import com.zjnu.lucene.api.FullTextService;
import com.zjnu.lucene.api.ServerFactory;
import com.zjnu.lucene.index.IndexServer;
import com.zjnu.lucene.spi.LuceneService;
import com.zjnu.neo4j.Match2D3;
import com.zjnu.pojo.NeoResultJson;
import com.zjnu.utils.ConstantPara;
import com.zjnu.utils.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/3/10.
 */
@Controller
public class SearchController {
    private LuceneService luceneService = null;
    private FullTextService searchService = null;
    public static FullTextService solrService = null;


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

    @RequestMapping("/query")
    public String doQuery(String queryString, Model model) {
        beginService();
        FullTextSearchParams fullTextSearchParams = new FullTextSearchParams();
        fullTextSearchParams.setQueryWord(queryString);
        //sousuo yu
        List<String> assignmentFields = new ArrayList<String>();
        assignmentFields.add("title");
        assignmentFields.add("conten");
        assignmentFields.add("summ");
        fullTextSearchParams.setAssignmentFields(assignmentFields);
        //shitu yu
        String[] viewFields = new String[]{"id","title","conten","summ","name","time"};
        fullTextSearchParams.setViewFields(viewFields);

        fullTextSearchParams.setViewNums(100);
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
        model.addAttribute("queryString", queryString);
        model.addAttribute("num", numFound);
        model.addAttribute("searchList", tempList);


        Match2D3 example = new Match2D3(ConstantPara.NEO_URL, ConstantPara.NEO_USER, ConstantPara.NEO_PASS);
        NeoResultJson neoData = example.getNeoData(queryString);
        if (neoData.getNeoUsers().size() > 0) {
            model.addAttribute("neoUser", neoData.getNeoUsers().get(0));
            model.addAttribute("neoTotal", neoData.getNeoUsers().size());
        } else {
            model.addAttribute("neoTotal", 0);
        }
        example.close();
//        List<KlKnowledge> all = klKnowledgeService.getAll();
//        model.addAttribute("Knowledges", all);
//        model.addAttribute("queryString", queryString);

//        lucene
        /*String indexPath = ConstantParams.INDEXPATH;
        if (StringUtil.isNotEmpty(queryString)) {
            beginService("search", indexPath);
            FullTextSearchParams fullTextSearchParams = new FullTextSearchParams();
            fullTextSearchParams.setQueryWord(queryString);
            fullTextSearchParams.setReturnNums(1000);

            List<String> assignmentFields = new ArrayList<String>();
            assignmentFields.add("klTitle");
            assignmentFields.add("klIntro");
            assignmentFields.add("klContent");

            fullTextSearchParams.setAssignmentFields(assignmentFields);

            String[] viewFields = new String[]{"klTitle", "klIntro","klContent"};
            fullTextSearchParams.setViewFields(viewFields);

            fullTextSearchParams.setViewNums(150);
            fullTextSearchParams.setIsHighlight(true);
            fullTextSearchParams.setPreHighlight("<font color='red'>");
            fullTextSearchParams.setPostHighlight("</font>");
            FullTextResult result = luceneService.doQuery(fullTextSearchParams);
            long numFound = result.getNumFound();
            List tempList = result.getResultList();

            int pageRow = tempList.size();
            int pageSize = 10;

            model.addAttribute("searchList", tempList);
            List<KlKnowledge> all = klKnowledgeService.getAll();
            model.addAttribute("Knowledges", all);
        }*/

        return "font/search";
    }

}
