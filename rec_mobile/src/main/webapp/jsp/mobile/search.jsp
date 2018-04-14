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
    <script>
        var uid = '0';
        var is_vip = '';
        var huxiu_hash_code = "30a5994317edd92c02e7d40ec9198df0";
        var aid=0;

        var newsId=0;

        var itemId = '0';
        var signAna = '0';
        var signTime = '0';
        var productId = '0';
        var channel = 'huxiu';
        var refer = '';
        var relatedArticle = '';
        var url=window.location.href;
        var str1=new RegExp('rec=man');
        var str2=new RegExp('rec=sim');
        if(str1.test(url)){
            relatedArticle = 'manual';
        } else if (str2.test(url)) {
            relatedArticle = 'similar';
        }

        var static_url = 'https://static.huxiucdn.com';
        var huxiu_url = 'https://m.huxiu.com';
    </script>
    <script type='text/javascript'>
        !function(e,t,n,g,i){e[i]=e[i]||function(){(e[i].q=e[i].q||[]).push(arguments)},n=t.createElement("script"),tag=t.getElementsByTagName("script")[0],n.async=1,n.src=('https:'==document.location.protocol?'https://':'http://')+g,tag.parentNode.insertBefore(n,tag)}(window,document,"script","assets.growingio.com/2.1/gio.js","gio");
        gio('init', 'b6a739d69e7ea5b6', {});
        gio('setUserId', '0');
        gio('send');
    </script>


</head>


<body>
<div class="htmlBox">
    <nav>
        <div class="nav-box"></div>
    </nav>

    <!--导航-->
    <div class="user-wrap">

        <div class="information">
            <a class="active" href="${path}/m">资讯</a>
        </div>
        <ul class="subclass-ul">
            <li><a href="#" class="transition">电影相关</a></li>
            <li><a href="#" class="transition">热点新闻</a></li>
        </ul>
        <div class="user-face-wrap">
            <div class="text-center">
                <a class="login-link c3" style="border: 1px solid #333;color: #333;background: none"  href="${path}/mL">登录</a>
                <a class="login-link b1" style="border: 1px solid #333;color: #333;background: none"  href="${path}/mR">极速注册</a>
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
            <div class="nums"></div>
            <button class="navbar-toggle js-open-nav" type="button">
                <div class="icon-bar"></div>
                <div class="icon-bar"></div>
                <div class="icon-bar"></div>
            </button>
            <div class="pull-right search-box js-search-cancel js-hmt-detection" data-detection="首页-搜索按钮,点击,点击">
                <i class="icon icon-search"></i>
            </div>
        </div>


    </header><div class="modal-message">
    <span class="title">账号或密码错误</span>
</div>    <div class="search-wrap-show active">
    <div class="search-input-box">
        <form action="${path}/S" method="post">
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
                        <a href="${path}/toarticle/${map.id}">${map.title }</a>
                    </div>
                    <div class="info"><span style="font-size: 10px;color: #5f5f5f">概要: </span>${map.summ }</div>
                    <div class="info"><span style="font-size: 10px;color: #5f5f5f">内容: </span>${map.conten }</div>
                </div>
                <div class="time">
                    <span>国仁©</span><span>2018-03-08</span>
                </div>
            </li>
            </c:forEach>
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
    <script>
        var w = document.documentElement.clientWidth;
        if(w > 640){
            w = 640;
        }
        document.documentElement.style.fontSize=20/375*w+'px';
        window.onresize=function(){
            document.documentElement.style.fontSize=20/375*w+'px';
        }
    </script>
    <script type="text/javascript" src="${path}/mobileStatic/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${path}/mobileStatic/js/jquery.lazyload.js"></script>
    <script type="text/javascript" src="${path}/mobileStatic/js/fastclick.js"></script>
    <script type="text/javascript" src="${path}/mobileStatic/js/swipe.js"></script>
    <script type="text/javascript" src="${path}/mobileStatic/js/swiper.min.js"></script>
    <script type="text/javascript" src="${path}/mobileStatic/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="${path}/mobileStatic/js/jquery.detection.js"></script>
    <script type="text/javascript" src="${path}/mobileStatic/js/jweixin-1.0.0.js"></script>

    <script type="text/javascript" src="${path}/mobileStatic/js/sea.js"></script>
    <script type="text/javascript">
        seajs.config({
            base: !!static_url ? static_url+'/m/js/modal' : '/m/js/modal',
            comboSyntax: ['??', ','],
            alias: {
                'sea_combo_flush': static_url+'/common/sea/sea_combo_flush.js',
                'nativeShare': 'nativeShare.js'
            },
            'map': [
                [/^(.*\.(?:css|js))(.*)$/i, '$1?v=201802221322']
            ],
            charset: 'utf-8'
        });
        seajs.use(['init']);
    </script>
    <script type="text/javascript" src="${path}/mobileStatic/js/seajs_css.js"></script>
    <script>
        (function(){
            $('.js-foot-year').html(new Date().getFullYear());
        })();
        (function(){
            var bp = document.createElement('script');
            var curProtocol = window.location.protocol.split(':')[0];
            if (curProtocol === 'https') {
                bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
            }
            else {
                bp.src = 'http://push.zhanzhang.baidu.com/push.js';
            }
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(bp, s);
        })();
    </script>
</body>
</html>
