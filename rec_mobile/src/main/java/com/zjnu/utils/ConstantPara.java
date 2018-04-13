package com.zjnu.utils;

import java.io.File;

public class ConstantPara {

    //flexPaper
    public static final String ServerPath = "http://localhost:8110";

    //absoultPath
    public static final String absoultPath = System.getProperty("webapp.root");


    public static final String KAFKA_SERVER = "localhost";

    public static final String KAFKA_ADDR = KAFKA_SERVER + ":9092";

    public static final String KAFKA_TOPICS = "recom";


    public static final String CHENG_LINE = "\r\n";

    public static final String BLANK = "  ";

    public static final String SINGLE_BLANK = " ";

    public static final String TABLE = "\t";

    public static final String SOLR_URL = "solr_url";

    public static final String SEARCH_CONFIG = "search.properties";

    public static final String INDEXPATH = System.getProperty("webapp.root") + File.separator + "index";
}
