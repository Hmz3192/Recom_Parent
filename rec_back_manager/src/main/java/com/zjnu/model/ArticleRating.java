package com.zjnu.model;

import java.io.Serializable;

public class ArticleRating implements Serializable {
    private Long userId;

    private Long articleId;

    private Float rating;

    public ArticleRating(Long userId, Long articleId, Float rating) {
        this.userId = userId;
        this.articleId = articleId;
        this.rating = rating;
    }

    public ArticleRating() {
        super();
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getArticleId() {
        return articleId;
    }

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public Float getRating() {
        return rating;
    }

    public void setRating(Float rating) {
        this.rating = rating;
    }
}