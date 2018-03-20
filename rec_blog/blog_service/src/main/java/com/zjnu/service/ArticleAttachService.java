package com.zjnu.service;

import com.zjnu.model.ArticleAttach;
import com.zjnu.pojo.ArticleAttachPojo;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/25.
 */
public interface ArticleAttachService {

    ArticleAttachPojo getOneByArticleId(Long articlID);

    void saveAttache(ArticleAttach articleAttach);

    void insertAttache(ArticleAttach articleAttach);
}
