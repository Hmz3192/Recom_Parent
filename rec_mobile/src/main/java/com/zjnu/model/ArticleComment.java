package com.zjnu.model;

import java.io.Serializable;

public class ArticleComment implements Serializable {
    private Integer commentId;

    private Long articleId;

    private String userName;

    private String commentBody;

    private String commentTime;

    private Integer commentUp;

    private Integer commentDown;

    private Integer replayCommentId;

    public ArticleComment(Integer commentId, Long articleId, String userName, String commentBody, String commentTime, Integer commentUp, Integer commentDown, Integer replayCommentId) {
        this.commentId = commentId;
        this.articleId = articleId;
        this.userName = userName;
        this.commentBody = commentBody;
        this.commentTime = commentTime;
        this.commentUp = commentUp;
        this.commentDown = commentDown;
        this.replayCommentId = replayCommentId;
    }

    public ArticleComment() {
        super();
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Long getArticleId() {
        return articleId;
    }

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getCommentBody() {
        return commentBody;
    }

    public void setCommentBody(String commentBody) {
        this.commentBody = commentBody == null ? null : commentBody.trim();
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime == null ? null : commentTime.trim();
    }

    public Integer getCommentUp() {
        return commentUp;
    }

    public void setCommentUp(Integer commentUp) {
        this.commentUp = commentUp;
    }

    public Integer getCommentDown() {
        return commentDown;
    }

    public void setCommentDown(Integer commentDown) {
        this.commentDown = commentDown;
    }

    public Integer getReplayCommentId() {
        return replayCommentId;
    }

    public void setReplayCommentId(Integer replayCommentId) {
        this.replayCommentId = replayCommentId;
    }
}