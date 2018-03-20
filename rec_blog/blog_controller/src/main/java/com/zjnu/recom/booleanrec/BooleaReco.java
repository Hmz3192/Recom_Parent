package com.zjnu.recom.booleanrec;

import com.zjnu.model.ArticleRating;
import com.zjnu.pojo.RecommendedItems;
import com.zjnu.utils.FileUtil;
import org.apache.mahout.cf.taste.impl.model.GenericBooleanPrefDataModel;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericBooleanPrefItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericBooleanPrefUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.CityBlockSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.ItemBasedRecommender;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class BooleaReco {

    //需要两种一种是boolean。base

    //基于用户的无偏好推荐
    public static RecommendedItems recBooleanBaseUser(long userID, int size) throws Exception {
        //用已有的
//        File originalFile = new File("E:\\WorkSpace\\IdeaWorkSpace\\Recom_Parent\\rec_blog\\blog_controller\\src\\main\\resources\\boolean.base");
        File originalFile = new File(System.getProperty("java.io.tmpdir"), "boolean.base");
        DataModel model = new GenericBooleanPrefDataModel(
                GenericBooleanPrefDataModel
                        .toDataMap(new FileDataModel(originalFile)));
        UserSimilarity similarity = new CityBlockSimilarity(model);
        UserNeighborhood neighborhood = new NearestNUserNeighborhood(100, similarity, model);
//        Recommender recommender = new GenericUserBasedRecommender(model, neighborhood, similarity);
        Recommender recommender = new GenericBooleanPrefUserBasedRecommender(model, neighborhood, similarity);


        List<RecommendedItem> recommendedItems = recommender.recommend(userID, size);
        RecommendedItems recommendedItems1 = new RecommendedItems();

        List<Long> recommendedItemIDs = new ArrayList<Long>();
        for(RecommendedItem recommendedItem: recommendedItems) {
                recommendedItemIDs.add((recommendedItem.getItemID()));
            if(recommendedItemIDs.size() >= size)
                break;
        }
        recommendedItems1.setItems(recommendedItemIDs.toArray(new Long[0]));
        return recommendedItems1;
    }


    //基物品的无偏好推荐
    public static RecommendedItems recBooleanBaseItem(long itemId, int size) throws Exception {
//        String originalFile = "E:\\WorkSpace\\IdeaWorkSpace\\RecommendSystem\\src\\main\\resources\\boolean.base";
//        File originalFile = new File("E:\\WorkSpace\\IdeaWorkSpace\\Recom_Parent\\rec_blog\\blog_controller\\src\\main\\resources\\boolean.base");
        File originalFile = new File(System.getProperty("java.io.tmpdir"), "boolean.base");
        DataModel model = new GenericBooleanPrefDataModel(
                GenericBooleanPrefDataModel
                        .toDataMap(new FileDataModel(originalFile)));
        ItemSimilarity similarity = new CityBlockSimilarity(model);
        ItemBasedRecommender recommender = new GenericBooleanPrefItemBasedRecommender(model, similarity);

        List<RecommendedItem> recommendedItems = recommender.mostSimilarItems(itemId, size);
        RecommendedItems recommendedItems1 = new RecommendedItems();

        List<Long> recommendedItemIDs = new ArrayList<Long>();
        for(RecommendedItem recommendedItem: recommendedItems) {
            recommendedItemIDs.add((recommendedItem.getItemID()));
            if(recommendedItemIDs.size() >= size)
                break;
        }
        recommendedItems1.setItems(recommendedItemIDs.toArray(new Long[0]));
        return recommendedItems1;
    }
}
