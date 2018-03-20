package com.zjnu.service.impl;

import com.zjnu.dao.ArticleRatingMapper;
import com.zjnu.model.ArticleRating;
import com.zjnu.model.ArticleRatingExample;
import com.zjnu.service.ArticleRatingService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional
public class ArticleRatingServiceImpl implements ArticleRatingService {


    @Resource
    private ArticleRatingMapper articleRatingMapper;
    @Override
    public void insertOneorUpdate(ArticleRating articleRating) {
        ArticleRatingExample ratingExample = new ArticleRatingExample();
        ArticleRatingExample.Criteria criteria = ratingExample.createCriteria();
        criteria.andArticleIdEqualTo(articleRating.getArticleId());
        criteria.andUserIdEqualTo(articleRating.getUserId());
        long l = articleRatingMapper.countByExample(ratingExample);
        if (l == 0) {
            articleRatingMapper.insertSelective(articleRating);
        } else {
            articleRatingMapper.updateByExample(articleRating, ratingExample);
        }

    }

}
