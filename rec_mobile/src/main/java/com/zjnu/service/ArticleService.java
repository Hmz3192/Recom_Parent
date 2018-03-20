package com.zjnu.service;

import com.zjnu.model.Article;

import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/3/16.
 */
public interface ArticleService {

    List<Article> getAllArticlesByKind(String kind);

    List<Article> getAllSend();

    Article getOne(Long articleID);

}
