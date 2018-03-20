package com.zjnu.pojo;

import com.zjnu.model.Article;
import com.zjnu.model.User;

import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/3/16.
 */
public class ArticleUserPojo {

    private User user;
    private List<Article> articles;

    public ArticleUserPojo() {
    }

    public User getUser() {

        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Article> getArticles() {
        return articles;
    }

    public void setArticles(List<Article> articles) {
        this.articles = articles;
    }

    public ArticleUserPojo(User user, List<Article> articles) {

        this.user = user;
        this.articles = articles;
    }
}
