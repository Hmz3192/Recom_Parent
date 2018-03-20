package com.zjnu.model;

import java.io.Serializable;

public class ArticleAttach implements Serializable {
    private Long articleId;

    private String tags;

    private Integer tagNumber;

    private String pics;

    private Integer picNumber;

    public ArticleAttach(Long articleId, String tags, Integer tagNumber, String pics, Integer picNumber) {
        this.articleId = articleId;
        this.tags = tags;
        this.tagNumber = tagNumber;
        this.pics = pics;
        this.picNumber = picNumber;
    }

    public ArticleAttach() {
        super();
    }

    public Long getArticleId() {
        return articleId;
    }

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags == null ? null : tags.trim();
    }

    public Integer getTagNumber() {
        return tagNumber;
    }

    public void setTagNumber(Integer tagNumber) {
        this.tagNumber = tagNumber;
    }

    public String getPics() {
        return pics;
    }

    public void setPics(String pics) {
        this.pics = pics == null ? null : pics.trim();
    }

    public Integer getPicNumber() {
        return picNumber;
    }

    public void setPicNumber(Integer picNumber) {
        this.picNumber = picNumber;
    }
}