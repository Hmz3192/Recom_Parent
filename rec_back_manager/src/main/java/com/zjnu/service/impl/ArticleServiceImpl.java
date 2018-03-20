package com.zjnu.service.impl;

import com.zjnu.dao.ArticleMapper;
import com.zjnu.model.Article;
import com.zjnu.model.ArticleExample;
import com.zjnu.service.ArticleService;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {

    @Resource
    public ArticleMapper articleMapper;

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

    @Cacheable(value = "ArticleService")
    @Override
    public List<Article> getAllSendByState(Integer state) {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andArticleStateEqualTo("已发布");
        criteria.andCheckUpEqualTo(state);
        criteria.andCheckUpNotEqualTo(3);
        List<Article> articles = articleMapper.selectByExample(example);
        return articles;
    }

    @Cacheable(value = "ArticleService")
    @Override
    public Article getOneById(Integer articleId) {
        return articleMapper.selectByPrimaryKey(Long.valueOf(articleId));
    }

    @CachePut(value = "ArticleService")
    @Override
    public Article updateIndex(Article article) {
        articleMapper.updateByPrimaryKeySelective(article);
        return article;
    }

    @Cacheable(value = "ArticleService")
    @Override
    public List<Article> getAllSave() {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andArticleStateEqualTo("已保存");
        List<Article> articles = articleMapper.selectByExample(example);
        return articles;

    }
}
