package com.zjnu.model;

import java.util.ArrayList;
import java.util.List;

public class ArticleExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ArticleExample() {
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

        public Criteria andArticleContentIsNull() {
            addCriterion("article_content is null");
            return (Criteria) this;
        }

        public Criteria andArticleContentIsNotNull() {
            addCriterion("article_content is not null");
            return (Criteria) this;
        }

        public Criteria andArticleContentEqualTo(String value) {
            addCriterion("article_content =", value, "articleContent");
            return (Criteria) this;
        }

        public Criteria andArticleContentNotEqualTo(String value) {
            addCriterion("article_content <>", value, "articleContent");
            return (Criteria) this;
        }

        public Criteria andArticleContentGreaterThan(String value) {
            addCriterion("article_content >", value, "articleContent");
            return (Criteria) this;
        }

        public Criteria andArticleContentGreaterThanOrEqualTo(String value) {
            addCriterion("article_content >=", value, "articleContent");
            return (Criteria) this;
        }

        public Criteria andArticleContentLessThan(String value) {
            addCriterion("article_content <", value, "articleContent");
            return (Criteria) this;
        }

        public Criteria andArticleContentLessThanOrEqualTo(String value) {
            addCriterion("article_content <=", value, "articleContent");
            return (Criteria) this;
        }

        public Criteria andArticleContentLike(String value) {
            addCriterion("article_content like", value, "articleContent");
            return (Criteria) this;
        }

        public Criteria andArticleContentNotLike(String value) {
            addCriterion("article_content not like", value, "articleContent");
            return (Criteria) this;
        }

        public Criteria andArticleContentIn(List<String> values) {
            addCriterion("article_content in", values, "articleContent");
            return (Criteria) this;
        }

        public Criteria andArticleContentNotIn(List<String> values) {
            addCriterion("article_content not in", values, "articleContent");
            return (Criteria) this;
        }

        public Criteria andArticleContentBetween(String value1, String value2) {
            addCriterion("article_content between", value1, value2, "articleContent");
            return (Criteria) this;
        }

        public Criteria andArticleContentNotBetween(String value1, String value2) {
            addCriterion("article_content not between", value1, value2, "articleContent");
            return (Criteria) this;
        }

        public Criteria andArticleTitleIsNull() {
            addCriterion("article_title is null");
            return (Criteria) this;
        }

        public Criteria andArticleTitleIsNotNull() {
            addCriterion("article_title is not null");
            return (Criteria) this;
        }

        public Criteria andArticleTitleEqualTo(String value) {
            addCriterion("article_title =", value, "articleTitle");
            return (Criteria) this;
        }

        public Criteria andArticleTitleNotEqualTo(String value) {
            addCriterion("article_title <>", value, "articleTitle");
            return (Criteria) this;
        }

        public Criteria andArticleTitleGreaterThan(String value) {
            addCriterion("article_title >", value, "articleTitle");
            return (Criteria) this;
        }

        public Criteria andArticleTitleGreaterThanOrEqualTo(String value) {
            addCriterion("article_title >=", value, "articleTitle");
            return (Criteria) this;
        }

        public Criteria andArticleTitleLessThan(String value) {
            addCriterion("article_title <", value, "articleTitle");
            return (Criteria) this;
        }

        public Criteria andArticleTitleLessThanOrEqualTo(String value) {
            addCriterion("article_title <=", value, "articleTitle");
            return (Criteria) this;
        }

        public Criteria andArticleTitleLike(String value) {
            addCriterion("article_title like", value, "articleTitle");
            return (Criteria) this;
        }

        public Criteria andArticleTitleNotLike(String value) {
            addCriterion("article_title not like", value, "articleTitle");
            return (Criteria) this;
        }

        public Criteria andArticleTitleIn(List<String> values) {
            addCriterion("article_title in", values, "articleTitle");
            return (Criteria) this;
        }

        public Criteria andArticleTitleNotIn(List<String> values) {
            addCriterion("article_title not in", values, "articleTitle");
            return (Criteria) this;
        }

        public Criteria andArticleTitleBetween(String value1, String value2) {
            addCriterion("article_title between", value1, value2, "articleTitle");
            return (Criteria) this;
        }

        public Criteria andArticleTitleNotBetween(String value1, String value2) {
            addCriterion("article_title not between", value1, value2, "articleTitle");
            return (Criteria) this;
        }

        public Criteria andKindParentNameIsNull() {
            addCriterion("kind_parent_name is null");
            return (Criteria) this;
        }

        public Criteria andKindParentNameIsNotNull() {
            addCriterion("kind_parent_name is not null");
            return (Criteria) this;
        }

        public Criteria andKindParentNameEqualTo(String value) {
            addCriterion("kind_parent_name =", value, "kindParentName");
            return (Criteria) this;
        }

        public Criteria andKindParentNameNotEqualTo(String value) {
            addCriterion("kind_parent_name <>", value, "kindParentName");
            return (Criteria) this;
        }

        public Criteria andKindParentNameGreaterThan(String value) {
            addCriterion("kind_parent_name >", value, "kindParentName");
            return (Criteria) this;
        }

        public Criteria andKindParentNameGreaterThanOrEqualTo(String value) {
            addCriterion("kind_parent_name >=", value, "kindParentName");
            return (Criteria) this;
        }

        public Criteria andKindParentNameLessThan(String value) {
            addCriterion("kind_parent_name <", value, "kindParentName");
            return (Criteria) this;
        }

        public Criteria andKindParentNameLessThanOrEqualTo(String value) {
            addCriterion("kind_parent_name <=", value, "kindParentName");
            return (Criteria) this;
        }

        public Criteria andKindParentNameLike(String value) {
            addCriterion("kind_parent_name like", value, "kindParentName");
            return (Criteria) this;
        }

        public Criteria andKindParentNameNotLike(String value) {
            addCriterion("kind_parent_name not like", value, "kindParentName");
            return (Criteria) this;
        }

        public Criteria andKindParentNameIn(List<String> values) {
            addCriterion("kind_parent_name in", values, "kindParentName");
            return (Criteria) this;
        }

        public Criteria andKindParentNameNotIn(List<String> values) {
            addCriterion("kind_parent_name not in", values, "kindParentName");
            return (Criteria) this;
        }

        public Criteria andKindParentNameBetween(String value1, String value2) {
            addCriterion("kind_parent_name between", value1, value2, "kindParentName");
            return (Criteria) this;
        }

        public Criteria andKindParentNameNotBetween(String value1, String value2) {
            addCriterion("kind_parent_name not between", value1, value2, "kindParentName");
            return (Criteria) this;
        }

        public Criteria andKindChildNameIsNull() {
            addCriterion("kind_child_name is null");
            return (Criteria) this;
        }

        public Criteria andKindChildNameIsNotNull() {
            addCriterion("kind_child_name is not null");
            return (Criteria) this;
        }

        public Criteria andKindChildNameEqualTo(String value) {
            addCriterion("kind_child_name =", value, "kindChildName");
            return (Criteria) this;
        }

        public Criteria andKindChildNameNotEqualTo(String value) {
            addCriterion("kind_child_name <>", value, "kindChildName");
            return (Criteria) this;
        }

        public Criteria andKindChildNameGreaterThan(String value) {
            addCriterion("kind_child_name >", value, "kindChildName");
            return (Criteria) this;
        }

        public Criteria andKindChildNameGreaterThanOrEqualTo(String value) {
            addCriterion("kind_child_name >=", value, "kindChildName");
            return (Criteria) this;
        }

        public Criteria andKindChildNameLessThan(String value) {
            addCriterion("kind_child_name <", value, "kindChildName");
            return (Criteria) this;
        }

        public Criteria andKindChildNameLessThanOrEqualTo(String value) {
            addCriterion("kind_child_name <=", value, "kindChildName");
            return (Criteria) this;
        }

        public Criteria andKindChildNameLike(String value) {
            addCriterion("kind_child_name like", value, "kindChildName");
            return (Criteria) this;
        }

        public Criteria andKindChildNameNotLike(String value) {
            addCriterion("kind_child_name not like", value, "kindChildName");
            return (Criteria) this;
        }

        public Criteria andKindChildNameIn(List<String> values) {
            addCriterion("kind_child_name in", values, "kindChildName");
            return (Criteria) this;
        }

        public Criteria andKindChildNameNotIn(List<String> values) {
            addCriterion("kind_child_name not in", values, "kindChildName");
            return (Criteria) this;
        }

        public Criteria andKindChildNameBetween(String value1, String value2) {
            addCriterion("kind_child_name between", value1, value2, "kindChildName");
            return (Criteria) this;
        }

        public Criteria andKindChildNameNotBetween(String value1, String value2) {
            addCriterion("kind_child_name not between", value1, value2, "kindChildName");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNull() {
            addCriterion("user_id is null");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNotNull() {
            addCriterion("user_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserIdEqualTo(Long value) {
            addCriterion("user_id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(Long value) {
            addCriterion("user_id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(Long value) {
            addCriterion("user_id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(Long value) {
            addCriterion("user_id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(Long value) {
            addCriterion("user_id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(Long value) {
            addCriterion("user_id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<Long> values) {
            addCriterion("user_id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<Long> values) {
            addCriterion("user_id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(Long value1, Long value2) {
            addCriterion("user_id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(Long value1, Long value2) {
            addCriterion("user_id not between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andArticleSummaryIsNull() {
            addCriterion("article_summary is null");
            return (Criteria) this;
        }

        public Criteria andArticleSummaryIsNotNull() {
            addCriterion("article_summary is not null");
            return (Criteria) this;
        }

        public Criteria andArticleSummaryEqualTo(String value) {
            addCriterion("article_summary =", value, "articleSummary");
            return (Criteria) this;
        }

        public Criteria andArticleSummaryNotEqualTo(String value) {
            addCriterion("article_summary <>", value, "articleSummary");
            return (Criteria) this;
        }

        public Criteria andArticleSummaryGreaterThan(String value) {
            addCriterion("article_summary >", value, "articleSummary");
            return (Criteria) this;
        }

        public Criteria andArticleSummaryGreaterThanOrEqualTo(String value) {
            addCriterion("article_summary >=", value, "articleSummary");
            return (Criteria) this;
        }

        public Criteria andArticleSummaryLessThan(String value) {
            addCriterion("article_summary <", value, "articleSummary");
            return (Criteria) this;
        }

        public Criteria andArticleSummaryLessThanOrEqualTo(String value) {
            addCriterion("article_summary <=", value, "articleSummary");
            return (Criteria) this;
        }

        public Criteria andArticleSummaryLike(String value) {
            addCriterion("article_summary like", value, "articleSummary");
            return (Criteria) this;
        }

        public Criteria andArticleSummaryNotLike(String value) {
            addCriterion("article_summary not like", value, "articleSummary");
            return (Criteria) this;
        }

        public Criteria andArticleSummaryIn(List<String> values) {
            addCriterion("article_summary in", values, "articleSummary");
            return (Criteria) this;
        }

        public Criteria andArticleSummaryNotIn(List<String> values) {
            addCriterion("article_summary not in", values, "articleSummary");
            return (Criteria) this;
        }

        public Criteria andArticleSummaryBetween(String value1, String value2) {
            addCriterion("article_summary between", value1, value2, "articleSummary");
            return (Criteria) this;
        }

        public Criteria andArticleSummaryNotBetween(String value1, String value2) {
            addCriterion("article_summary not between", value1, value2, "articleSummary");
            return (Criteria) this;
        }

        public Criteria andArticleWriterIsNull() {
            addCriterion("article_writer is null");
            return (Criteria) this;
        }

        public Criteria andArticleWriterIsNotNull() {
            addCriterion("article_writer is not null");
            return (Criteria) this;
        }

        public Criteria andArticleWriterEqualTo(String value) {
            addCriterion("article_writer =", value, "articleWriter");
            return (Criteria) this;
        }

        public Criteria andArticleWriterNotEqualTo(String value) {
            addCriterion("article_writer <>", value, "articleWriter");
            return (Criteria) this;
        }

        public Criteria andArticleWriterGreaterThan(String value) {
            addCriterion("article_writer >", value, "articleWriter");
            return (Criteria) this;
        }

        public Criteria andArticleWriterGreaterThanOrEqualTo(String value) {
            addCriterion("article_writer >=", value, "articleWriter");
            return (Criteria) this;
        }

        public Criteria andArticleWriterLessThan(String value) {
            addCriterion("article_writer <", value, "articleWriter");
            return (Criteria) this;
        }

        public Criteria andArticleWriterLessThanOrEqualTo(String value) {
            addCriterion("article_writer <=", value, "articleWriter");
            return (Criteria) this;
        }

        public Criteria andArticleWriterLike(String value) {
            addCriterion("article_writer like", value, "articleWriter");
            return (Criteria) this;
        }

        public Criteria andArticleWriterNotLike(String value) {
            addCriterion("article_writer not like", value, "articleWriter");
            return (Criteria) this;
        }

        public Criteria andArticleWriterIn(List<String> values) {
            addCriterion("article_writer in", values, "articleWriter");
            return (Criteria) this;
        }

        public Criteria andArticleWriterNotIn(List<String> values) {
            addCriterion("article_writer not in", values, "articleWriter");
            return (Criteria) this;
        }

        public Criteria andArticleWriterBetween(String value1, String value2) {
            addCriterion("article_writer between", value1, value2, "articleWriter");
            return (Criteria) this;
        }

        public Criteria andArticleWriterNotBetween(String value1, String value2) {
            addCriterion("article_writer not between", value1, value2, "articleWriter");
            return (Criteria) this;
        }

        public Criteria andArticleSourceIsNull() {
            addCriterion("article_source is null");
            return (Criteria) this;
        }

        public Criteria andArticleSourceIsNotNull() {
            addCriterion("article_source is not null");
            return (Criteria) this;
        }

        public Criteria andArticleSourceEqualTo(String value) {
            addCriterion("article_source =", value, "articleSource");
            return (Criteria) this;
        }

        public Criteria andArticleSourceNotEqualTo(String value) {
            addCriterion("article_source <>", value, "articleSource");
            return (Criteria) this;
        }

        public Criteria andArticleSourceGreaterThan(String value) {
            addCriterion("article_source >", value, "articleSource");
            return (Criteria) this;
        }

        public Criteria andArticleSourceGreaterThanOrEqualTo(String value) {
            addCriterion("article_source >=", value, "articleSource");
            return (Criteria) this;
        }

        public Criteria andArticleSourceLessThan(String value) {
            addCriterion("article_source <", value, "articleSource");
            return (Criteria) this;
        }

        public Criteria andArticleSourceLessThanOrEqualTo(String value) {
            addCriterion("article_source <=", value, "articleSource");
            return (Criteria) this;
        }

        public Criteria andArticleSourceLike(String value) {
            addCriterion("article_source like", value, "articleSource");
            return (Criteria) this;
        }

        public Criteria andArticleSourceNotLike(String value) {
            addCriterion("article_source not like", value, "articleSource");
            return (Criteria) this;
        }

        public Criteria andArticleSourceIn(List<String> values) {
            addCriterion("article_source in", values, "articleSource");
            return (Criteria) this;
        }

        public Criteria andArticleSourceNotIn(List<String> values) {
            addCriterion("article_source not in", values, "articleSource");
            return (Criteria) this;
        }

        public Criteria andArticleSourceBetween(String value1, String value2) {
            addCriterion("article_source between", value1, value2, "articleSource");
            return (Criteria) this;
        }

        public Criteria andArticleSourceNotBetween(String value1, String value2) {
            addCriterion("article_source not between", value1, value2, "articleSource");
            return (Criteria) this;
        }

        public Criteria andArticleHintsIsNull() {
            addCriterion("article_hints is null");
            return (Criteria) this;
        }

        public Criteria andArticleHintsIsNotNull() {
            addCriterion("article_hints is not null");
            return (Criteria) this;
        }

        public Criteria andArticleHintsEqualTo(Integer value) {
            addCriterion("article_hints =", value, "articleHints");
            return (Criteria) this;
        }

        public Criteria andArticleHintsNotEqualTo(Integer value) {
            addCriterion("article_hints <>", value, "articleHints");
            return (Criteria) this;
        }

        public Criteria andArticleHintsGreaterThan(Integer value) {
            addCriterion("article_hints >", value, "articleHints");
            return (Criteria) this;
        }

        public Criteria andArticleHintsGreaterThanOrEqualTo(Integer value) {
            addCriterion("article_hints >=", value, "articleHints");
            return (Criteria) this;
        }

        public Criteria andArticleHintsLessThan(Integer value) {
            addCriterion("article_hints <", value, "articleHints");
            return (Criteria) this;
        }

        public Criteria andArticleHintsLessThanOrEqualTo(Integer value) {
            addCriterion("article_hints <=", value, "articleHints");
            return (Criteria) this;
        }

        public Criteria andArticleHintsIn(List<Integer> values) {
            addCriterion("article_hints in", values, "articleHints");
            return (Criteria) this;
        }

        public Criteria andArticleHintsNotIn(List<Integer> values) {
            addCriterion("article_hints not in", values, "articleHints");
            return (Criteria) this;
        }

        public Criteria andArticleHintsBetween(Integer value1, Integer value2) {
            addCriterion("article_hints between", value1, value2, "articleHints");
            return (Criteria) this;
        }

        public Criteria andArticleHintsNotBetween(Integer value1, Integer value2) {
            addCriterion("article_hints not between", value1, value2, "articleHints");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeIsNull() {
            addCriterion("release_time is null");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeIsNotNull() {
            addCriterion("release_time is not null");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeEqualTo(String value) {
            addCriterion("release_time =", value, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeNotEqualTo(String value) {
            addCriterion("release_time <>", value, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeGreaterThan(String value) {
            addCriterion("release_time >", value, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeGreaterThanOrEqualTo(String value) {
            addCriterion("release_time >=", value, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeLessThan(String value) {
            addCriterion("release_time <", value, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeLessThanOrEqualTo(String value) {
            addCriterion("release_time <=", value, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeLike(String value) {
            addCriterion("release_time like", value, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeNotLike(String value) {
            addCriterion("release_time not like", value, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeIn(List<String> values) {
            addCriterion("release_time in", values, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeNotIn(List<String> values) {
            addCriterion("release_time not in", values, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeBetween(String value1, String value2) {
            addCriterion("release_time between", value1, value2, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andReleaseTimeNotBetween(String value1, String value2) {
            addCriterion("release_time not between", value1, value2, "releaseTime");
            return (Criteria) this;
        }

        public Criteria andArticlePowerIsNull() {
            addCriterion("article_power is null");
            return (Criteria) this;
        }

        public Criteria andArticlePowerIsNotNull() {
            addCriterion("article_power is not null");
            return (Criteria) this;
        }

        public Criteria andArticlePowerEqualTo(String value) {
            addCriterion("article_power =", value, "articlePower");
            return (Criteria) this;
        }

        public Criteria andArticlePowerNotEqualTo(String value) {
            addCriterion("article_power <>", value, "articlePower");
            return (Criteria) this;
        }

        public Criteria andArticlePowerGreaterThan(String value) {
            addCriterion("article_power >", value, "articlePower");
            return (Criteria) this;
        }

        public Criteria andArticlePowerGreaterThanOrEqualTo(String value) {
            addCriterion("article_power >=", value, "articlePower");
            return (Criteria) this;
        }

        public Criteria andArticlePowerLessThan(String value) {
            addCriterion("article_power <", value, "articlePower");
            return (Criteria) this;
        }

        public Criteria andArticlePowerLessThanOrEqualTo(String value) {
            addCriterion("article_power <=", value, "articlePower");
            return (Criteria) this;
        }

        public Criteria andArticlePowerLike(String value) {
            addCriterion("article_power like", value, "articlePower");
            return (Criteria) this;
        }

        public Criteria andArticlePowerNotLike(String value) {
            addCriterion("article_power not like", value, "articlePower");
            return (Criteria) this;
        }

        public Criteria andArticlePowerIn(List<String> values) {
            addCriterion("article_power in", values, "articlePower");
            return (Criteria) this;
        }

        public Criteria andArticlePowerNotIn(List<String> values) {
            addCriterion("article_power not in", values, "articlePower");
            return (Criteria) this;
        }

        public Criteria andArticlePowerBetween(String value1, String value2) {
            addCriterion("article_power between", value1, value2, "articlePower");
            return (Criteria) this;
        }

        public Criteria andArticlePowerNotBetween(String value1, String value2) {
            addCriterion("article_power not between", value1, value2, "articlePower");
            return (Criteria) this;
        }

        public Criteria andCheckUpIsNull() {
            addCriterion("check_up is null");
            return (Criteria) this;
        }

        public Criteria andCheckUpIsNotNull() {
            addCriterion("check_up is not null");
            return (Criteria) this;
        }

        public Criteria andCheckUpEqualTo(Integer value) {
            addCriterion("check_up =", value, "checkUp");
            return (Criteria) this;
        }

        public Criteria andCheckUpNotEqualTo(Integer value) {
            addCriterion("check_up <>", value, "checkUp");
            return (Criteria) this;
        }

        public Criteria andCheckUpGreaterThan(Integer value) {
            addCriterion("check_up >", value, "checkUp");
            return (Criteria) this;
        }

        public Criteria andCheckUpGreaterThanOrEqualTo(Integer value) {
            addCriterion("check_up >=", value, "checkUp");
            return (Criteria) this;
        }

        public Criteria andCheckUpLessThan(Integer value) {
            addCriterion("check_up <", value, "checkUp");
            return (Criteria) this;
        }

        public Criteria andCheckUpLessThanOrEqualTo(Integer value) {
            addCriterion("check_up <=", value, "checkUp");
            return (Criteria) this;
        }

        public Criteria andCheckUpIn(List<Integer> values) {
            addCriterion("check_up in", values, "checkUp");
            return (Criteria) this;
        }

        public Criteria andCheckUpNotIn(List<Integer> values) {
            addCriterion("check_up not in", values, "checkUp");
            return (Criteria) this;
        }

        public Criteria andCheckUpBetween(Integer value1, Integer value2) {
            addCriterion("check_up between", value1, value2, "checkUp");
            return (Criteria) this;
        }

        public Criteria andCheckUpNotBetween(Integer value1, Integer value2) {
            addCriterion("check_up not between", value1, value2, "checkUp");
            return (Criteria) this;
        }

        public Criteria andArticleCollectionIsNull() {
            addCriterion("article_collection is null");
            return (Criteria) this;
        }

        public Criteria andArticleCollectionIsNotNull() {
            addCriterion("article_collection is not null");
            return (Criteria) this;
        }

        public Criteria andArticleCollectionEqualTo(Integer value) {
            addCriterion("article_collection =", value, "articleCollection");
            return (Criteria) this;
        }

        public Criteria andArticleCollectionNotEqualTo(Integer value) {
            addCriterion("article_collection <>", value, "articleCollection");
            return (Criteria) this;
        }

        public Criteria andArticleCollectionGreaterThan(Integer value) {
            addCriterion("article_collection >", value, "articleCollection");
            return (Criteria) this;
        }

        public Criteria andArticleCollectionGreaterThanOrEqualTo(Integer value) {
            addCriterion("article_collection >=", value, "articleCollection");
            return (Criteria) this;
        }

        public Criteria andArticleCollectionLessThan(Integer value) {
            addCriterion("article_collection <", value, "articleCollection");
            return (Criteria) this;
        }

        public Criteria andArticleCollectionLessThanOrEqualTo(Integer value) {
            addCriterion("article_collection <=", value, "articleCollection");
            return (Criteria) this;
        }

        public Criteria andArticleCollectionIn(List<Integer> values) {
            addCriterion("article_collection in", values, "articleCollection");
            return (Criteria) this;
        }

        public Criteria andArticleCollectionNotIn(List<Integer> values) {
            addCriterion("article_collection not in", values, "articleCollection");
            return (Criteria) this;
        }

        public Criteria andArticleCollectionBetween(Integer value1, Integer value2) {
            addCriterion("article_collection between", value1, value2, "articleCollection");
            return (Criteria) this;
        }

        public Criteria andArticleCollectionNotBetween(Integer value1, Integer value2) {
            addCriterion("article_collection not between", value1, value2, "articleCollection");
            return (Criteria) this;
        }

        public Criteria andArticleUpIsNull() {
            addCriterion("article_up is null");
            return (Criteria) this;
        }

        public Criteria andArticleUpIsNotNull() {
            addCriterion("article_up is not null");
            return (Criteria) this;
        }

        public Criteria andArticleUpEqualTo(Integer value) {
            addCriterion("article_up =", value, "articleUp");
            return (Criteria) this;
        }

        public Criteria andArticleUpNotEqualTo(Integer value) {
            addCriterion("article_up <>", value, "articleUp");
            return (Criteria) this;
        }

        public Criteria andArticleUpGreaterThan(Integer value) {
            addCriterion("article_up >", value, "articleUp");
            return (Criteria) this;
        }

        public Criteria andArticleUpGreaterThanOrEqualTo(Integer value) {
            addCriterion("article_up >=", value, "articleUp");
            return (Criteria) this;
        }

        public Criteria andArticleUpLessThan(Integer value) {
            addCriterion("article_up <", value, "articleUp");
            return (Criteria) this;
        }

        public Criteria andArticleUpLessThanOrEqualTo(Integer value) {
            addCriterion("article_up <=", value, "articleUp");
            return (Criteria) this;
        }

        public Criteria andArticleUpIn(List<Integer> values) {
            addCriterion("article_up in", values, "articleUp");
            return (Criteria) this;
        }

        public Criteria andArticleUpNotIn(List<Integer> values) {
            addCriterion("article_up not in", values, "articleUp");
            return (Criteria) this;
        }

        public Criteria andArticleUpBetween(Integer value1, Integer value2) {
            addCriterion("article_up between", value1, value2, "articleUp");
            return (Criteria) this;
        }

        public Criteria andArticleUpNotBetween(Integer value1, Integer value2) {
            addCriterion("article_up not between", value1, value2, "articleUp");
            return (Criteria) this;
        }

        public Criteria andArticleDownIsNull() {
            addCriterion("article_down is null");
            return (Criteria) this;
        }

        public Criteria andArticleDownIsNotNull() {
            addCriterion("article_down is not null");
            return (Criteria) this;
        }

        public Criteria andArticleDownEqualTo(Integer value) {
            addCriterion("article_down =", value, "articleDown");
            return (Criteria) this;
        }

        public Criteria andArticleDownNotEqualTo(Integer value) {
            addCriterion("article_down <>", value, "articleDown");
            return (Criteria) this;
        }

        public Criteria andArticleDownGreaterThan(Integer value) {
            addCriterion("article_down >", value, "articleDown");
            return (Criteria) this;
        }

        public Criteria andArticleDownGreaterThanOrEqualTo(Integer value) {
            addCriterion("article_down >=", value, "articleDown");
            return (Criteria) this;
        }

        public Criteria andArticleDownLessThan(Integer value) {
            addCriterion("article_down <", value, "articleDown");
            return (Criteria) this;
        }

        public Criteria andArticleDownLessThanOrEqualTo(Integer value) {
            addCriterion("article_down <=", value, "articleDown");
            return (Criteria) this;
        }

        public Criteria andArticleDownIn(List<Integer> values) {
            addCriterion("article_down in", values, "articleDown");
            return (Criteria) this;
        }

        public Criteria andArticleDownNotIn(List<Integer> values) {
            addCriterion("article_down not in", values, "articleDown");
            return (Criteria) this;
        }

        public Criteria andArticleDownBetween(Integer value1, Integer value2) {
            addCriterion("article_down between", value1, value2, "articleDown");
            return (Criteria) this;
        }

        public Criteria andArticleDownNotBetween(Integer value1, Integer value2) {
            addCriterion("article_down not between", value1, value2, "articleDown");
            return (Criteria) this;
        }

        public Criteria andArticleStateIsNull() {
            addCriterion("article_state is null");
            return (Criteria) this;
        }

        public Criteria andArticleStateIsNotNull() {
            addCriterion("article_state is not null");
            return (Criteria) this;
        }

        public Criteria andArticleStateEqualTo(String value) {
            addCriterion("article_state =", value, "articleState");
            return (Criteria) this;
        }

        public Criteria andArticleStateNotEqualTo(String value) {
            addCriterion("article_state <>", value, "articleState");
            return (Criteria) this;
        }

        public Criteria andArticleStateGreaterThan(String value) {
            addCriterion("article_state >", value, "articleState");
            return (Criteria) this;
        }

        public Criteria andArticleStateGreaterThanOrEqualTo(String value) {
            addCriterion("article_state >=", value, "articleState");
            return (Criteria) this;
        }

        public Criteria andArticleStateLessThan(String value) {
            addCriterion("article_state <", value, "articleState");
            return (Criteria) this;
        }

        public Criteria andArticleStateLessThanOrEqualTo(String value) {
            addCriterion("article_state <=", value, "articleState");
            return (Criteria) this;
        }

        public Criteria andArticleStateLike(String value) {
            addCriterion("article_state like", value, "articleState");
            return (Criteria) this;
        }

        public Criteria andArticleStateNotLike(String value) {
            addCriterion("article_state not like", value, "articleState");
            return (Criteria) this;
        }

        public Criteria andArticleStateIn(List<String> values) {
            addCriterion("article_state in", values, "articleState");
            return (Criteria) this;
        }

        public Criteria andArticleStateNotIn(List<String> values) {
            addCriterion("article_state not in", values, "articleState");
            return (Criteria) this;
        }

        public Criteria andArticleStateBetween(String value1, String value2) {
            addCriterion("article_state between", value1, value2, "articleState");
            return (Criteria) this;
        }

        public Criteria andArticleStateNotBetween(String value1, String value2) {
            addCriterion("article_state not between", value1, value2, "articleState");
            return (Criteria) this;
        }

        public Criteria andArticleAvatarIsNull() {
            addCriterion("article_avatar is null");
            return (Criteria) this;
        }

        public Criteria andArticleAvatarIsNotNull() {
            addCriterion("article_avatar is not null");
            return (Criteria) this;
        }

        public Criteria andArticleAvatarEqualTo(String value) {
            addCriterion("article_avatar =", value, "articleAvatar");
            return (Criteria) this;
        }

        public Criteria andArticleAvatarNotEqualTo(String value) {
            addCriterion("article_avatar <>", value, "articleAvatar");
            return (Criteria) this;
        }

        public Criteria andArticleAvatarGreaterThan(String value) {
            addCriterion("article_avatar >", value, "articleAvatar");
            return (Criteria) this;
        }

        public Criteria andArticleAvatarGreaterThanOrEqualTo(String value) {
            addCriterion("article_avatar >=", value, "articleAvatar");
            return (Criteria) this;
        }

        public Criteria andArticleAvatarLessThan(String value) {
            addCriterion("article_avatar <", value, "articleAvatar");
            return (Criteria) this;
        }

        public Criteria andArticleAvatarLessThanOrEqualTo(String value) {
            addCriterion("article_avatar <=", value, "articleAvatar");
            return (Criteria) this;
        }

        public Criteria andArticleAvatarLike(String value) {
            addCriterion("article_avatar like", value, "articleAvatar");
            return (Criteria) this;
        }

        public Criteria andArticleAvatarNotLike(String value) {
            addCriterion("article_avatar not like", value, "articleAvatar");
            return (Criteria) this;
        }

        public Criteria andArticleAvatarIn(List<String> values) {
            addCriterion("article_avatar in", values, "articleAvatar");
            return (Criteria) this;
        }

        public Criteria andArticleAvatarNotIn(List<String> values) {
            addCriterion("article_avatar not in", values, "articleAvatar");
            return (Criteria) this;
        }

        public Criteria andArticleAvatarBetween(String value1, String value2) {
            addCriterion("article_avatar between", value1, value2, "articleAvatar");
            return (Criteria) this;
        }

        public Criteria andArticleAvatarNotBetween(String value1, String value2) {
            addCriterion("article_avatar not between", value1, value2, "articleAvatar");
            return (Criteria) this;
        }

        public Criteria andArticleBigIsNull() {
            addCriterion("article_big is null");
            return (Criteria) this;
        }

        public Criteria andArticleBigIsNotNull() {
            addCriterion("article_big is not null");
            return (Criteria) this;
        }

        public Criteria andArticleBigEqualTo(Integer value) {
            addCriterion("article_big =", value, "articleBig");
            return (Criteria) this;
        }

        public Criteria andArticleBigNotEqualTo(Integer value) {
            addCriterion("article_big <>", value, "articleBig");
            return (Criteria) this;
        }

        public Criteria andArticleBigGreaterThan(Integer value) {
            addCriterion("article_big >", value, "articleBig");
            return (Criteria) this;
        }

        public Criteria andArticleBigGreaterThanOrEqualTo(Integer value) {
            addCriterion("article_big >=", value, "articleBig");
            return (Criteria) this;
        }

        public Criteria andArticleBigLessThan(Integer value) {
            addCriterion("article_big <", value, "articleBig");
            return (Criteria) this;
        }

        public Criteria andArticleBigLessThanOrEqualTo(Integer value) {
            addCriterion("article_big <=", value, "articleBig");
            return (Criteria) this;
        }

        public Criteria andArticleBigIn(List<Integer> values) {
            addCriterion("article_big in", values, "articleBig");
            return (Criteria) this;
        }

        public Criteria andArticleBigNotIn(List<Integer> values) {
            addCriterion("article_big not in", values, "articleBig");
            return (Criteria) this;
        }

        public Criteria andArticleBigBetween(Integer value1, Integer value2) {
            addCriterion("article_big between", value1, value2, "articleBig");
            return (Criteria) this;
        }

        public Criteria andArticleBigNotBetween(Integer value1, Integer value2) {
            addCriterion("article_big not between", value1, value2, "articleBig");
            return (Criteria) this;
        }

        public Criteria andArticleFirstIsNull() {
            addCriterion("article_first is null");
            return (Criteria) this;
        }

        public Criteria andArticleFirstIsNotNull() {
            addCriterion("article_first is not null");
            return (Criteria) this;
        }

        public Criteria andArticleFirstEqualTo(Integer value) {
            addCriterion("article_first =", value, "articleFirst");
            return (Criteria) this;
        }

        public Criteria andArticleFirstNotEqualTo(Integer value) {
            addCriterion("article_first <>", value, "articleFirst");
            return (Criteria) this;
        }

        public Criteria andArticleFirstGreaterThan(Integer value) {
            addCriterion("article_first >", value, "articleFirst");
            return (Criteria) this;
        }

        public Criteria andArticleFirstGreaterThanOrEqualTo(Integer value) {
            addCriterion("article_first >=", value, "articleFirst");
            return (Criteria) this;
        }

        public Criteria andArticleFirstLessThan(Integer value) {
            addCriterion("article_first <", value, "articleFirst");
            return (Criteria) this;
        }

        public Criteria andArticleFirstLessThanOrEqualTo(Integer value) {
            addCriterion("article_first <=", value, "articleFirst");
            return (Criteria) this;
        }

        public Criteria andArticleFirstIn(List<Integer> values) {
            addCriterion("article_first in", values, "articleFirst");
            return (Criteria) this;
        }

        public Criteria andArticleFirstNotIn(List<Integer> values) {
            addCriterion("article_first not in", values, "articleFirst");
            return (Criteria) this;
        }

        public Criteria andArticleFirstBetween(Integer value1, Integer value2) {
            addCriterion("article_first between", value1, value2, "articleFirst");
            return (Criteria) this;
        }

        public Criteria andArticleFirstNotBetween(Integer value1, Integer value2) {
            addCriterion("article_first not between", value1, value2, "articleFirst");
            return (Criteria) this;
        }

        public Criteria andSourceUrlIsNull() {
            addCriterion("source_url is null");
            return (Criteria) this;
        }

        public Criteria andSourceUrlIsNotNull() {
            addCriterion("source_url is not null");
            return (Criteria) this;
        }

        public Criteria andSourceUrlEqualTo(String value) {
            addCriterion("source_url =", value, "sourceUrl");
            return (Criteria) this;
        }

        public Criteria andSourceUrlNotEqualTo(String value) {
            addCriterion("source_url <>", value, "sourceUrl");
            return (Criteria) this;
        }

        public Criteria andSourceUrlGreaterThan(String value) {
            addCriterion("source_url >", value, "sourceUrl");
            return (Criteria) this;
        }

        public Criteria andSourceUrlGreaterThanOrEqualTo(String value) {
            addCriterion("source_url >=", value, "sourceUrl");
            return (Criteria) this;
        }

        public Criteria andSourceUrlLessThan(String value) {
            addCriterion("source_url <", value, "sourceUrl");
            return (Criteria) this;
        }

        public Criteria andSourceUrlLessThanOrEqualTo(String value) {
            addCriterion("source_url <=", value, "sourceUrl");
            return (Criteria) this;
        }

        public Criteria andSourceUrlLike(String value) {
            addCriterion("source_url like", value, "sourceUrl");
            return (Criteria) this;
        }

        public Criteria andSourceUrlNotLike(String value) {
            addCriterion("source_url not like", value, "sourceUrl");
            return (Criteria) this;
        }

        public Criteria andSourceUrlIn(List<String> values) {
            addCriterion("source_url in", values, "sourceUrl");
            return (Criteria) this;
        }

        public Criteria andSourceUrlNotIn(List<String> values) {
            addCriterion("source_url not in", values, "sourceUrl");
            return (Criteria) this;
        }

        public Criteria andSourceUrlBetween(String value1, String value2) {
            addCriterion("source_url between", value1, value2, "sourceUrl");
            return (Criteria) this;
        }

        public Criteria andSourceUrlNotBetween(String value1, String value2) {
            addCriterion("source_url not between", value1, value2, "sourceUrl");
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