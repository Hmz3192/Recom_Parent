package com.zjnu.pojo;

import com.zjnu.model.Article;
import com.zjnu.model.ArticleComment;
import com.zjnu.model.User;

import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/29.
 */
public class ArticleDetail {
    private User user;
    private Article article;
    private ArticleAttachPojo articleAttachPojo;
    private List<ArticleComment> articleComments;

    public ArticleDetail() {
    }

    public User getUser() {

        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public ArticleAttachPojo getArticleAttachPojo() {
        return articleAttachPojo;
    }

    public void setArticleAttachPojo(ArticleAttachPojo articleAttachPojo) {
        this.articleAttachPojo = articleAttachPojo;
    }

    public List<ArticleComment> getArticleComments() {
        return articleComments;
    }

    public void setArticleComments(List<ArticleComment> articleComments) {
        this.articleComments = articleComments;
    }

    public ArticleDetail(User user, Article article, ArticleAttachPojo articleAttachPojo, List<ArticleComment> articleComments) {

        this.user = user;
        this.article = article;
        this.articleAttachPojo = articleAttachPojo;
        this.articleComments = articleComments;
    }
}
