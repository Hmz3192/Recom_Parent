package com.zjnu.model;

import java.util.ArrayList;
import java.util.List;

public class ArticleCommentExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ArticleCommentExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andCommentIdIsNull() {
            addCriterion("comment_id is null");
            return (Criteria) this;
        }

        public Criteria andCommentIdIsNotNull() {
            addCriterion("comment_id is not null");
            return (Criteria) this;
        }

        public Criteria andCommentIdEqualTo(Integer value) {
            addCriterion("comment_id =", value, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdNotEqualTo(Integer value) {
            addCriterion("comment_id <>", value, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdGreaterThan(Integer value) {
            addCriterion("comment_id >", value, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("comment_id >=", value, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdLessThan(Integer value) {
            addCriterion("comment_id <", value, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdLessThanOrEqualTo(Integer value) {
            addCriterion("comment_id <=", value, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdIn(List<Integer> values) {
            addCriterion("comment_id in", values, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdNotIn(List<Integer> values) {
            addCriterion("comment_id not in", values, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdBetween(Integer value1, Integer value2) {
            addCriterion("comment_id between", value1, value2, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdNotBetween(Integer value1, Integer value2) {
            addCriterion("comment_id not between", value1, value2, "commentId");
            return (Criteria) this;
        }

        public Criteria andArticleIdIsNull() {
            addCriterion("article_id is null");
            return (Criteria) this;
        }

        public Criteria andArticleIdIsNotNull() {
            addCriterion("article_id is not null");
            return (Criteria) this;
        }

        public Criteria andArticleIdEqualTo(Long value) {
            addCriterion("article_id =", value, "articleId");
            return (Criteria) this;
        }

        public Criteria andArticleIdNotEqualTo(Long value) {
            addCriterion("article_id <>", value, "articleId");
            return (Criteria) this;
        }

        public Criteria andArticleIdGreaterThan(Long value) {
            addCriterion("article_id >", value, "articleId");
            return (Criteria) this;
        }

        public Criteria andArticleIdGreaterThanOrEqualTo(Long value) {
            addCriterion("article_id >=", value, "articleId");
            return (Criteria) this;
        }

        public Criteria andArticleIdLessThan(Long value) {
            addCriterion("article_id <", value, "articleId");
            return (Criteria) this;
        }

        public Criteria andArticleIdLessThanOrEqualTo(Long value) {
            addCriterion("article_id <=", value, "articleId");
            return (Criteria) this;
        }

        public Criteria andArticleIdIn(List<Long> values) {
            addCriterion("article_id in", values, "articleId");
            return (Criteria) this;
        }

        public Criteria andArticleIdNotIn(List<Long> values) {
            addCriterion("article_id not in", values, "articleId");
            return (Criteria) this;
        }

        public Criteria andArticleIdBetween(Long value1, Long value2) {
            addCriterion("article_id between", value1, value2, "articleId");
            return (Criteria) this;
        }

        public Criteria andArticleIdNotBetween(Long value1, Long value2) {
            addCriterion("article_id not between", value1, value2, "articleId");
            return (Criteria) this;
        }

        public Criteria andUserNameIsNull() {
            addCriterion("user_name is null");
            return (Criteria) this;
        }

        public Criteria andUserNameIsNotNull() {
            addCriterion("user_name is not null");
            return (Criteria) this;
        }

        public Criteria andUserNameEqualTo(String value) {
            addCriterion("user_name =", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameNotEqualTo(String value) {
            addCriterion("user_name <>", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameGreaterThan(String value) {
            addCriterion("user_name >", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameGreaterThanOrEqualTo(String value) {
            addCriterion("user_name >=", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameLessThan(String value) {
            addCriterion("user_name <", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameLessThanOrEqualTo(String value) {
            addCriterion("user_name <=", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameLike(String value) {
            addCriterion("user_name like", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameNotLike(String value) {
            addCriterion("user_name not like", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameIn(List<String> values) {
            addCriterion("user_name in", values, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameNotIn(List<String> values) {
            addCriterion("user_name not in", values, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameBetween(String value1, String value2) {
            addCriterion("user_name between", value1, value2, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameNotBetween(String value1, String value2) {
            addCriterion("user_name not between", value1, value2, "userName");
            return (Criteria) this;
        }

        public Criteria andCommentBodyIsNull() {
            addCriterion("comment_body is null");
            return (Criteria) this;
        }

        public Criteria andCommentBodyIsNotNull() {
            addCriterion("comment_body is not null");
            return (Criteria) this;
        }

        public Criteria andCommentBodyEqualTo(String value) {
            addCriterion("comment_body =", value, "commentBody");
            return (Criteria) this;
        }

        public Criteria andCommentBodyNotEqualTo(String value) {
            addCriterion("comment_body <>", value, "commentBody");
            return (Criteria) this;
        }

        public Criteria andCommentBodyGreaterThan(String value) {
            addCriterion("comment_body >", value, "commentBody");
            return (Criteria) this;
        }

        public Criteria andCommentBodyGreaterThanOrEqualTo(String value) {
            addCriterion("comment_body >=", value, "commentBody");
            return (Criteria) this;
        }

        public Criteria andCommentBodyLessThan(String value) {
            addCriterion("comment_body <", value, "commentBody");
            return (Criteria) this;
        }

        public Criteria andCommentBodyLessThanOrEqualTo(String value) {
            addCriterion("comment_body <=", value, "commentBody");
            return (Criteria) this;
        }

        public Criteria andCommentBodyLike(String value) {
            addCriterion("comment_body like", value, "commentBody");
            return (Criteria) this;
        }

        public Criteria andCommentBodyNotLike(String value) {
            addCriterion("comment_body not like", value, "commentBody");
            return (Criteria) this;
        }

        public Criteria andCommentBodyIn(List<String> values) {
            addCriterion("comment_body in", values, "commentBody");
            return (Criteria) this;
        }

        public Criteria andCommentBodyNotIn(List<String> values) {
            addCriterion("comment_body not in", values, "commentBody");
            return (Criteria) this;
        }

        public Criteria andCommentBodyBetween(String value1, String value2) {
            addCriterion("comment_body between", value1, value2, "commentBody");
            return (Criteria) this;
        }

        public Criteria andCommentBodyNotBetween(String value1, String value2) {
            addCriterion("comment_body not between", value1, value2, "commentBody");
            return (Criteria) this;
        }

        public Criteria andCommentTimeIsNull() {
            addCriterion("comment_time is null");
            return (Criteria) this;
        }

        public Criteria andCommentTimeIsNotNull() {
            addCriterion("comment_time is not null");
            return (Criteria) this;
        }

        public Criteria andCommentTimeEqualTo(String value) {
            addCriterion("comment_time =", value, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentTimeNotEqualTo(String value) {
            addCriterion("comment_time <>", value, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentTimeGreaterThan(String value) {
            addCriterion("comment_time >", value, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentTimeGreaterThanOrEqualTo(String value) {
            addCriterion("comment_time >=", value, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentTimeLessThan(String value) {
            addCriterion("comment_time <", value, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentTimeLessThanOrEqualTo(String value) {
            addCriterion("comment_time <=", value, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentTimeLike(String value) {
            addCriterion("comment_time like", value, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentTimeNotLike(String value) {
            addCriterion("comment_time not like", value, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentTimeIn(List<String> values) {
            addCriterion("comment_time in", values, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentTimeNotIn(List<String> values) {
            addCriterion("comment_time not in", values, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentTimeBetween(String value1, String value2) {
            addCriterion("comment_time between", value1, value2, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentTimeNotBetween(String value1, String value2) {
            addCriterion("comment_time not between", value1, value2, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentUpIsNull() {
            addCriterion("comment_up is null");
            return (Criteria) this;
        }

        public Criteria andCommentUpIsNotNull() {
            addCriterion("comment_up is not null");
            return (Criteria) this;
        }

        public Criteria andCommentUpEqualTo(Integer value) {
            addCriterion("comment_up =", value, "commentUp");
            return (Criteria) this;
        }

        public Criteria andCommentUpNotEqualTo(Integer value) {
            addCriterion("comment_up <>", value, "commentUp");
            return (Criteria) this;
        }

        public Criteria andCommentUpGreaterThan(Integer value) {
            addCriterion("comment_up >", value, "commentUp");
            return (Criteria) this;
        }

        public Criteria andCommentUpGreaterThanOrEqualTo(Integer value) {
            addCriterion("comment_up >=", value, "commentUp");
            return (Criteria) this;
        }

        public Criteria andCommentUpLessThan(Integer value) {
            addCriterion("comment_up <", value, "commentUp");
            return (Criteria) this;
        }

        public Criteria andCommentUpLessThanOrEqualTo(Integer value) {
            addCriterion("comment_up <=", value, "commentUp");
            return (Criteria) this;
        }

        public Criteria andCommentUpIn(List<Integer> values) {
            addCriterion("comment_up in", values, "commentUp");
            return (Criteria) this;
        }

        public Criteria andCommentUpNotIn(List<Integer> values) {
            addCriterion("comment_up not in", values, "commentUp");
            return (Criteria) this;
        }

        public Criteria andCommentUpBetween(Integer value1, Integer value2) {
            addCriterion("comment_up between", value1, value2, "commentUp");
            return (Criteria) this;
        }

        public Criteria andCommentUpNotBetween(Integer value1, Integer value2) {
            addCriterion("comment_up not between", value1, value2, "commentUp");
            return (Criteria) this;
        }

        public Criteria andCommentDownIsNull() {
            addCriterion("comment_down is null");
            return (Criteria) this;
        }

        public Criteria andCommentDownIsNotNull() {
            addCriterion("comment_down is not null");
            return (Criteria) this;
        }

        public Criteria andCommentDownEqualTo(Integer value) {
            addCriterion("comment_down =", value, "commentDown");
            return (Criteria) this;
        }

        public Criteria andCommentDownNotEqualTo(Integer value) {
            addCriterion("comment_down <>", value, "commentDown");
            return (Criteria) this;
        }

        public Criteria andCommentDownGreaterThan(Integer value) {
            addCriterion("comment_down >", value, "commentDown");
            return (Criteria) this;
        }

        public Criteria andCommentDownGreaterThanOrEqualTo(Integer value) {
            addCriterion("comment_down >=", value, "commentDown");
            return (Criteria) this;
        }

        public Criteria andCommentDownLessThan(Integer value) {
            addCriterion("comment_down <", value, "commentDown");
            return (Criteria) this;
        }

        public Criteria andCommentDownLessThanOrEqualTo(Integer value) {
            addCriterion("comment_down <=", value, "commentDown");
            return (Criteria) this;
        }

        public Criteria andCommentDownIn(List<Integer> values) {
            addCriterion("comment_down in", values, "commentDown");
            return (Criteria) this;
        }

        public Criteria andCommentDownNotIn(List<Integer> values) {
            addCriterion("comment_down not in", values, "commentDown");
            return (Criteria) this;
        }

        public Criteria andCommentDownBetween(Integer value1, Integer value2) {
            addCriterion("comment_down between", value1, value2, "commentDown");
            return (Criteria) this;
        }

        public Criteria andCommentDownNotBetween(Integer value1, Integer value2) {
            addCriterion("comment_down not between", value1, value2, "commentDown");
            return (Criteria) this;
        }

        public Criteria andReplayCommentIdIsNull() {
            addCriterion("replay_comment_id is null");
            return (Criteria) this;
        }

        public Criteria andReplayCommentIdIsNotNull() {
            addCriterion("replay_comment_id is not null");
            return (Criteria) this;
        }

        public Criteria andReplayCommentIdEqualTo(Integer value) {
            addCriterion("replay_comment_id =", value, "replayCommentId");
            return (Criteria) this;
        }

        public Criteria andReplayCommentIdNotEqualTo(Integer value) {
            addCriterion("replay_comment_id <>", value, "replayCommentId");
            return (Criteria) this;
        }

        public Criteria andReplayCommentIdGreaterThan(Integer value) {
            addCriterion("replay_comment_id >", value, "replayCommentId");
            return (Criteria) this;
        }

        public Criteria andReplayCommentIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("replay_comment_id >=", value, "replayCommentId");
            return (Criteria) this;
        }

        public Criteria andReplayCommentIdLessThan(Integer value) {
            addCriterion("replay_comment_id <", value, "replayCommentId");
            return (Criteria) this;
        }

        public Criteria andReplayCommentIdLessThanOrEqualTo(Integer value) {
            addCriterion("replay_comment_id <=", value, "replayCommentId");
            return (Criteria) this;
        }

        public Criteria andReplayCommentIdIn(List<Integer> values) {
            addCriterion("replay_comment_id in", values, "replayCommentId");
            return (Criteria) this;
        }

        public Criteria andReplayCommentIdNotIn(List<Integer> values) {
            addCriterion("replay_comment_id not in", values, "replayCommentId");
            return (Criteria) this;
        }

        public Criteria andReplayCommentIdBetween(Integer value1, Integer value2) {
            addCriterion("replay_comment_id between", value1, value2, "replayCommentId");
            return (Criteria) this;
        }

        public Criteria andReplayCommentIdNotBetween(Integer value1, Integer value2) {
            addCriterion("replay_comment_id not between", value1, value2, "replayCommentId");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}