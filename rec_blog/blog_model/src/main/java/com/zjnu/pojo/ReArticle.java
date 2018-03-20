package com.zjnu.pojo;

import java.util.List;

public class ReArticle {


    private DataBean data;
    private String errorCode;
    private boolean success;
    private String msg;

    public DataBean getData() {
        return data;
    }

    public void setData(DataBean data) {
        this.data = data;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public static class DataBean {

        private int pageSize;
        private int currentPage;
        private int totalRecord;
        private int totalPages;
        private List<ListBean> list;

        public int getPageSize() {
            return pageSize;
        }

        public void setPageSize(int pageSize) {
            this.pageSize = pageSize;
        }

        public int getCurrentPage() {
            return currentPage;
        }

        public void setCurrentPage(int currentPage) {
            this.currentPage = currentPage;
        }

        public int getTotalRecord() {
            return totalRecord;
        }

        public void setTotalRecord(int totalRecord) {
            this.totalRecord = totalRecord;
        }

        public int getTotalPages() {
            return totalPages;
        }

        public void setTotalPages(int totalPages) {
            this.totalPages = totalPages;
        }

        public List<ListBean> getList() {
            return list;
        }

        public void setList(List<ListBean> list) {
            this.list = list;
        }

        public static class ListBean {

            private int id;
            private String title;
            private String author;
            private String content;
            private String keywords;
            private String description;
            private int reads;
            private int likes;
            private int score;
            private String source_url;
            private String source_site;
            private String image_list;
            private boolean is_read;
            private boolean is_like;
            private long crawl_time;
            private Object content_time;
            private Object feed_time;
            private Object user_add_flag;

            public int getId() {
                return id;
            }

            public void setId(int id) {
                this.id = id;
            }

            public String getTitle() {
                return title;
            }

            public void setTitle(String title) {
                this.title = title;
            }

            public String getAuthor() {
                return author;
            }

            public void setAuthor(String author) {
                this.author = author;
            }

            public String getContent() {
                return content;
            }

            public void setContent(String content) {
                this.content = content;
            }

            public String getKeywords() {
                return keywords;
            }

            public void setKeywords(String keywords) {
                this.keywords = keywords;
            }

            public String getDescription() {
                return description;
            }

            public void setDescription(String description) {
                this.description = description;
            }

            public int getReads() {
                return reads;
            }

            public void setReads(int reads) {
                this.reads = reads;
            }

            public int getLikes() {
                return likes;
            }

            public void setLikes(int likes) {
                this.likes = likes;
            }

            public int getScore() {
                return score;
            }

            public void setScore(int score) {
                this.score = score;
            }

            public String getSource_url() {
                return source_url;
            }

            public void setSource_url(String source_url) {
                this.source_url = source_url;
            }

            public String getSource_site() {
                return source_site;
            }

            public void setSource_site(String source_site) {
                this.source_site = source_site;
            }

            public String getImage_list() {
                return image_list;
            }

            public void setImage_list(String image_list) {
                this.image_list = image_list;
            }

            public boolean isIs_read() {
                return is_read;
            }

            public void setIs_read(boolean is_read) {
                this.is_read = is_read;
            }

            public boolean isIs_like() {
                return is_like;
            }

            public void setIs_like(boolean is_like) {
                this.is_like = is_like;
            }

            public long getCrawl_time() {
                return crawl_time;
            }

            public void setCrawl_time(long crawl_time) {
                this.crawl_time = crawl_time;
            }

            public Object getContent_time() {
                return content_time;
            }

            public void setContent_time(Object content_time) {
                this.content_time = content_time;
            }

            public Object getFeed_time() {
                return feed_time;
            }

            public void setFeed_time(Object feed_time) {
                this.feed_time = feed_time;
            }

            public Object getUser_add_flag() {
                return user_add_flag;
            }

            public void setUser_add_flag(Object user_add_flag) {
                this.user_add_flag = user_add_flag;
            }
        }
    }
}
