<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8">
    <title>知木</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta name="format-detection" content="telephone=no"/>
    <meta name="format-detection" content="email=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="${path}/mobileStatic/css/m.css" rel="stylesheet" media="screen">
    <link href="${path}/mobileStatic/css/topic.css" rel="stylesheet" media="screen">
    <link href="${path}/mobileStatic/css/activity.css" rel="stylesheet" media="screen">
    <link href="${path}/mobileStatic/css/vip.css" rel="stylesheet" media="screen">
    <link href="${path}/mobileStatic/css/login.css" rel="stylesheet" media="screen">
    <link href="${path}/mobileStatic/css/m_video.css" rel="stylesheet" media="screen">
    <link href="${path}/mobileStatic/css/share.css" rel="stylesheet" media="screen">
    <link href="${path}/mobileStatic/css/vip_column.css" rel="stylesheet" media="screen">
</head>
<body>
<div class="search-wrap-show active">
    <div class="search-input-box">
        <form action="${path}/mSearch" method="get">
            <button type="submit" class="input-sm-search"><i class="icon icon-sm-search"></i></button>
            <input class="search-input" type="search" id="search-s" name="query" placeholder="输入关键词"
                   value="${queryString}">
        </form>
    </div>
</div>
<div style="width: 100%;background: #fff!important;margin-top: 2%"><span style="font-size: 1px;margin: 40%;">共找到<span style="font-size: 5px;color: red">${num}</span> 条相关资讯</span>
</div>
<div class="recommended-box" style="padding-top: .1rem">
    <ul class="search-feed-ul search-article search-append">
            <c:forEach items="${requestScope.searchList}" var="map">
                <li>
                    <div class="author-info">
                        <div class="name">
                            <a href="${path}/tma/${map.id}">${map.title }</a>
                        </div>
                        <div class="info">${map.summ }</div>
                        <hr>
                        <div class="info">${map.conten }</div>
                    </div>
                    <div class="time">
                        <span>国仁©</span><span>2018-03-08</span>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </ul>
</div>
<div class="bottom-more js-more-search" data-cur_page="1">
    点击加载更多
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
<script type="text/javascript" src="${path}/mobileStatic/js/jquery-1.11.1.min.js"></script>

</body>
</html>
