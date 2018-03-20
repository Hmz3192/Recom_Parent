package com.zjnu.controller.android;

import com.github.pagehelper.PageHelper;
import com.zjnu.model.Article;
import com.zjnu.model.User;
import com.zjnu.pojo.ArticleUserPojo;
import com.zjnu.service.ArticleService;
import com.zjnu.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/3/16.
 */
@Controller
public class DataController {

    @Resource
    private UserService userService;
    @Resource
    private ArticleService articleservice;

    @RequestMapping("/login")
    @ResponseBody
    public ArticleUserPojo getdata(String name) {
        ArticleUserPojo articleUserPojo = new ArticleUserPojo();
        User oneByName = userService.getOneByName(name);
//        List<Article> allArticles = articleservice.getAllArticles();
//        allArticles.subList(0, 100);
//        articleUserPojo.setArticles(allArticles);
        articleUserPojo.setUser(oneByName);
        return articleUserPojo;
    }


    @RequestMapping("/getArticle")
    @ResponseBody
    public ArticleUserPojo getArticle(String kind) {
        ArticleUserPojo articleUserPojo = new ArticleUserPojo();
        List<Article> allArticles = articleservice.getAllArticlesByKind(kind);
        List<Article> articles = new ArrayList<>();
        int i = 0;
        for (Article article : allArticles) {
            if (i == 10) {
                break;
            }
            article.setArticleContent("");
            article.setArticleSummary("");
            articles.add(article);
            i++;
        }

        articleUserPojo.setArticles(articles);
        return articleUserPojo;
    }
}
