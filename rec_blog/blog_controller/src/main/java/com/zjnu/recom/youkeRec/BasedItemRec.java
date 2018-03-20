package com.zjnu.recom.youkeRec;

import com.zjnu.model.ArticleRating;
import com.zjnu.recom.booleanrec.MovieLensDataModel;
import com.zjnu.utils.FileUtil;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.LogLikelihoodSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.recommender.ItemBasedRecommender;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class BasedItemRec {
    //基于物品的推荐用到的数据和离线的是一样的。
    public static Long[] itemRec(Set<Long> itemIds) throws Exception{
        Long[] recitems = new Long[30];

//        File resultFile = new File("E:\\WorkSpace\\IdeaWorkSpace\\RecommendSystem\\src\\main\\resources\\itemRec.dat");
//        File resultFile = new File("E:\\WorkSpace\\IdeaWorkSpace\\Recom_Parent\\rec_blog\\blog_controller\\src\\main\\resources\\itemRec.dat");
//        File resultFile = new File("E:\\WorkSpace\\IdeaWorkSpace\\Recom_Parent\\rec_blog\\blog_controller\\src\\main\\resources\\BaseOnItem.dat");
        File resultFile = new File(System.getProperty("java.io.tmpdir"), "BaseOnItem.dat");


        long[] itemsLong = new long[itemIds.size()];
        Iterator<Long> it = itemIds.iterator();
        int i = 0;
        while (it.hasNext()) {
            long str = it.next();
            itemsLong[i] = str;
            i++;
        }
        DataModel dataModel;
//        if (resultFile.exists()) {
//        }else{
//            dataModel = new MovieLensDataModel(FileUtil.write2Dat(articleRating, resultFile));
//        }

        dataModel = new MovieLensDataModel(resultFile);

        ItemSimilarity similarity = new LogLikelihoodSimilarity(dataModel);
        ItemBasedRecommender recommender = new GenericItemBasedRecommender(dataModel, similarity);

        List<RecommendedItem> recommendedItems = recommender.mostSimilarItems(itemsLong, 30);
        int j = 0;
        for (RecommendedItem recommendedItem : recommendedItems) {
            recitems[j] = recommendedItem.getItemID();
            j++;
        }
        return recitems;
       }
}
