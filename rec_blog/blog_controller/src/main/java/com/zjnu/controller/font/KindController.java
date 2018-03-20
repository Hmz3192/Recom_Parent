package com.zjnu.controller.font;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjnu.model.Article;
import com.zjnu.pojo.PageResult;
import com.zjnu.service.ArticleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class KindController {

    @Resource
    private ArticleService articleService;

    //选择类型
    @RequestMapping("/sk")
    @ResponseBody
    public PageResult sk(String kind,int currentPage,int rows) {
        PageHelper.startPage(currentPage, rows);
        List<Article> articles = articleService.getArticleByKind(kind);
        PageInfo<Article> info = new PageInfo<Article>(articles);
        long total;
        if (info.getTotal() % rows == 0) {
            total = info.getTotal() / rows;
        } else
            total = info.getTotal() / rows + 1;
        PageResult pageResult = new PageResult(total, articles, currentPage);

        return pageResult;
    }
}
