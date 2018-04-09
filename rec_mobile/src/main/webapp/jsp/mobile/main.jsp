<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<!DOCTYPE html>
<html >
<head lang="en">
    <meta charset="utf-8">
    <title>NewsPro</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="${path}/mobileStatic/css/m.css" rel="stylesheet" media="screen">
    <link href="${path}/mobileStatic/css/topic.css" rel="stylesheet" media="screen">
    <link href="${path}/mobileStatic/css/activity.css" rel="stylesheet" media="screen">
    <link href="${path}/mobileStatic/css/vip.css" rel="stylesheet" media="screen">
    <link href="${path}/mobileStatic/css/login.css" rel="stylesheet" media="screen">
    <link href="${path}/mobileStatic/css/m_video.css" rel="stylesheet" media="screen">
    <link href="${path}/mobileStatic/css/share.css" rel="stylesheet" media="screen">
    <link href="${path}/mobileStatic/css/vip_column.css" rel="stylesheet" media="screen">
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>

    <script type="text/javascript">

        //请求数据接口
        var url = "${path}/mget";
        //加载更多dom
        var loadingBtn = $("#loading");
        //是否需要加载
        var isLoad = true;
        //当前查询第几页
        var currentPage = 1;
        //每页数量
        var rows = 5;
        //没有更多数据
        var nomore_Text = '没有更多数据';

        function loadData() {
            //发送ajax
            $.ajax({
                //url
                url: url,
                //请求方式
                type: 'POST',
                //参数
                data: {currentPage: 1, rows: 5},
                //成功回调
                success: function (data) {
                    currentPage++;
                    var html = '', result = data.amounts, i = 0;
                    var path = '${path}', j = 0;
                    for (; i < 5; i++) {
                        var rs = result[i],
                            id = rs.articleId;
                        if (rs.articleAvatar.length == 0 || rs.articleAvatar == "") {
                            var pic = "${path}/mobileStatic/images/20180312131741_222.jpg"
                        } else
                            var pic = rs.articleAvatar

                        var path = '${path}';

                        var title = rs.articleTitle,
                            summary = rs.articleSummary,
                            collection = rs.articleCollection,
                            author = rs.articleSource,
                            up = rs.articleUp,
                            down = rs.articleDown,
                            time = rs.releaseTime,
                            hints = rs.articleHints;
                        var article_href = path + "/toarticle/" + id;

                        if (j == 3) {

                            html += '<li><div class="article-hp-info article-hp-big-info">' +
                                '<a class="article-hp-big-pic" href=" ' + article_href + ' ">' +
                                '<img class="lazy"  src=" '+ pic +' " style="display: inline;"></a>' +
                                '<a href=" ' + article_href + ' "><h2>' + title + '</h2></a>' +
                                '<div class="rec-article-time clearfix">' +
                                '<span class="rec-author fl">' + author + '©</span>' +
                                '<span class="fl"> ' + time + ' <span class="fr">' +
                                '<em>' + collection + '</em>人收藏</span></div></div></li>'
                        } else {
                            html += '<li>' +
                                '<div class="article-hp-info">' +
                                '<a href=" ' + article_href + ' " class="rec-article-pic fr">' +
                                '<img class="lazy" src="' + pic + '" style="display: inline;"></a>' +
                                '<div class="rec-article-info">' +
                                '<a href=" ' + article_href + ' "><h2><span> ' + title + ' </span></h2></a>' +
                                '<div class="rec-article-time clearfix">' +
                                '<span class="rec-author fl"> ' + author + ' </span>' +
                                '<span class="fl"> ' + time + ' <span class="fr">' +
                                '<em> ' + collection + ' </em>人收藏</span></div></div></div></li>';
                        }
                        j++;

                    }

                    //渲染数据
                    $("#list").append(html);
                    //接口是否查询完毕
                    if (data.total == data.currentPage || currentPage > data.total) {
                        //数据全部加载完毕
                        isLoad = false;
                        //
                        loadingBtn.html(nomore_Text);
                    }
                },
                //失败回调
                error: function (e, e2, e3) {
                    //
                    alert('请求失败，原因：' + e3);
                }
            });
        }

        /*
               页面加载完毕执行一次查询
               */
        window.onload = function () {
            //加载数据
            //游客，得出最点击量高和赞高的
            loadData();
        };

    </script>
</head>

<body>
<div class="htmlBox" id="htmlBox">
    <nav style="display: none; opacity: 0;" id="nav">
        <div class="nav-box"></div>
    </nav>

    <!--导航-->
    <div class="user-wrap" style="display: none;">

        <div class="information">
            <a class="active" href="${path}/m">资讯</a>
        </div>
        <ul class="subclass-ul">
            <li><a href="${path}/m" class="transition">电影相关</a></li>
            <li><a href="${path}/m" class="transition">热点新闻</a></li>
        </ul>
        <div class="user-face-wrap">
            <div class="text-center">
                <a class="login-link c3" style="border: 1px solid #333;color: #333;background: none" href="${path}/mL">登录</a>
                <a class="login-link b1" style="border: 1px solid #333;color: #333;background: none" href="${path}/mR">极速注册</a>
            </div>
        </div>

    </div>
    <!--搜索框-->
    <div class="search-wrap">
        <div class="search-input-box">

            <form action="${path}/S" method="post">
                <button class="input-sm-search js-search"><i class="icon icon-sm-search"></i>
                </button>
                <input type="search" name="query" id="top-search" class="search-input" placeholder="输入关键词">
                <a class="close-box js-search-cancel">取消</a>
            </form>
        </div>
        <div class="search-act search-history-act">
            搜索历史
        </div>
        <ul class="search-ul search-history">
            <li><a href="#">数码</a></li>
            <li><a href="#">互联网</a></li>
            <li><a href="#">数码</a></li>
            <li><a href="#">互联网</a></li>
        </ul>
        <div class="search-act search-hot">
            热搜词
        </div>
        <ul class="search-ul search-hot">
            <li><a href="#">苹果</a></li>
            <li><a href="#">亚马逊</a></li>
            <li><a href="#">区块链</a></li>
        </ul>
    </div>
    <header>

        <!-- 默认 -->
        <div class="top-bar">
            <div class="nums" style="display: block;"></div>
            <button class="navbar-toggle js-open-nav" type="button" id="listbutton">
                <div class="icon-bar"></div>
                <div class="icon-bar"></div>
                <div class="icon-bar"></div>
            </button>
            <div class="pull-right search-box js-search-cancel js-hmt-detection" data-detection="首页-搜索按钮,点击,点击">
                <i class="icon icon-search"></i>
            </div>
        </div>


    </header>
    <div class="modal-message">
        <span class="title">账号或密码错误</span>
    </div>
    <div class="list-content" id="list-content">
        <div class="swipe-index-top"></div>

        <div class="article-wrap">
            <div class="related-article-wrap">
                <ul class="rec-article-feed-ul  article-hp-feed" id="list">


                </ul>
            </div>

        </div>
        <div class="bottom-more" id="loading">
            点击加载更多
        </div>
    </div>

</div>
<footer>
    <ul>
        <li><a href="#">关于我们</a></li>
        <li><a href="${path}/m">手机版</a></li>
        <li><a href="http://127.0.0.1:8111/f">桌面版</a></li>
        <li><a class="btn-open js-open-app">客户端</a></li>
    </ul>
</footer>
<script type="text/javascript">
    /*
     点击加载更多
     */
    $("#loading").click(function () {
//        alert("ok");
        //是否加载游客数据
        if (isLoad)
            loadData();
    });

    var state = 0;
    $("#listbutton").click(function () {

        if(state == 0) {
            $("#htmlBox").css("overflow","hidden")
            $("#htmlBox").css("height", "406px")
            $("#nav").css("display","block");
            $("#nav").css("opacity","1");
            $(".user-wrap").css("display", "block");
            $("#listbutton").addClass("active");
            state = 1;
        }else if(state == 1) {
            $("#htmlBox").css("overflow","")
            $("#htmlBox").css("height", "")
            $("#nav").css("display","none");
            $("#nav").css("opacity","0");
            $(".user-wrap").css("display", "none");
            $("#listbutton").removeClass("active");
            state = 0;
        }
        
    })
</script>
</body>
</html>
