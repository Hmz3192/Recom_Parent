<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户页-知木</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/build.css">
    <link href="${path}/resource/css/login.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resource/css/zzsc.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resource/css/dlzc.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css" href="${path}/resource/slide/css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resource/slide/css/htmleaf-demo.css">
    <link href="${path}/resource/slide/css/style.css" type="text/css" rel="stylesheet"/>

    <script type="text/javascript" src="${path}/resource/slide/delighters.js"></script>

    <link rel="stylesheet" type="text/css" href="${path}/resource/model/zeroModal.css" />

<%--<script type="text/javascript" src="${path}/resource/js/jquery.js"></script>--%>
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>

    <script src="${path}/resource/js/bootstrap.min.js"></script>
    <script src="${path}/resource/model/zeroModal.min.js"></script>

    <!--<script language="javascript" type="text/javascript" src="${path}/resource/js/main.js"></script>-->
    <!--<script language="javascript" type="text/javascript" src="${path}/resource/js/popwin.js"></script>-->
    <style type="text/css">

        #tagbox {
            position: relative;
            margin: 20px auto 0px;
            width: 300px;
            height: 250px;
            background: #f8c82d;
        }

        #tagbox a {
            position: absolute;
            padding: 3px 6px;
            font-family: Microsoft YaHei;
            color: #fff;
            TOP: 0px;
            font-weight: bold;
            text-decoration: none;
            left: 0px
        }

        #tagbox a:hover {
            border: #eee 1px solid;
            background: #a2a2a2;
        }

        #tagbox .blue {
            color: #3ca5f6;
            font-size: 30px;
        }

        #tagbox .red {
            color: #f63756;
            font-size: 30px;

        }

        #tagbox .yellow {
            color: yellow;
            font-size: 30px;

        }

        #tagbox .common {
            color: #8a6d3b;
            font-size: 30px;

        }


    </style>
</head>

<body style="background-color:#f0f4fb;">
<%@include file="header.jsp" %>

<div class="placeholder-height" id="zuji"></div>
<div class="container per_center_body" id="per_center">
    <div class="user-info-warp">
        <div class="user-head-box">
            <div class="user-face"><img src="${path}/resource/sy-img/touxiang.jpg"></div>
            <div class="user-name">${sessionScope.user.userName}<a href="#" target="_blank"><i class="i-vip icon-vip"
                                                                                               title="虎嗅黑卡会员"></i></a>
            </div>
            <div class="user-one"></div>
            <div class="user-one user-auth">认证作者<i class="i-icon icon-auth3" title="虎嗅认证作者"></i></div>
            <a href="#myModal-1" data-toggle="modal" class="btn btn-messages js-login">编辑资料</a>
            <div class="admin-btn-warp"></div>
        </div>
        <div class="user-info-box">
            <div class="col-lg-5">
                <div class="more-user-info"><i class="icon icon-user-point"></i>真实姓名：保密</div>
                <div class="more-user-info"><i class="icon icon-user-point"></i>手机：未填写</div>
                <div class="more-user-info"><i class="icon icon-user-point"></i>注册时间：2015-06-29</div>
                <div class="more-user-info" style="padding-left:75px;"><span>认证星级：<i class="i-icon2 icon2-stars03"></i></span>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="more-user-info"><i class="icon icon-user-point"></i>
                    <c:if test="${sessionScope.user.sex == 1}">
                        性别：男
                    </c:if>
                    <c:if test="${sessionScope.user.sex == 0}">
                        性别：女
                    </c:if>
                </div>
                <div class="more-user-info"><i class="icon icon-user-point"></i>所在地址：保密</div>
            </div>
            <!-- <div class="col-lg-5">
                 <div class="user-info"><i class="icon icon-user-point"></i>公司：旅客App</div>
                 <div class="user-info"><i class="icon icon-user-point"></i>职业：产品个体户</div>
                 <div class="user-info"><i class="icon icon-user-point"></i>邮箱：保密</div>
             </div>
             <div class="col-lg-7">
                 <div class="user-info"><i class="icon icon-user-point"></i>微博：http://weibo.com/alexli2011</div>
                 <div class="user-info"><i class="icon icon-user-point"></i>微信：17276694</div>
                 <div class="user-info"><i class="icon icon-user-point"></i>微信公众号：lvkeapp2015</div>
             </div>
             <div class="btn-box"><a class="js-sea-more-info more-info pull-right">更多<span class="caret"></span></a></div>-->
            <!--<div class="more-user-info-box">
                <div class="col-lg-5">
                    <div class="more-user-info"><i class="icon icon-user-point"></i>真实姓名：保密</div>
                    <div class="more-user-info"><i class="icon icon-user-point"></i>手机：保密</div>
                </div>
                <div class="col-lg-7">
                    <div class="more-user-info"><i class="icon icon-user-point"></i>性别：男</div>
                    <div class="more-user-info"><i class="icon icon-user-point"></i>所在地址：保密</div>
                </div>
                <div style="clear:both; width:100%;">
                    <div class="more-user-info"><i class="icon icon-user-point"></i>注册时间：2015-06-29</div>
                </div>
                <div style="width:100%;">
                    <div class="more-user-info" style="padding-left:75px;"><span>认证星级：<i class="i-icon2 icon2-stars03"></i></span></div>
                </div>
            </div>-->
        </div>
    </div>
    <div id="menu" name="menu"></div>
    <div class="user-menu-warp">
        <div class="menu-warp">
            <ul id=myTabs1>
                <li class="active" onMouseDown=Tabs1(this,0);><a href="#menu">我的文章</a></li>
                <li class="" onMouseDown=Tabs1(this,1);><a href="#menu">我的评论</a></li>
                <li class="" onMouseDown=Tabs1(this,2);><a href="#zuji">我的足迹</a></li>
                <!--<li class="" onMouseDown=Tabs1(this,4);><a href="#menu">我的项目</a></li>-->
            </ul>
        </div>
        <!-- <div class="user-content-warp">


             <div class="no-content-prompt">
                 您还没有文章
             </div>
         </div>-->
        <div class="user-content-warp" id=myTabs1_Content0>
            <ul class="nav-box" id="ula">
                <li class="active" id="li1"><a href="#menu"><span id="span1">已发布（0）</span></a></li>
                <li class="" id="li2"><a href="#menu"><span id="span2">审核中（0）</span></a></li>
                <li class="" id="li3"><a href="#menu"><span id="span3">未通过（1）</span></a></li>
                <li class="" id="li4"><a href="#menu"><span id="span4">草稿箱（1）</span></a></li>
            </ul>
            <div class="message-box" id="arBox">
                <ul id="articleList">
                </ul>
            </div>
            <nav class="page-nav">
                <ul class="pagination">
                    <li class="disabled"><a href="#" aria-label="First"><span aria-hidden="true"><i
                            class="icon icon-first"></i></span></a></li>
                    <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true"><i
                            class="icon icon-lt"></i></span></a></li>
                    <li class="active"><a>1</a></li>
                    <li><a href="#">..</a></li>
                    <li><a href="#"><i class="icon icon-gt"></i></a></li>
                    <li><a href="#"><i class="icon icon-last"></i></a></li>
                </ul>
            </nav>
        </div>
        <div class="user-content-warp" style="display:none" id=myTabs1_Content1>
            <ul class='nav-box' id=myTabs2>
                <li class="active" onMouseDown=Tabs2(this,0);><a href="#">评论（1）</a></li>
                <li class="" onMouseDown=Tabs2(this,1)><a href="#">点评（1）</a></li>
            </ul>
            <div class="message-box" id=myTabs2_Content0>
                <ul>
                    <li type="comment">
                        <div class="message-title"><a href="#" target="_blank">1直播甚至短视频的最大隐患在于，主流用户的消费习惯尚未形成，一旦受限于用户规模增长停滞，则高流失率带来的后果可想而知</a>
                        </div>
                        <div class="message-time">1天前<span class="message-article">来自文章：<a href="#" target="_blank">资本的局，直播的病，斗鱼映客们扎堆融资背后的心思与隐忧</a></span>
                        </div>
                    </li>
                </ul>
                <nav class="page-nav">
                    <ul class="pagination">
                        <li class="disabled"><a href="#" aria-label="First"><span aria-hidden="true"><i
                                class="icon icon-first"></i></span></a></li>
                        <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true"><i
                                class="icon icon-lt"></i></span></a></li>
                        <li class="active"><a>1</a></li>
                        <li><a href="#"><i class="icon icon-gt"></i></a></li>
                        <li><a href="#"><i class="icon icon-last"></i></a></li>
                    </ul>
                </nav>
            </div>
            <div class="message-box" style="display:none" id=myTabs2_Content1>
                <ul>
                    <li type="recomment">
                        <blockquote>
                            1社交国内产品真能成大气候，月活过三亿的，我估计最终会有四个，微信、QQ、微博、……。过一亿在垂直领域有大成就的，也会有四个左右［不算过三亿］，陌陌、快手基本上会是，还有二个位置
                        </blockquote>
                        <div class="message-title"><span class="me-dp">TA的点评：</span><a href="#" target="_blank">微博是social
                            media，快手是video community，严格讲不算社交产品</a></div>
                        <div class="message-time">2017-05-29<span class="message-article">来自文章：<a
                                href="/article/197348.html" target="_blank">冷眼看快手、陌陌们的"短视频社交"</a></span></div>
                    </li>
                </ul>
                <nav class="page-nav">
                    <ul class="pagination">
                        <li class="disabled"><a href="#" aria-label="First"><span aria-hidden="true"><i
                                class="icon icon-first"></i></span></a></li>
                        <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true"><i
                                class="icon icon-lt"></i></span></a></li>
                        <li class="active"><a>1</a></li>
                        <li><a href="#"><i class="icon icon-gt"></i></a></li>
                        <li><a href="#"><i class="icon icon-last"></i></a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <!--我的足迹-->
        <div class="user-content-warp" style="display:none" id=myTabs1_Content2>
            <div class="collect-box"><span class="collect-title">我的足迹</span></div>

            <article>
                <section data-delighter class="splash">
                    <h1 data-delighter class="right"><code>2018-02-14</code></h1>
                    <h2 data-delighter class="left">您在我们网站注册了第一个属于你的账号，我们与您相遇</h2>
                    <p data-delighter="start:1" class="bottom">
                        我们一起走过了 <a href="#"><a style="font-size:50px;color: #c7254e">48 </a>天</a>
                    </p>
                </section>
                <section>
                    <h3 data-delighter class="right">在这48天里，您一共浏览了<a style="font-size:32px;color: #c7254e"> 130 </a>篇文章
                    </h3>
                    <h3 data-delighter class="left">并对其中的<a style="font-size:50px;color: #c7254e"> 36 </a>篇文章进行了点评</h3>
                    <h4 data-delighter>其中，您最喜爱的文章是： </h4>
                    <ul data-delighter>
                        <li>公务员、老师酒驾直接开除？！法盲才会信吧！ <a style="font-size:20px;color: #c7254e">10min</a>
                        </li>
                        <li>全民直播时代，未成年权直播益如何维护 <a style="font-size:20px;color: #c7254e">9min</a></li>
                        <li>员工未缴社保，公司以工作失职解雇HR | 实务派 <a style="font-size:20px;color: #c7254e">8min</a></li>
                        <li>专业原创 | 从“稻花香”案谈商品通用名称的认定 <a style="font-size:20px;color: #c7254e">8min</a></li>
                        <li>很重要！工伤赔偿，记住这7个时限 <a style="font-size:20px;color: #c7254e">8min</a></li>
                        <li>邀请函|律师业务培训公益系列讲座（第一期） <a style="font-size:20px;color: #c7254e">7min</a></li>
                    </ul>
                </section>
                <section>
                    <h2 data-delighter class="right">您使用搜索引擎，一共搜索<a style="font-size:30px;color: #c7254e"> 177</a>次</h2>
                    <h4 data-delighter>其中： </h4>
                    <ul data-delighter>
                        <li><code>侯亮平</code> 38 次</li>
                        <li><code>陈海</code> 23 次</li>
                        <li><code>热血</code> 17 次</li>
                    </ul>
                </section>
                <section>
                    <h3 data-delighter class="right">我们为您生成如下您最喜爱的标签模型：</h3>
                    <script type="text/javascript" src="${path}/resource/slide/script.js"></script>
                    <div id="tagbox">
                        <a class="yellow">司法</a>
                        <a class="blue">影视</a>
                        <a class="common">社会</a>
                    </div>
                </section>
            </article>
        </div>
        <!--<div class="user-content-warp" style="display:none" id=myTabs1_Content4>
            <div class="product-html-box">
                <div class="message-box">
                    <ul>
                        <li type="article">
                            <div class="cy-mod-thumb">
                                <a class="transition" href="#" target="_blank"><img class="lazy"
                                                                                    src="images/1461314509617354.png"
                                                                                    alt="旅客"></a>
                            </div>
                            <div class="cy-mob-ctt">
                                <div class="cp-name"><a href="#" class="transition" target="_blank">旅客</a></div>
                                <div class="cp-time"> 提交时间：2016-04-22</div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>-->
    </div>
</div>
<!--修改个人信息-->
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal-1" class="modal fade">
    <div class="modal-dialog" style="width: 40%;">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 class="modal-title">修改个人信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="name" class="col-lg-2 control-label"
                               style="position: relative!important;">用户名：</label>
                        <div class="col-lg-10">
                            <input type="email" class="form-control" id="name" placeholder="1-1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sex" class="col-lg-2 control-label"
                               style="position: relative!important;">性别：</label>
                        <div class="col-lg-10" id="sex">
                            <input id="male" type="radio"  name="gender" value="男">
                            <label for="male">男</label>
                            <input id="female" type="radio"  checked ="true" name="gender" value="女">
                            <label for="female">女</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-lg-2 control-label"
                               style="position: relative!important;">联系方式</label>
                        <div class="col-lg-10">
                            <input type="password" class="form-control" id="phone" placeholder="15558680172">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="location" class="col-lg-2 control-label"
                               style="position: relative!important;">地址</label>
                        <div class="col-lg-10">
                            <input type="password" class="form-control" id="location" placeholder="湖北省武汉市江岸区">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="prepassword" class="col-lg-2 control-label"
                               style="position: relative!important;">新密码</label>
                        <div class="col-lg-10">
                            <input type="password" class="form-control" id="prepassword" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="againPassword" class="col-lg-2 control-label"
                               style="position: relative!important;">重复密码</label>
                        <div class="col-lg-10">
                            <input type="password" class="form-control" id="againPassword" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-offset-2 col-lg-10">
                            <button type="submit" class="btn btn-info">确定</button>
                        </div>
                    </div>
                </form>

            </div>

        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
<script type="text/javascript">
    $(function () {
        //当前查询第几页
        var currentPage = 1;
        //每页数量
        var rows = 5,
            statue = 1;

        $(document).ready(function () {
            loadMyArticleOnline(statue);
            loadArticleNum();

        })

        function loadArticleNum() {
            var url = "${path}/ln", userId = ${sessionScope.user.userId};
            var params = {"userId": userId}
            $.get(url, params, function (data) {
                var yf = data.yf,
                    sh = data.sh,
                    wg = data.wg,
                    cg = data.cg
                $('#span1').text("已发布 (" + yf + ")");
                $('#span2').text("未通过 (" + sh + ")");
                $('#span3').text("审核中 (" + wg + ")");
                $('#span4').text("草稿箱 (" + cg + ")");
            });
        }

        $('#ula a').click(function () {
            $(this).parent().parent().children().removeClass("active");
            $(this).parent().addClass("active");
//            alert($(this).parent().attr('id'))
            if ($(this).parent().attr('id') == 'li1') {
                statue = 1
                loadMyArticleOnline(statue);
            } else if ($(this).parent().attr('id') == 'li2') {
                statue = 0
                loadMyArticleOnline(statue);
            } else if ($(this).parent().attr('id') == 'li3') {
                statue = 2
                loadMyArticleOnline(statue);
            } else if ($(this).parent().attr('id') == 'li4') {
                statue = 3
                loadMyArticleOnline(statue);
            }
        })


        function loadMyArticleOnline(statue) {
            var loadTagUrl = "${path}/getMyArticle",
                userId = ${sessionScope.user.userId};
            var params = {"userId": userId, "statue": statue, "currentPage": currentPage, "rows": rows},
                html = "";
            zeroModal.loading(2)
            $.post(loadTagUrl, params, function (data) {
                zeroModal.closeAll()
                if (data.length == 0) {
//                    alert("Tag无数据");
                    html += '<p>Ta 还没有留下任何文章</p>';
                    $("#arBox").append(html);
                } else {
                    $("#articleList").empty();
                    var result = data.amounts, len = result.length, i = 0;
                    for (; i < len; i++) {
                        var rs = result[i],
                            id = rs.articleId,
                            //                        pic = "http://localhost:8111/" + rs.articleAvatar,
                            pic = rs.articleAvatar,
                            title = rs.articleTitle,
                            releaseTime = rs.releaseTime,
                            summary = rs.articleSummary,
                            article_href = "${path}/editBlog/" + id;

                        /*    html += '<div class="mod-b mod-art">' +
                         '<a class="transition" href="' + article_href + '" target="_blank">' +
                         '<div class="mod-thumb"><img class="lazy" src="' + pic + '" alt="' + title + '" style="display: inline;"></div></a> ' +
                         '<div class="mob-ctt"><h3><a href="' + article_href + '" class="transition" target="_blank">' + title + '</a></h3>' +
                         '<div class="mob-author"><span class="time">6天前</span></div><div class="mob-sub">' + summary + '</div></div></div>';*/
                        if (statue == 0 || statue == 3) {
                            html += '<li type="article" >' +
                                '<div class="message-title"><a href="' + article_href + '" target="_blank">' + title + '</a></div>' +
                                '<div class="message-time">' + releaseTime + '</div>' +
                                '<div class="pull-right message-delete">' +
                                '<a href="' + article_href + '" target="_blank">' +
                                '<i class="icon icon-edit"></i>' +
                                '</a>' +
                                '<i class="icon icon-delete js-pc-del-user"></i>' +
                                '</div></li>'
                        } else
                            html += '<li type="article" >' +
                                '<div class="message-title"><a href="' + article_href + '" target="_blank">' + title + '</a></div>' +
                                '<div class="message-time">' + releaseTime + '</div>' +
                                '<div class="pull-right message-delete">' +
                                '<i class="icon icon-delete js-pc-del-user"></i>' +
                                '</div></li>'

                    }
                    $("#articleList").append(html);
                }
            });
        }

    });


</script>
<script>
    $(document).ready(function () {
        $(".more-user-info-box").fadeOut(0);
        $(".btn-box").click(function () {
            $(".more-user-info-box").not($(this).next()).slideUp('fast');
            $(this).next().slideToggle(400);
        });
    });
</script>
<script type="text/javascript" src="${path}/resource/js/mouse.js"></script>

</body>
</html>
