package com.zjnu.service;

import com.zjnu.model.ArticleKind;

import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/24.
 */
public interface ArticleKindService {

    List<ArticleKind> getAllPKind();

    List<ArticleKind> getChildKind(String PName);

    List<ArticleKind> getPCKind(String pKindName, String cKindName);

}
