package com.zjnu.dao;

import com.zjnu.model.ArticleRating;
import com.zjnu.model.ArticleRatingExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleRatingMapper {
    long countByExample(ArticleRatingExample example);

    int deleteByExample(ArticleRatingExample example);

    int insert(ArticleRating record);

    int insertSelective(ArticleRating record);

    List<ArticleRating> selectByExample(ArticleRatingExample example);

    int updateByExampleSelective(@Param("record") ArticleRating record, @Param("example") ArticleRatingExample example);

    int updateByExample(@Param("record") ArticleRating record, @Param("example") ArticleRatingExample example);
}