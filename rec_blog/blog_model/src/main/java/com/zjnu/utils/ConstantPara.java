package com.zjnu.utils;

import java.io.File;

public class ConstantPara {

    //flexPaper
    public static final String ServerPath = "http://localhost:8111";

    //absoultPath
    public static final String absoultPath = System.getProperty("webapp.root");

    //Tree
    public static final String UPLOAD_FOLDER = System.getProperty("webapp.root") + File.separator + "uploadFiles";


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

    public static final String NEO_URL = "bolt://101.201.234.133:7687";

    public static final String NEO_USER = "neo4j";

    public static final String NEO_PASS = "123456";


}
