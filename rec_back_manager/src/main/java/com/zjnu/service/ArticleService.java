package com.zjnu.service;

import com.zjnu.model.Article;

import java.util.List;

public interface ArticleService {

    List<Article> getAllSend();

    List<Article> getAllSendByState(Integer state);

    Article getOneById(Integer articleId);

    Article updateIndex(Article article);

    List<Article> getAllSave();
}
