package com.zjnu.pojo;

import com.zjnu.model.ArticleAttach;

import java.util.List;

/**
 * @Author Hu mingzhi
 * Created by ThinKPad on 2018/1/25.
 */
public class ArticleAttachPojo {
    private List<String> tags;
    private List<String> pics;
    private ArticleAttach articleAttach;

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }

    public List<String> getPics() {
        return pics;
    }

    public void setPics(List<String> pics) {
        this.pics = pics;
    }

    public ArticleAttachPojo(List<String> tags, List<String> pics, ArticleAttach articleAttach) {

        this.tags = tags;
        this.pics = pics;
        this.articleAttach = articleAttach;
    }

    public ArticleAttach getArticleAttach() {
        return articleAttach;
    }

    public void setArticleAttach(ArticleAttach articleAttach) {
        this.articleAttach = articleAttach;
    }

    public ArticleAttachPojo() {
    }

}
