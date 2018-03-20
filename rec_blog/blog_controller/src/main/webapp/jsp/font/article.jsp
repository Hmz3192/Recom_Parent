<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>文章页-NewsPro</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <meta name="renderer" content="webkit">
    <meta name="baidu-site-verification" content="R9XA5lWxu2"/>
    <meta name="author" content="兴趣网">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/build.css">
    <link href="${path}/resource/css/login.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resource/css/zzsc.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resource/css/dlzc.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" src="${path}/resource/js/jquery.js"></script>

    <script type="text/javascript">
        $(function () {
            var start;
            var end;
            var times = 0;
            start = new Date();//用户进入时间
            var articleId = ${requestScope.articleDetail.article.articleId}
            $(window).bind('beforeunload', function (e) {
                end = new Date(); //用户退出时间
                times = end.getTime() - start.getTime();
                times = Math.ceil(times / 1000); //取的是秒并且化整
                $.ajax({
                    type: 'POST',
                    async: false, //同步提交
                    url: '${path}/loadTime',
                    data: {
                        times: times,
                        articleId: articleId


                    }
                });
            });


            var article_content_id = $("#contentArticle");
            window.onload = function () {
                //加载数据
                loadContent();
            };

            function loadContent() {
                if (${state > 0}) {
                    $("#zanNumber").val(${articleDetail.article.articleUp});
                    $("#caiNumber").val(${articleDetail.article.articleDown});
                    var html = "",
                        username = '${articleDetail.user.userName}',
                        articleTitle = '${articleDetail.article.articleTitle}',
                        articleContent = '${articleDetail.article.articleContent}',
                        articleCollection = '${articleDetail.article.articleCollection}',
                        kindParentName = '${articleDetail.article.kindParentName}',
                        kindChildName = '${articleDetail.article.kindChildName}',
                        // articleAvatar = "http://localhost:8111/" + '${articleDetail.article.articleAvatar}',
                        articleAvatar = '${articleDetail.article.articleAvatar}',
                        articleAttachPojo = '${articleDetail.articleAttachPojo}',
                        articleComments = '${articleDetail.articleComments}';

                    html += '<h1 class="t-h1">' + articleTitle + '</h1><div class="article-author">' +
                        '<span class="author-name"><a href="#">' + username + '</a></span><div class="column-link-box"> ' +
                        '<span class="article-time pull-left">2017-05-30 16:30</span><span class="article-share pull-left">收藏 ' + articleCollection + '</span>' +
                        '<span class="article-pl pull-left">评论 16</span><a href="#" class="column-link" >' + kindParentName + '</a><a href="#" class="column-link" >' + kindChildName + '</a><i></i>' +
                        '</div></div><div class="article-manage-bar" id="article-manage-bar"></div>' +
                        '<div class="article-img-box">' +
                        '<img src="' + articleAvatar + '" alt="' + articleTitle + '"></div>' +
                        '<div id="article_content" class="article-content-wrap">' + articleContent +
                        '<div class="neirong-shouquan"><span class="c2">*文章为作者独立观点，不代表网站立场<br></span>' +
                        '<span>本文由 <a href="#" target="_blank">' + username + '</a> 授权 <a href="/">兴趣网</a> 发表。转载此文请于文首标明作者姓名，保持文章完整性，并请附上出处</span><br />' +
                        '<span><b>未按照规范转载者，保留追究相应责任的权利</b></span></div>' +
                        '</div>'
                    article_content_id.append(html);
                } else {
                    window.location.href = "../../"
                }

            }
        });


    </script>

</head>

<body>

<%@include file="header.jsp" %>
<input type="hidden" id="zanNumber">
<input type="hidden" id="caiNumber">
<div class="placeholder-height"></div>
<div class="article-section-wrap">
    <div class="article-section" data-aid="197460">
        <div class="container" id="article197460">
            <div class="nrtj-wrap" id="nrtj-wrap197460"></div>
            <div class="wrap-right pull-right">
                <div class="box-author-info">
                    <div class="author-face">
                        <a href="#" target="_blank"><img src="${path}/resource/sy-img/touxiang.jpg"></a>
                    </div>
                    <div class="author-name">
                        <a href="#" target="_blank">${articleDetail.user.userName}</a>
                        <a href="#" target="_blank"><i class="i-vip icon-vip" title="虎嗅黑卡会员"></i></a>
                        <!--会员等级-->
                        <i class="i-icon icon-auth4" title="虎嗅认证作者"></i>
                    </div>
                    <div class="author-article-pl">
                        <ul>
                            <li><a href="#" target="_blank">1002篇文章</a></li>
                        </ul>
                    </div>
                    <div class="author-next-article">
                        <div class="author-one c2">最近文章</div>
                        <a href="http://localhost:8111/toarticle/6" target="_blank" style="display: block">
                            1分钟读通最高法报告</a>
                        <hr>
                        <a href="http://localhost:8111/toarticle/15" target="_blank" style="display: block">
                            高院裁定：达退休年龄后继续用工不建立劳动关系！| 知识派</a>
                        <hr>
                        <a href="http://localhost:8111/toarticle/21" target="_blank" style="display: block">
                            金振朝律师受邀到四川开展融资担保专题讲座</a>

                    </div>
                </div>
                <div class="placeholder"></div>
                <div class="box-moder hot-article">
                    <h3>热文</h3>
                    <span class="span-mark"></span>
                    <ul>
                        <li>
                            <div class="hot-article-img">
                                <a href="#" target="_blank"><img
                                        src="https://img.huxiucdn.com/article/cover/201706/04/105715329877.jpg?imageView2/1/w/280/h/210/|imageMogr2/strip/interlace/1/quality/85/format/jpg"></a>
                            </div>
                            <a href="#" class="transition" target="_blank">3年了，我们的内容消费发生了什么变化？</a>
                        </li>
                        <li>
                            <div class="hot-article-img">
                                <a href="#" target="_blank"><img
                                        src="https://img.huxiucdn.com/article/cover/201706/04/191327154498.jpg?imageView2/1/w/280/h/210/|imageMogr2/strip/interlace/1/quality/85/format/jpg"></a>
                            </div>
                            <a href="#" class="transition" target="_blank">顺丰，菜鸟，令狐冲，岳不群</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="wrap-left pull-left">
                <!--文章内容页-->
                <div class="article-left-btn-group is-sticky" id="article-left-btn-group197460">
                    <ul>
                        <li><a class="js-article-pl-anchor" href="#tag-box"><i
                                class="icon icon-article icon-article-pl">评论</i></a></li>
                        <!--普通文章收藏-->
                        <li><a class="js-collection-article"><i class="icon icon-article icon-article-col active">收藏</i></a>
                        </li>
                    </ul>
                </div>
                <div class="article-wrap">
                    <!--正文-->
                    <div id="contentArticle"></div>
                    <div class="Qr-code">
                        <!--普通文章点赞-->
                        <div class="praise-box transition js-like-article" id="zan" style="margin: 0 auto">
                            <div class="praise-box-add" id="addGif">
                                <i class="icon icon-article-zan-add"></i>
                                <span id="result">+1</span>
                            </div>
                            <i class="icon icon-article-zan"></i><span class="num"
                                                                       id="num">${articleDetail.article.articleUp}</span>
                        </div>
                    </div>
                    <!--tag-->
                    <div class="tag-box " id="tag-box">
                        <ul class="transition">
                            <c:forEach items="${articleDetail.articleAttachPojo.tags}" var="tag">
                                <li class="transition">${tag}</li>
                            </c:forEach>
                        </ul>
                    </div>
                    <!--公共评论-->
                    <div class="pl-wrap" id="pl-wrap-article" name="pl-wrap-article">
                        <div class="pl-form-wrap">
                            <span class="span-mark-author active">发表评论</span>
                            <div class="pl-form-author">
                                <div class="author-info">
                                    <div class="author-face pl-yh-article-publish">
                                        <img src="${path}/resource/sy-img/touxiang.jpg">
                                    </div>
                                    <span class="author-name pl-yh-article-publish">${sessionScope.user.userName}</span>
                                    <a class="author-vip-icon pl-yh-article-publish" href="#"></a>
                                </div>
                            </div>
                            <div class="pl-form-box pl-article-wrap">
                                <div class="no-login-box "><a class="js-login">登录</a>后参与评论</div>
                                <textarea class="form-control hide" id="saytext" name="saytext"
                                          placeholder="客官，8个字起评，不讲价哟"></textarea>
                                <!--普通文章评论发表-->
                                <button class="btn btn-article js-login transition ">发表</button>
                            </div>
                        </div>


                        <div id="pl-wrap197460" name="pl-wrap"></div>
                        <div class="pl-list-wrap">
                            <div class="pl-loading hide"><img src="${path}/resource/images/loading.gif"></div>
                            <a href="javascript:void(0)" class="span-mark-author active js-default-new-pl"
                               data-type="agree">默认评论</a>
                            <i class="icon icon-line-pl"></i>
                            <a href="javascript:void(0)" class="span-mark-author new js-default-new-pl"
                               data-type="dateline">最新评论</a>
                            <div class="pl-box-wrap">
                                <div class="pl-box-top">
                                    <div class="dropdown pull-right">
                                        <button class="btn btn-default dropdown-toggle" type="button"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                            <span class="caret"></span>
                                        </button>
                                    </div>
                                    <div class="author-info">
                                        <div class="author-face"><img
                                                src="https://img.huxiucdn.com/auth/data/avatar/001/54/60/18_1479690318.jpg?|imageMogr2/strip/interlace/1/quality/85/format/jpg">
                                        </div>
                                        <span class="author-name"><a href="#">请叫我__宝器</a><a href="/vip"
                                                                                            target="_blank"></a></span>
                                        <span class="time">6天前</span>
                                    </div>
                                    <div class="pl-content">三个这么浅显的例子和分析就能让作者得出结论，这"一叶知秋"的本事我也是服的。</div>
                                </div>
                                <div class="pl-box-btm">
                                    <div class="article-type pull-right">
                                        <div class="icon-like-prompt">
                                            <i class="icon icon-like active"></i><span class="c1">+1</span>
                                        </div>
                                        <div class="icon-no-like-prompt">
                                            <i class="icon icon-no-like active"></i><span class="c1">+1</span>
                                        </div>
                                        <ul>
                                            <li class="js-icon-like" data-type="like"><i
                                                    class="icon icon-like "></i><span class="like">2</span></li>
                                            <li class="js-no-icon-like" data-type="no-like"><i
                                                    class="icon icon-no-like "></i><span class="like">1</span></li>
                                        </ul>
                                    </div>
                                    <div class="btn-dp transition js-add-dp-box"><i class="icon icon-dp"></i>我要点评</div>
                                    <div class="pl-form-box dp-article-box">
                                        <textarea class="form-control" placeholder="客官，8个字起评，不讲价哟"></textarea>
                                        <button class="btn btn-article js-article-dp">发表</button>
                                    </div>
                                </div>

                            </div>
                            <div class="pl-box-wrap  " data-pid="644658" id="g_pid644658">
                                <div class="pl-box-top">
                                    <div class="dropdown pull-right">
                                        <button class="btn btn-default dropdown-toggle" type="button"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                            <li class="pl-report js-report-pl" aid="197460" pid="644658">举报</li>
                                        </ul>
                                    </div>
                                    <div class="author-info">
                                        <div class="author-face"><img
                                                src="https://img.huxiucdn.com/auth/data/avatar/001/68/30/86_1496144520.jpg?|imageMogr2/strip/interlace/1/quality/85/format/jpg">
                                        </div>
                                        <span class="author-name">
                    					<a href="#">lingboxiu</a>
                    					<a href="#" target="_blank"></a>
                					</span>
                                        <span class="time">6天前</span>
                                    </div>
                                    <div class="pl-content">小罐茶，记得是非常非常贵</div>
                                    <div class="dp-box">
                                        <span class="span-mark-author">点评</span>
                                        <div class="dl-user dl-user-list  " data-type="dl-user" style="display:block">
                                            <ul>
                                                <li class="del-pl108924"><a href="#" target="_blank"><img
                                                        src="https://img.huxiucdn.com/auth/data/avatar/3.jpg?|imageMogr2/strip/interlace/1/quality/85/format/jpg"></a>
                                                </li>
                                            </ul>
                                            <!--只有一条点评时显示-->
                                            <div class="one-pl-content one-pl-content-box">
                                                <div class="pull-right time">6天前</div>
                                                <p class="content">
                                                    <span class="name">寂地_</span>
                                                    <a href="#" target="_blank"></a>&nbsp;&nbsp;
                                                    <span class="author-content">@lingboxiu 马云家有，对我尔等来说确实是灰常贵</span>
                                                </p>
                                                <div class="js-hf-article-pl"><span>回复</span></div>
                                                <div class="hu-pl-box">
                                                    <textarea class="form-control"
                                                              placeholder="客官，8个字起评，不讲价哟"></textarea>
                                                    <button class="btn btn-article js-article-dp" data-type="hf">发表
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dp-list-box" style="display:none">
                                            <div class="dl-user del-pl108924">
                                                <ul>
                                                    <li><a href="#" target="_blank"><img
                                                            src="https://img.huxiucdn.com/auth/data/avatar/3.jpg?|imageMogr2/strip/interlace/1/quality/85/format/jpg"></a>
                                                    </li>
                                                </ul>
                                                <div class="one-pl-content">
                                                    <div class="pull-right time">6天前</div>
                                                    <p class="content">
                                                        <span class="name">寂地_</span>
                                                        <a href="#" target="_blank"></a>&nbsp;&nbsp;
                                                        <span class="author-content"><a href="#" target="_blank">@lingboxiu</a> 马云家有，对我尔等来说确实是灰常贵</span>
                                                    </p>
                                                    <div class="js-hf-article-pl"><span>回复</span></div>
                                                    <div class="hu-pl-box">
                                                        <textarea class="form-control"
                                                                  placeholder="客官，8个字起评，不讲价哟"></textarea>
                                                        <button class="btn btn-article js-article-dp" data-type="hf">
                                                            发表
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="close-dp-list-box js-show-hide-dp-box" data-buttom="true">收起
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="pl-box-btm">
                                    <div class="article-type pull-right">
                                        <div class="icon-like-prompt">
                                            <i class="icon icon-like active"></i><span class="c1">+1</span>
                                        </div>
                                        <div class="icon-no-like-prompt">
                                            <i class="icon icon-no-like active"></i><span class="c1">+1</span>
                                        </div>
                                        <ul>
                                            <li class="js-icon-like" data-type="like"><i
                                                    class="icon icon-like "></i><span class="like">2</span></li>
                                            <li class="js-no-icon-like" data-type="no-like"><i
                                                    class="icon icon-no-like "></i><span class="like">1</span></li>
                                        </ul>
                                    </div>
                                    <div class="btn-dp transition js-add-dp-box"><i class="icon icon-dp"></i>我要点评</div>
                                    <div class="pl-form-box dp-article-box">
                                        <textarea class="form-control" placeholder="客官，8个字起评，不讲价哟"></textarea>
                                        <button class="btn btn-article js-article-dp">发表</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!--相关文章位置-->
                    <div id="related-article-wrap197460"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="article-section article-section-last"></div>
</div>


<%@include file="footer.jsp" %>
<script type="text/javascript" src="${path}/resource/js/mouse.js"></script>
<script>
    $(function () {

        var zanState = 0;
        $("#zan").click(function () {
            var zan = $("#zan"),
                addGif = $("#addGif"),
                result = $("#result"),
                num_txt = $("#num"),
                num = parseInt(num_txt.text());
            if (zanState == 0) {
                zan.addClass("active"),
                    num += 1;
                result.text("+1"),
                    num_txt.text(num);
                addGif.stop().animate({opacity: '1'}, "slow");
                addGif.animate({opacity: '0'}, "slow");
                zanState = 1;
                zanAddFun("zanPlus");
            } else {
                zan.removeClass("active");
                result.text("-1");
                num -= 1;
                num_txt.text(num);
                addGif.animate({opacity: '1'}, "slow");
                addGif.animate({opacity: '0'}, "slow");
                zanState = 0;
                zanAddFun("zanMinus");
            }
        });


        function zanAddFun(opKind) {
            var articleId = ${articleDetail.article.articleId},
                orNumber = $("#zanNumber").val();
            var loadTagUrl = "${path}/zanOrCai/" + articleId + "/" + opKind + "/" + orNumber;
            var html = "";
            $.get(loadTagUrl, function (data) {
                $("#zanNumber").val(data);
//                alert($("#zanNumber").val());
            });
        }

    })
</script>
<script>
    $(document).ready(function () {
        $(".dp-article-box").fadeOut(0);
        $(".js-add-dp-box").click(function () {
            $(".dp-article-box").not($(this).next()).slideUp('fast');
            $(this).next().slideToggle(400);
        });
        if (${sessionScope.user != null}) {
            $(".no-login-box").addClass("hide");
            $("#saytext").removeClass("hide");
        }
        if (${sessionScope.user == null}) {
            $(".no-login-box").removeClass("hide");
            $("#saytext").addClass("hide");
        }

    });
</script>
</body>
</html>
