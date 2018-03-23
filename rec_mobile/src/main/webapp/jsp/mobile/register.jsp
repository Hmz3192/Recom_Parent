<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<!DOCTYPE html>
<html>
<head>
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
    <script>
        var uid = '';
        var is_vip = '';
        var huxiu_hash_code = "2d84a290bb9da504640bddc1aba7cc72";
        var aid = 0;

        var newsId = 0;

        var itemId = '0';
        var signAna = '0';
        var signTime = '0';
        var productId = '0';
        var channel = 'huxiu';
        var refer = '';
        var relatedArticle = '';
        var url = window.location.href;
        var str1 = new RegExp('rec=man');
        var str2 = new RegExp('rec=sim');
        if (str1.test(url)) {
            relatedArticle = 'manual';
        } else if (str2.test(url)) {
            relatedArticle = 'similar';
        }

        var static_url = 'https://static.huxiucdn.com';
        var huxiu_url = 'https://m.huxiu.com';
    </script>
    <script type='text/javascript'>
        !function (e, t, n, g, i) {
            e[i] = e[i] || function () {
                (e[i].q = e[i].q || []).push(arguments)
            }, n = t.createElement("script"), tag = t.getElementsByTagName("script")[0], n.async = 1, n.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + g, tag.parentNode.insertBefore(n, tag)
        }(window, document, "script", "assets.growingio.com/2.1/gio.js", "gio");
        gio('init', 'b6a739d69e7ea5b6', {});
        gio('setUserId', '');
        gio('send');
    </script>


</head>



<div id="messenger" class="messenger">
    正确的提示信息
</div>
<!--文章评论-->
<div id="pl-box" class="pl-form-box">
    <div class="title">
        <a class="js-close-pl-form pull-left">取消</a>
        <a class="js-submit-pl-form pull-right">发送</a>
        评论
    </div>
    <div class="pl-textarea-box">
        <textarea class="pl-textarea" id="pl-textarea"></textarea>
    </div>
</div>
<!--热议评论-->
<div id="topic-pl-box" class="pl-form-box">
    <div class="title">
        <a class="js-close-pl-form pull-left">取消</a>
        <a class="js-topic-submit-pl-form pull-right">发送</a>
        评论
    </div>
    <div class="pl-textarea-box">
        <textarea class="pl-textarea" id="topic-pl-textarea"></textarea>
    </div>
</div>
<!--热议点评评论-->
<div id="topic-dp-box" class="pl-form-box">
    <div class="title">
        <a class="js-close-pl-form pull-left">取消</a>
        <a class="js-topic-submit-dp-form pull-right">发送</a>
        评论
    </div>
    <div class="pl-textarea-box">
        <textarea class="pl-textarea" id="topic-dp-textarea"></textarea>
    </div>
</div>

<body>
<div class="placeholder-box"></div>
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
            <li><a  href="#" class="transition">电影相关</a></li>
            <li><a  href="#" class="transition">热点新闻</a></li>
        </ul>
        <div class="user-face-wrap">
            <div class="text-center">
                <a class="login-link c3" style="border: 1px solid #333;color: #333;background: none"  href="${path}/mL">登录</a>
                <a class="login-link b1"  style="border: 1px solid #333;color: #333;background: none" href="${path}/mR">极速注册</a>
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


    </header>
    <div class="modal-message">
        <span class="title">账号或密码错误</span>
    </div>
    <div class="login-wrap">
        <strong class="login-title text-center">极速注册</strong>

        <div class="form-login gain-code">
            <div class="label-box col-xs">
                <input class="l-input" id="username" placeholder="输入手机号">
                <a class="js-input-close input-close"><i class="icon-login icon-l-close"></i></a>
            </div>
            <div class="geetest-box gain-code-box"></div>
            <div class="label-box">
                <input class="l-input captcha" placeholder="输入6位验证码" onkeyup="this.value=this.value.replace(/\D/g,'')"
                       onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="6">
                <a class="js-input-close input-close third"><i class="icon-login icon-l-close"></i></a>
                <a class="gain-code-time js-get-code">获取验证码</a>
            </div>
            <a class="label-select-box text-center"><span class="js-country">+86</span><i
                    class="icon-login icon-l-caret"></i></a>
            <a class="js-Gsou-register btn-login btn-login-code text-center">注册</a>
            <div class="mobile-box"></div>
            <div class="sms-link text-center">已有账号，<a href="${path}/mL">去登录</a></div>
        </div>

    </div>
</div>
    <script>
        var w = document.documentElement.clientWidth;
        if (w > 640) {
            w = 640;
//            var qr_code_pc = document.getElementById('qr_code_pc');
//            qr_code_pc.style.display = "block";
        }
        document.documentElement.style.fontSize = 20 / 375 * w + 'px';
        window.onresize = function () {
            document.documentElement.style.fontSize = 20 / 375 * w + 'px';
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
            base: !!static_url ? static_url + '/m/js/modal' : '/m/js/modal',
            comboSyntax: ['??', ','],
            alias: {
                'sea_combo_flush': static_url + '/common/sea/sea_combo_flush.js',
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
</div>
</body>
</html>
