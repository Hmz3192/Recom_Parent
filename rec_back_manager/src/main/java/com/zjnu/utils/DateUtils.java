package com.zjnu.utils;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Yoy on 2017/7/9.
 */
public class DateUtils {
    public static String getCurrentTime(){
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return simpleDateFormat.format(calendar.getTime());
    }

    //生成文件路径格式,以天为单位
    public static String getFileDatePath() {
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("/yyyy/MM/dd");
        return dateFormat.format(date);
    }

    public static Date getDateTypeTime(String time){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = null;
        try {
            date = simpleDateFormat.parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    public static String getStringTypeTime(Date date){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = "";
        if(date != null) {
            time = simpleDateFormat.format(date);
        }
        return time;
    }

    public  void run() {
        System.out.println(getFileDatePath());
    }
}
