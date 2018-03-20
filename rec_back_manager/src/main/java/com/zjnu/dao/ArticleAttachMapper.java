package com.zjnu.dao;

import com.zjnu.model.ArticleAttach;
import com.zjnu.model.ArticleAttachExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleAttachMapper {
    long countByExample(ArticleAttachExample example);

    int deleteByExample(ArticleAttachExample example);

    int insert(ArticleAttach record);

    int insertSelective(ArticleAttach record);

    List<ArticleAttach> selectByExample(ArticleAttachExample example);

    int updateByExampleSelective(@Param("record") ArticleAttach record, @Param("example") ArticleAttachExample example);

    int updateByExample(@Param("record") ArticleAttach record, @Param("example") ArticleAttachExample example);
}