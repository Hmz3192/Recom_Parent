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
        var huxiu_hash_code = "2d84a290bb9da504640bddc1aba7cc72";
        var aid = 235254;

        var newsId = 0;

        var itemId = '235254';
        var signAna = 'aec5d27db8bd53c358513c1d66b6fd69a2e5b9a3';
        var signTime = '1520692761';
        var productId = '11';
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
        gio('setUserId', '0');
        gio('send');
    </script>


</head>

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
<div class="htmlBox bgW" id="article">

    <input id="openAppType" type="hidden" value="article">
    <input type="hidden" id="vipColumnDetectionSign" value="资讯">
    <div class="placeholder-box"></div>
    <nav>
        <div class="nav-box"></div>
    </nav>
    <input hidden id="about-reward"/>
    <div id="m-article-detail-page" class="reward-page-wrap">
        <div class="article-content-title-box" id="article1">
            <div class="title">${articleDetail.article.articleTitle}</div>
            <div class="article-author-box clearfix">
                <a class="author-intro-wrap fl" href="#">
                    <div class="face-box fl">
                           <span class="icon-v" style="line-height: 1.8;">
                                                            </span>
                        <img class="lazy" src="${path}/mobileStatic/picture/78_avatar_big.jpg"/>
                    </div>
                    <span class="username fl">${articleDetail.user.userName}</span>
                </a>
                <span class="fr">${articleDetail.article.releaseTime}</span>
            </div>
        </div>
        <!--头图-->
        <div class="article-content-img">
            <span class="bg-gradient"></span>
            <img class="lazy" src="${articleDetail.article.articleAvatar}"/>
        </div>

        <!--编辑转推-->
        <div cellpadding="0" cellspacing="0" class="article-box">
            <div id="article_content">
                <div class="article_content">

                    <!--内容-->
                    ${articleDetail.article.articleContent}
                </div>
            </div>
        </div>
        <!--作者卡-->
        <div class="author-dy-wrap">
            <!--点击跳个人中心页-->
            <a href="#">
                <div class="author-info-wrap">
                <span class="author-img-wrap">
                    <img src="${path}/mobileStatic/picture/78_avatar_big.jpg"/>
                </span>
                    <span class="dy-author-name">${articleDetail.user.userName}</span>
                </div>
                <div class="author-position">${articleDetail.user.introduction}</div>
            </a>
        </div>
        <div class="share-box article-content-share">
            <div class="article-btn-group fr">
                <ul>
                    <li class="js-article-praise js-hmt-detection">
                        <i class="icon-a icon-md-praise "></i>
                        <span class="article-praise-number js-number">${articleDetail.article.articleUp}</span>
                    </li>
                    <li class="js-article-collection js-hmt-detection">
                        <i class="icon-a icon-collection "></i>
                        <span class="article-praise-number js-number">${articleDetail.article.articleCollection}</span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="placeholder-line"></div>

        <div class="pl-wrap">
            <div>
                <div class="placeholder-line"></div>
                <h2 class="title">最&nbsp;新&nbsp;评&nbsp;论</h2>
                <ul class="pl-article-ul-box">
                    <li class="pl-ul-li" data-id="1084895">
                        <div class="praise js-pl-praise">
                            <span class="praise-num"></span>
                            <i class="icon-a icon-pl-praise"></i>
                        </div>

                        <a class="pl-content-wrap js-open-app js-pl-detection" data-type="pl-content">
                            <div class="pl-face-box">
                                <img class="lazy"
                                     src="${path}/mobileStatic/images/22_1478341955.jpg"/>
                            </div>

                            <div class="pl-article-info">
                                <div class="name">
                                    <span class="fl">独行千山</span>
                                    <!-- vip认证 -->

                                    <!-- 团队认证 -->

                                </div>

                                <div class="title">
                                    这下就好看了。。
                                </div>

                                <div class="time">
                                    <span class="fl">2小时前</span>
                                    <span class="pl-hf-text fr">回复</span>
                                </div>

                            </div>

                        </a>
                    </li>
                    <li class="pl-ul-li" data-id="1084878">
                        <div class="praise js-pl-praise">
                            <span class="praise-num"></span>
                            <i class="icon-a icon-pl-praise"></i>
                        </div>

                        <a class="pl-content-wrap js-open-app js-pl-detection" data-type="pl-content">
                            <div class="pl-face-box">
                                <img class="lazy" src="${path}/mobileStatic/images/3.jpg"/>
                            </div>
                            <div class="pl-article-info">
                                <div class="name">
                                    <span class="fl">反水反诈反愚</span>
                                </div>
                                <div class="title">
                                    看来华为收购苹果指日可待
                                </div>
                                <div class="time">
                                    <span class="fl">3小时前</span>
                                    <span class="pl-hf-text fr">回复</span>
                                </div>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
            <a class="bottom-more-comment js-open-app js-pl-detection" >
                已有2个评论，等待你的发声
            </a>
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
<script>
    var w = document.documentElement.clientWidth;
    if (w > 640) {
        w = 640;
//            var qr_code_pc = document.getElementById('qr_code_pc');
//            qr_code_pc.style.display="block";
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



</body>
</html>
