package com.zjnu.controller.font;

import com.zjnu.bayesian.ChineseTokenizer;
import com.zjnu.bayesian.DefaultStopWordsHandler;
import com.zjnu.bayesian.MultinomialModelNaiveBayes;
import com.zjnu.bayesian.TrainSampleDataManager;
import com.zjnu.model.Article;
import com.zjnu.service.ArticleService;
import com.zjnu.utils.ThreadPoolUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
public class NaiveController {


    @Resource
    private ArticleService articleService;


    @RequestMapping("ki")
    public String toKind() {
        return "font/kind";
    }

    @RequestMapping("/naive")
    @ResponseBody
    public String naive(String title,String source) throws Exception {
        List<Article> articles = articleService.selectTrain();
        TrainSampleDataManager.process(articles);
        Set<String> words = ChineseTokenizer.segStr(title + "," + source).keySet();
        Map<String, BigDecimal> resultMap = MultinomialModelNaiveBayes.classifyResult(DefaultStopWordsHandler.dropStopWords(words));
        Set<String> set = resultMap.keySet();
        String classifyResultName = MultinomialModelNaiveBayes.getClassifyResultName();
        return classifyResultName;
    }
}
