package com.zjnu.service.impl;

import com.zjnu.dao.ArticleMapper;
import com.zjnu.model.Article;
import com.zjnu.model.ArticleExample;
import com.zjnu.pojo.AritlceNumber;
import com.zjnu.service.ArticleService;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/23.
 */
@Service
@Transactional
public class ArticleServicelmpl implements ArticleService {

    @Resource
    private ArticleMapper articleMapper;

    @Cacheable(value = {"ArticleCache"})
    @Override
    public List<Article> selectAllArticle() {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        example.setOrderByClause("article_up DESC,article_hints DESC ");
        List<Article> articles = articleMapper.selectByExample(example);
        return articles;
    }

    @Override
    public List<Article> selectAllMyArticle(Long userId, Integer statue) {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andUserIdEqualTo(userId);
        //已发布
        if (statue == 1) {
            criteria.andCheckUpEqualTo(1);
            criteria.andArticleStateEqualTo("已发布");
        } else if (statue == 2) {
            //审核失败
            criteria.andCheckUpEqualTo(2);
            criteria.andArticleStateEqualTo("已发布");
        }else if (statue == 0) {
            //审核中
            criteria.andCheckUpEqualTo(0);
            criteria.andArticleStateEqualTo("已发布");
        }else if (statue == 3) {
            //草稿
            criteria.andCheckUpEqualTo(3);
            criteria.andArticleStateEqualTo("已保存");
        }
        example.setOrderByClause("release_time DESC");
        List<Article> articles = articleMapper.selectByExample(example);
        return articles;
    }

    @CacheEvict(value = "ArticleCache", allEntries = true)
    @Override
    public boolean saveBlog(Article article) {

        ArticleExample example0 = new ArticleExample();
        ArticleExample.Criteria criteria0 = example0.createCriteria();
        criteria0.andArticleIdEqualTo(article.getArticleId());
        List<Article> articles = articleMapper.selectByExample(example0);
        if (articles.size() > 0) {
            //更新保存
            ArticleExample example = new ArticleExample();
            ArticleExample.Criteria criteria = example.createCriteria();
            criteria.andArticleIdEqualTo(article.getArticleId());
            articleMapper.updateByExample(article, example);
        } else {
            //插入保存
            articleMapper.insert(article);
        }
        return true;
    }


    @Cacheable(value = {"ArticleCache"})
    @Override
    public Article getOne(Long articleID) {
        return articleMapper.selectByPrimaryKey(articleID);
    }

    @Cacheable(value = {"ArticleCache"})
    @Override
    public List<Article> selectMyArticles(Long userId) {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andUserIdEqualTo(userId);
        List<Article> articles = articleMapper.selectByExample(example);
        return articles;
    }
    @CacheEvict(value = "ArticleCache")
    @Override
    public Integer updateOne(Article article) {
        ArticleExample example0 = new ArticleExample();
        ArticleExample.Criteria criteria0 = example0.createCriteria();
        criteria0.andArticleIdEqualTo(article.getArticleId());
        int i = articleMapper.updateByExampleSelective(article, example0);
        return i;
    }

    @CachePut(value = "ArticleCache")
    @Override
    public void insertone(Article article) {
        articleMapper.insertSelective(article);
    }


    @Cacheable(value = {"ArticleCache"})
    @Override
    public List<Article> selectFirstFiveArticle() {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        example.setOrderByClause("article_hints DESC,article_up DESC ");
        List<Article> articles = articleMapper.selectByExample(example);
        return articles;
    }

    @Override
    public List<Article> selectByArray(Long[] array) {
        List<Article> articles = articleMapper.selectByArray(array);
        return articles;

        /* //自定义
    List<Article> selectByArray(Long[] array);

    <select id="selectByArray" resultMap="BaseResultMap">
    select
            <include refid="Base_Column_List" />
            from article
    where article_id IN
            <foreach collection="array" item="array" index="index" open="(" separator="," close=")">
            #{array}
    </foreach>
  </select>*/
    }

    @Override
    public AritlceNumber loadnum(Long userId) {
        AritlceNumber aritlceNumber = new AritlceNumber();

        for(int i=0;i<4;i++) {
            //已发布
            if (i == 1) {
                ArticleExample example = new ArticleExample();
                ArticleExample.Criteria criteria = example.createCriteria();
                criteria.andUserIdEqualTo(userId);
                criteria.andCheckUpEqualTo(1);
                criteria.andArticleStateEqualTo("已发布");
                long l = articleMapper.countByExample(example);
                aritlceNumber.setYf(l);

            } else if (i == 2) {
                ArticleExample example = new ArticleExample();
                ArticleExample.Criteria criteria = example.createCriteria();
                criteria.andUserIdEqualTo(userId);
                //审核失败
                criteria.andCheckUpEqualTo(2);
                criteria.andArticleStateEqualTo("已发布");
                long l = articleMapper.countByExample(example);
                aritlceNumber.setWg(l);

            }else if (i == 0) {
                ArticleExample example = new ArticleExample();
                ArticleExample.Criteria criteria = example.createCriteria();
                criteria.andUserIdEqualTo(userId);
                //审核中
                criteria.andCheckUpEqualTo(0);
                criteria.andArticleStateEqualTo("已发布");
                long l = articleMapper.countByExample(example);
                aritlceNumber.setSh(l);

            }else if (i == 3) {
                ArticleExample example = new ArticleExample();
                ArticleExample.Criteria criteria = example.createCriteria();
                criteria.andUserIdEqualTo(userId);
                //草稿
                criteria.andCheckUpEqualTo(3);
                criteria.andArticleStateEqualTo("已保存");
                long l = articleMapper.countByExample(example);
                aritlceNumber.setCg(l);

            }
        }

        return aritlceNumber;
    }

    @Override
    public void updateAll(String art) {
        Article article = new Article();
        article.setArticleContent(art);
        ArticleExample example = new ArticleExample();
        articleMapper.updateByExampleSelective(article, example);
    }

    @Override
    public List<Article> selectTrain() {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andKindParentNameIsNotNull();
        List<Article> articles = articleMapper.selectByExample(example);
        return articles;
    }

    @Override
    public List<Article> getArticleByKind(String kind) {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andKindParentNameIsNotNull();
        criteria.andKindParentNameEqualTo(kind);
        example.setOrderByClause("article_hints DESC");
        List<Article> articles = articleMapper.selectByExample(example);
        return articles;
    }

}
