package com.zjnu.bayesian;

import com.zjnu.model.Article;

import java.io.*;
import java.util.*;

/**
 * <p>Title:TrainSmapleDataManager</p>
 * <p>Description: 训练样本管理器
 * </p>
 */
public class TrainSampleDataManager {
    /**
     * 整个训练样本的单词总数,包含重复的单词数
     */
    private static Long count = 0L;

    /**
     * 所有单词数统计Map
     */
    private static Map<String, Map<String, Map<String, Long>>> allWordsMap = new HashMap<String, Map<String, Map<String, Long>>>();

    /**
     * V是训练样本的单词表(即抽取单词，单词出现多次，只算一个)
     */
    private static Long kindCount = 0L;

    /**
     * @param @param  classifier
     * @param @return
     * @return Long
     * @throws
     * @Title: classWordCount
     * @Description: 类c下单词总数
     */
    public static Long classWordCount(String classifier) {
        Map<String, Map<String, Long>> classifierMap = allWordsMap.get(classifier);
        if (classifierMap == null) {
            return 0L;
        }
        Set<String> articleSet = classifierMap.keySet();
        Long sum = 0L;
        for (String article : articleSet) {
            Map<String, Long> articleMap = classifierMap.get(article);
            Set<String> wordsSet = articleMap.keySet();
            for (String words : wordsSet) {
                sum += articleMap.get(words);
            }
        }
        return sum;
    }

    /**
     * @param @return
     * @return Long
     * @throws
     * @Title: sampleWordCount
     * @Description: 整个训练样本的单词总数, 包含重复的单词数
     */
    public static Long sampleWordCount() {
        if (count != 0L) {
            return count;
        }
        Set<String> classifierSet = allWordsMap.keySet();
        Long sum = 0L;
        for (String classifierName : classifierSet) {
            Map<String, Map<String, Long>> classifierMap = allWordsMap.get(classifierName);
            Set<String> articleSet = classifierMap.keySet();
            for (String article : articleSet) {
                Map<String, Long> articleMap = classifierMap.get(article);
                Set<String> wordsSet = articleMap.keySet();
                for (String words : wordsSet) {
                    sum += articleMap.get(words);
                }
            }
        }
        count = sum;
        return count;

    }

    /**
     * @param @param  word
     * @param @param  classifier
     * @param @return
     * @return Long
     * @throws
     * @Title: wordInClassCount
     * @Description: 类c下单词tk在各个文档中出现过的次数之和
     */
    public static Long wordInClassCount(String word, String classifier) {
        Long sum = 0L;
        Map<String, Map<String, Long>> classifierMap = allWordsMap.get(classifier);
        Set<String> articleSet = classifierMap.keySet();
        for (String article : articleSet) {
            Map<String, Long> articleMap = classifierMap.get(article);
            Long value = articleMap.get(word);
            if (value != null && value > 0) {
                sum += articleMap.get(word);
            }

        }
        return sum;
    }

    /**
     * @param @return
     * @return Long
     * @throws
     * @Title: sampleWordKindCount
     * @Description: V是训练样本的单词表(即抽取单词，单词出现多次，只算一个)
     * |V|则表示训练样本包含多少种单词。
     */
    public static Long sampleWordKindCount() {
        if (kindCount != 0L) {
            return kindCount;
        }
        Set<String> classifierSet = allWordsMap.keySet();
        Long sum = 0L;
        for (String classifierName : classifierSet) {
            Map<String, Map<String, Long>> classifierMap = allWordsMap.get(classifierName);
            Set<String> articleSet = classifierMap.keySet();
            for (String article : articleSet) {
                Map<String, Long> articleMap = classifierMap.get(article);
                sum += articleMap.size();
            }
        }
        kindCount = sum;
        return kindCount;
    }



    /**
     * @Title: process
     * @Description: 对训练样本进行处理
     */
    public static void process(List<Article> articles) {
        try {
            for (Article article : articles) {
                String title = article.getArticleTitle() + "," + article.getArticleSource();
                String id = String.valueOf(article.getArticleId());
                String kind = article.getKindParentName();
                //es-ik分词
                Map<String, Long> wordsMap = ChineseTokenizer.segStr(title);
                if (allWordsMap.containsKey(kind)) {
                    Map<String, Map<String, Long>> classifierValue = allWordsMap.get(kind);
                    classifierValue.put(id, wordsMap);
                    allWordsMap.put(kind, classifierValue);
                } else {
                    Map<String, Map<String, Long>> classifierValue = new HashMap<String, Map<String, Long>>();
                    classifierValue.put(id, wordsMap);
                    allWordsMap.put(kind, classifierValue);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * @return Set<String>
     * @Title: getAllClassifiers
     * @Description: 所有文本分类
     */
    public static Set<String> getAllClassifiers() {
        return allWordsMap.keySet();
    }
}
