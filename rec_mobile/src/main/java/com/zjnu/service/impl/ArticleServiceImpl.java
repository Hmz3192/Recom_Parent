package com.zjnu.service.impl;

import com.zjnu.dao.ArticleMapper;
import com.zjnu.model.Article;
import com.zjnu.model.ArticleExample;
import com.zjnu.service.ArticleService;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/3/16.
 */
@Service
@Transactional
public class ArticleServiceImpl implements ArticleService{

    @Resource
    private ArticleMapper articleMapper;

    @Cacheable(value = "ArticleService")
    @Override
    public List<Article> getAllArticlesByKind(String kind) {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andKindParentNameIsNotNull();
        criteria.andKindParentNameEqualTo(kind);
        example.setOrderByClause("article_hints DESC");
        List<Article> articles = articleMapper.selectByExample(example);
        return articles;
    }


    @Cacheable(value = "ArticleService")
    @Override
    public List<Article> getAllSend() {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andArticleStateEqualTo("已发布");
        criteria.andCheckUpNotEqualTo(3);
        example.setOrderByClause("check_up ASC");
        List<Article> articles = articleMapper.selectByExample(example);
        return articles;
    }

    @Cacheable(value = {"ArticleCache"})
    @Override
    public Article getOne(Long articleID) {
        return articleMapper.selectByPrimaryKey(articleID);
    }


}
