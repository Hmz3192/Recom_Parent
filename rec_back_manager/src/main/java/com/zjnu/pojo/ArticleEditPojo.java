package com.zjnu.pojo;

import com.zjnu.model.Article;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/25.
 */
public class ArticleEditPojo {
    private Article article;
    private ArticleAttachPojo articleAttachPojo;
    /*新增0，修改1*/
    private int blog_state;

    public ArticleEditPojo() {
    }

    public ArticleEditPojo(Article article, ArticleAttachPojo articleAttachPojo, int blog_state) {
        this.article = article;
        this.articleAttachPojo = articleAttachPojo;
        this.blog_state = blog_state;
    }

    public int getBlog_state() {

        return blog_state;
    }

    public void setBlog_state(int blog_state) {
        this.blog_state = blog_state;
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
}
