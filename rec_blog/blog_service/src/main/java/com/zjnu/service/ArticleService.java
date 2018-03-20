package com.zjnu.service;

import com.zjnu.model.Article;
import com.zjnu.pojo.AritlceNumber;

import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/23.
 */
public interface ArticleService {

    List<Article> selectAllArticle();

    List<Article> selectAllMyArticle(Long userId, Integer statue);


    boolean saveBlog(Article article);

    Article getOne(Long articleID);

    List<Article> selectMyArticles(Long userId);

    Integer updateOne(Article article);

    void insertone(Article article);

    List<Article> selectFirstFiveArticle();

    List<Article> selectByArray(Long[] array);

    AritlceNumber loadnum(Long userId);

    void updateAll(String art);

    List<Article> selectTrain();

    List<Article> getArticleByKind(String kind);
}
