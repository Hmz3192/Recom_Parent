package com.zjnu.model;

import java.io.Serializable;

public class Article implements Serializable {
    private Long articleId;

    private String articleContent;

    private String articleTitle;

    private String kindParentName;

    private String kindChildName;

    private Long userId;

    private String articleSummary;

    private String articleWriter;

    private String articleSource;

    private Integer articleHints;

    private String releaseTime;

    private String articlePower;

    private Integer checkUp;

    private Integer articleCollection;

    private Integer articleUp;

    private Integer articleDown;

    private String articleState;

    private String articleAvatar;

    private Integer articleBig;

    private Integer articleFirst;

    private String sourceUrl;

    public Article(Long articleId, String articleContent, String articleTitle, String kindParentName, String kindChildName, Long userId, String articleSummary, String articleWriter, String articleSource, Integer articleHints, String releaseTime, String articlePower, Integer checkUp, Integer articleCollection, Integer articleUp, Integer articleDown, String articleState, String articleAvatar, Integer articleBig, Integer articleFirst, String sourceUrl) {
        this.articleId = articleId;
        this.articleContent = articleContent;
        this.articleTitle = articleTitle;
        this.kindParentName = kindParentName;
        this.kindChildName = kindChildName;
        this.userId = userId;
        this.articleSummary = articleSummary;
        this.articleWriter = articleWriter;
        this.articleSource = articleSource;
        this.articleHints = articleHints;
        this.releaseTime = releaseTime;
        this.articlePower = articlePower;
        this.checkUp = checkUp;
        this.articleCollection = articleCollection;
        this.articleUp = articleUp;
        this.articleDown = articleDown;
        this.articleState = articleState;
        this.articleAvatar = articleAvatar;
        this.articleBig = articleBig;
        this.articleFirst = articleFirst;
        this.sourceUrl = sourceUrl;
    }

    public Article() {
        super();
    }

    public Long getArticleId() {
        return articleId;
    }

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent == null ? null : articleContent.trim();
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle == null ? null : articleTitle.trim();
    }

    public String getKindParentName() {
        return kindParentName;
    }

    public void setKindParentName(String kindParentName) {
        this.kindParentName = kindParentName == null ? null : kindParentName.trim();
    }

    public String getKindChildName() {
        return kindChildName;
    }

    public void setKindChildName(String kindChildName) {
        this.kindChildName = kindChildName == null ? null : kindChildName.trim();
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getArticleSummary() {
        return articleSummary;
    }

    public void setArticleSummary(String articleSummary) {
        this.articleSummary = articleSummary == null ? null : articleSummary.trim();
    }

    public String getArticleWriter() {
        return articleWriter;
    }

    public void setArticleWriter(String articleWriter) {
        this.articleWriter = articleWriter == null ? null : articleWriter.trim();
    }

    public String getArticleSource() {
        return articleSource;
    }

    public void setArticleSource(String articleSource) {
        this.articleSource = articleSource == null ? null : articleSource.trim();
    }

    public Integer getArticleHints() {
        return articleHints;
    }

    public void setArticleHints(Integer articleHints) {
        this.articleHints = articleHints;
    }

    public String getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(String releaseTime) {
        this.releaseTime = releaseTime == null ? null : releaseTime.trim();
    }

    public String getArticlePower() {
        return articlePower;
    }

    public void setArticlePower(String articlePower) {
        this.articlePower = articlePower == null ? null : articlePower.trim();
    }

    public Integer getCheckUp() {
        return checkUp;
    }

    public void setCheckUp(Integer checkUp) {
        this.checkUp = checkUp;
    }

    public Integer getArticleCollection() {
        return articleCollection;
    }

    public void setArticleCollection(Integer articleCollection) {
        this.articleCollection = articleCollection;
    }

    public Integer getArticleUp() {
        return articleUp;
    }

    public void setArticleUp(Integer articleUp) {
        this.articleUp = articleUp;
    }

    public Integer getArticleDown() {
        return articleDown;
    }

    public void setArticleDown(Integer articleDown) {
        this.articleDown = articleDown;
    }

    public String getArticleState() {
        return articleState;
    }

    public void setArticleState(String articleState) {
        this.articleState = articleState == null ? null : articleState.trim();
    }

    public String getArticleAvatar() {
        return articleAvatar;
    }

    public void setArticleAvatar(String articleAvatar) {
        this.articleAvatar = articleAvatar == null ? null : articleAvatar.trim();
    }

    public Integer getArticleBig() {
        return articleBig;
    }

    public void setArticleBig(Integer articleBig) {
        this.articleBig = articleBig;
    }

    public Integer getArticleFirst() {
        return articleFirst;
    }

    public void setArticleFirst(Integer articleFirst) {
        this.articleFirst = articleFirst;
    }

    public String getSourceUrl() {
        return sourceUrl;
    }

    public void setSourceUrl(String sourceUrl) {
        this.sourceUrl = sourceUrl == null ? null : sourceUrl.trim();
    }
}