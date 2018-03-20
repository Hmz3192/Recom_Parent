package com.zjnu.service;

import com.zjnu.model.ArticleRating;

import java.util.List;

public interface RatingService {

    void insertOneRating(ArticleRating articleRating);

    List<ArticleRating> getArticleRating();
}
