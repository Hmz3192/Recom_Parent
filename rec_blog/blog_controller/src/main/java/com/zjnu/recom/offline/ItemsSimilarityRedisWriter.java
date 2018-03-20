package com.zjnu.recom.offline;

import com.alibaba.fastjson.JSON;
import com.zjnu.recom.common.ItemSimilarity;
import com.zjnu.redis.JedisUtil;
import org.apache.mahout.cf.taste.similarity.precompute.SimilarItem;
import org.apache.mahout.cf.taste.similarity.precompute.SimilarItems;
import org.apache.mahout.cf.taste.similarity.precompute.SimilarItemsWriter;
import redis.clients.jedis.Jedis;

import java.io.IOException;

// generate item-item similarity table
public class ItemsSimilarityRedisWriter implements SimilarItemsWriter {
  private long itemCounter = 0;
  private Jedis jedis = null;
  @Override
  public void open() throws IOException {
    jedis = JedisUtil.getJedis();
  }

  @Override
  public void add(SimilarItems similarItems) throws IOException {
    ItemSimilarity[] values = new ItemSimilarity[similarItems.numSimilarItems()];
    int counter = 0;
    for (SimilarItem item: similarItems.getSimilarItems()) {
      values[counter] = new ItemSimilarity(item.getItemID(), item.getSimilarity());
      counter++;
    }
    String key = "II:" + similarItems.getItemID();
    String items = JSON.toJSONString(values);
    jedis.set(key, items);
    itemCounter++;
    if(itemCounter % 100 == 0) {
      System.out.println("Store " + key + " to redis, total:" + itemCounter);
    }
  }

  @Override
  public void close() throws IOException {
    jedis.close();
  }
}

