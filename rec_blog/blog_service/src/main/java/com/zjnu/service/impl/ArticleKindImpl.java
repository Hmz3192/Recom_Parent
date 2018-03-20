package com.zjnu.service.impl;

import com.zjnu.dao.ArticleKindMapper;
import com.zjnu.model.ArticleKind;
import com.zjnu.model.ArticleKindExample;
import com.zjnu.service.ArticleKindService;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/24.
 */
@Service
@Transactional
public class ArticleKindImpl implements ArticleKindService {
    @Resource
    private ArticleKindMapper articleKindMapper;

    @Cacheable(value = "ArticleKindCache")
    @Override
    public List<ArticleKind> getAllPKind() {
        ArticleKindExample example = new ArticleKindExample();
        ArticleKindExample.Criteria criteria = example.createCriteria();
        criteria.andParentIdEqualTo(0);
        return articleKindMapper.selectByExample(example);
    }

    @Cacheable(value = "ArticleKindCache")
    @Override
    public List<ArticleKind> getChildKind(String PName) {
        ArticleKindExample example = new ArticleKindExample();
        ArticleKindExample.Criteria criteria = example.createCriteria();
        criteria.andKindNameEqualTo(PName);
        List<ArticleKind> ParticleKinds = articleKindMapper.selectByExample(example);
        ArticleKindExample example2 = new ArticleKindExample();
        ArticleKindExample.Criteria criteria2 = example2.createCriteria();
        criteria2.andParentIdEqualTo(Integer.valueOf(ParticleKinds.get(0).getKindId().toString()));
        List<ArticleKind> CParticleKinds = articleKindMapper.selectByExample(example2);
        return CParticleKinds;
    }

    @Override
    public List<ArticleKind> getPCKind(String pKindName, String cKindName) {
        ArticleKindExample example1 = new ArticleKindExample();
        ArticleKindExample.Criteria criteria1 = example1.createCriteria();
        criteria1.andKindNameEqualTo(pKindName);
        List<ArticleKind> articlePKind = articleKindMapper.selectByExample(example1);


        ArticleKindExample example2 = new ArticleKindExample();
        ArticleKindExample.Criteria criteria2 = example2.createCriteria();
        criteria2.andKindNameEqualTo(cKindName);
        List<ArticleKind> articleCKind = articleKindMapper.selectByExample(example2);

        List<ArticleKind> articleKinds = new ArrayList<ArticleKind>();
        articleKinds.add(articlePKind.get(0));
        articleKinds.add(articleCKind.get(0));
        return articleKinds;
    }

}
