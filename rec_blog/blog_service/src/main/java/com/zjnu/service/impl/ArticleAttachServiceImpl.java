package com.zjnu.service.impl;

import com.zjnu.dao.ArticleAttachMapper;
import com.zjnu.model.ArticleAttach;
import com.zjnu.model.ArticleAttachExample;
import com.zjnu.pojo.ArticleAttachPojo;
import com.zjnu.service.ArticleAttachService;
import com.zjnu.utils.StringUtil;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/25.
 */
@Service
@Transactional
public class ArticleAttachServiceImpl implements ArticleAttachService {

    @Resource
    private ArticleAttachMapper articleAttachMapper;

    @Cacheable(value = "ArticleAttachCache")
    @Override
    public ArticleAttachPojo getOneByArticleId(Long articleID) {
        ArticleAttachPojo articleAttachPojo = new ArticleAttachPojo();
        ArticleAttachExample example = new ArticleAttachExample();
        ArticleAttachExample.Criteria criteria = example.createCriteria();
        criteria.andArticleIdEqualTo(articleID);
        List<ArticleAttach> articleAttaches = articleAttachMapper.selectByExample(example);
        articleAttachPojo.setArticleAttach(articleAttaches.get(0));
        if (articleAttaches.get(0).getTagNumber() != 0) {
            articleAttachPojo.setTags(StringUtil.ConvertStringToList(articleAttaches.get(0).getTags()));
        } else {
            List<String> list = new ArrayList<>();
            list.add("Tag1");
            list.add("Tag2");
            articleAttachPojo.setTags(list);
        }

//        articleAttachPojo.setPics(StringUtil.ConvertStringToList(articleAttaches.get(0).getPics()));
        return articleAttachPojo;
    }

    @Override
    public void saveAttache(ArticleAttach articleAttach) {
        ArticleAttachExample example0 = new ArticleAttachExample();
        ArticleAttachExample.Criteria criteria0 = example0.createCriteria();
        criteria0.andArticleIdEqualTo(articleAttach.getArticleId());
        List<ArticleAttach> articleAttaches = articleAttachMapper.selectByExample(example0);
        if (articleAttaches.size() > 0) {
            //更新保存
            ArticleAttachExample example = new ArticleAttachExample();
            ArticleAttachExample.Criteria criteria = example.createCriteria();
            criteria.andArticleIdEqualTo(articleAttach.getArticleId());
            articleAttachMapper.updateByExample(articleAttach, example);
        } else {
            //插入保存
            articleAttachMapper.insert(articleAttach);
        }
    }

    @Override
    public void insertAttache(ArticleAttach articleAttach) {
        articleAttachMapper.insertSelective(articleAttach);
    }
}
