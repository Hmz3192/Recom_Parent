<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>首页-NewsPro</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <meta name="renderer" content="webkit">
    <meta name="baidu-site-verification" content="R9XA5lWxu2"/>
    <meta name="author" content="NewsPro">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/build.css">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/activity.css">
    <link href="${path}/resource/css/login.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resource/css/zzsc.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resource/css/dlzc.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css" href="${path}/resource/css/nanoscroller.css">

    <link rel="stylesheet" type="text/css" href="${path}/resource/model/zeroModal.css" />

    <script type="text/javascript" src="${path}/resource/js/jquery.js"></script>

    <script src="${path}/resource/model/zeroModal.min.js"></script>

    <style type="text/css">
        .myButton {
            background-color:transparent;
            -moz-border-radius:4px;
            -webkit-border-radius:4px;
            border-radius:4px;
            border:1px solid #555;
            display:inline-block;
            cursor:pointer;
            color: #ff6060;
            background-color:#fff;
            font-family:Arial;
            font-weight:bold;
            text-decoration:none;
            align-items:center;
        }
        .myButton:hover {
            background-color:#FF5722;;
            color: #fff;
            border:1px solid #fff;
        }
        .myButton:active {
            position:relative;
            top:1px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            //请求数据接口
            var url = "${path}/json";
            //渲染数据集合dom
            var list = $("#list");
            //加载更多dom
            var loadingBtn = $("#loading");
            //是否需要加载
            var isLoad = true;
            //当前查询第几页
            var currentPage = 1;
            //每页数量
            var rows = 10;
            //没有更多数据
            var nomore_Text = '没有更多数据';
            var userId = "";

            /*
             页面加载完毕执行一次查询
             */
            window.onload = function () {
                loadReWen();
                //加载数据
                <c:if test="${sessionScope.user == null}">
                //游客，得出最点击量高和赞高的
                loadData();
                </c:if>
                <c:if test="${sessionScope.user != null}">
                userId = ${sessionScope.user.userId}
                    loadRecoData();
                </c:if>


            };


            /*
             请求正文列表接口
             */
            function loadData() {
                zeroModal.loading(2);
                //发送ajax
                $.ajax({
                    //url
                    url: url,
                    //请求方式
                    type: 'POST',
                    //参数
                    data: {currentPage: currentPage, rows: rows},
                    //成功回调
                    success: function (data) {
                        zeroModal.closeAll()
                        setData2Html(data);
                    },
                    //失败回调
                    error: function (e, e2, e3) {
                        //
                        alert('请求失败，原因：' + e3);
                    }
                });
            }

            /*
             请求热文列表接口
             */
            function loadReWen() {
                $.get("${path}/rewen", function (data1) {
                    var html = '', result1 = data1.amounts, len2 = result1.length, i = 0;
                    var path = '${path}';
                    //循环数据
                    for (; i < len2; i++) {
                        var rs = result1[i],
                            id = rs.articleId
//                            pic = "http://localhost:8111/" + rs.articleAvatar,
                        if (rs.articleAvatar.length == 0 || rs.articleAvatar == "") {
                            var pic = "${path}/attached/cover/20180312/20180312131741_222.jpg"
                        } else
                            var pic = rs.articleAvatar,
                        title = rs.articleTitle,
                            articleHints = rs.articleHints,
                            article_href = path + "/toarticle/" + id;

                        html += '<li><div class="hot-article-img">' +
                            '<a href=" ' + article_href + '" target="_blank" title="' + title + '">' +
                            '<img src="' + pic + '"></a></div>' +
                            '<a href="' + article_href + '" class="transition" target="_blank">' + title + '</a>' +
                            '<div style="float: right"><span class="watch-icon" style="margin-right: 5px"  ></span> ' +
                            '<span style="font-size: 20px;" > ' + articleHints + ' </span></div></li>';
                    }

                    $("#reWen").append(html)
                })
            }
            //获取离线推荐
            function loadRecoData() {
                zeroModal.loading(2);

                //发送ajax
                $.ajax({
                    //url
                    url: "${path}/loadRecom",
                    //请求方式
                    type: 'POST',
                    //参数
                    data: {currentPage: currentPage, rows: 20, userId: userId},
                    //成功回调
                    success: function (data) {
                        zeroModal.closeAll()
                        if (data.total == 0) {
                            alert("0");
                        } else
                            setHuanYiPi(data);
                    },
                    //失败回调
                    error: function (e, e2, e3) {
                        //
                    }
                });
            }

            var zanCancle = 0, downCancle = 0;
            $(document).on("click", "#like", function () {
                if (downCancle == 0) {
                    var zanAdd = $(this).parent().parent().children("#zanAdd"),
                        upNum = $(this).children("#upNum"),
                        up = $(this).children("#up"),
                        upText = $(this).parent().parent().children().children("#upText"),
                        num = parseInt(upNum.text());
                    if (zanCancle == 0) {
                        up.addClass("active")
                        num += 1
                        upText.text("+1")
                        upNum.text(num)
                        zanAdd.stop().animate({opacity: '1'}, "slow")
                        zanAdd.animate({opacity: '0'}, "slow")
                        zanCancle = 1;
                    } else {
                        up.removeClass("active")
                        upText.text("-1")
                        num -= 1
                        upNum.text(num)
                        zanAdd.animate({opacity: '1'}, "slow")
                        zanAdd.animate({opacity: '0'}, "slow")
                        zanCancle = 0;
                    }
                }

            });


            $(document).on("click", "#noLike", function () {
                if (zanCancle == 0) {
                    var zanDown = $(this).parent().parent().children("#zanDown"),
                        downNum = $(this).children("#downNum"),
                        down = $(this).children("#down"),
                        downText = $(this).parent().parent().children().children("#downText"),
                        num2 = parseInt(downNum.text());
                    if (downCancle == 0) {
                        down.addClass("active")
                        num2 += 1
                        downText.text("+1")
                        downNum.text(num2)
                        zanDown.stop().animate({opacity: '1'}, "slow")
                        zanDown.animate({opacity: '0'}, "slow")
                        downCancle = 1;
                    } else {
                        down.removeClass("active")
                        downText.text("-1")
                        num2 -= 1
                        downNum.text(num2)
                        zanDown.animate({opacity: '1'}, "slow")
                        zanDown.animate({opacity: '0'}, "slow")
                        downCancle = 0;
                    }
                }

            });

            function setHuanYiPi(data) {
                $("#list").empty();
                var html = '', result = data.amounts, len = result.length, i = 0;
                var path = '${path}';
                for (; i < len; i++) {

                    //循环数据

                    var rs = result[i],
                        id = rs.articleId;

//                        pic = "http://localhost:8111/" + rs.articleAvatar,
                    if (rs.articleAvatar.length == 0 || rs.articleAvatar == "") {
                        var pic = "${path}/attached/cover/20180312/20180312131741_222.jpg"
                    } else
                        var pic = rs.articleAvatar
                    var title = rs.articleTitle,
                        summary = rs.articleSummary,
                        collection = rs.articleCollection,
                        up = rs.articleUp,
                        down = rs.articleDown,
                        hints = rs.articleHints,
                        kindParentName = rs.kindParentName;
                        if (rs.kindChildName != null) {
                        var kindChildName = rs.kindChildName
                    }
                    var articleSource = rs.articleSource
                    var articleBig = rs.articleBig;
//                    html+='<li data-id="'+id+'">'+title+'</li>';
                    var article_href = path + "/toarticle/" + id;
                    if (articleBig > 0) {
                        html += '<div class="mod-b mod-art mod-b-push ">' +
                            '<a class="transition" href="' + article_href + '" target="_blank" title="' + title + '">' +
                            '<div class="mod-thumb ">' +
                            '<img class="lazy" style="max-width: 100%;max-height: 100%;" src="' + pic + '" alt="' + title + '" >' +
                            '</div></a>' +
                            '<div class="column-link-box column-link-big-box">' +
                            '<a href="#" class="column-link" target="_blank">' + articleSource + ' </a> ' +
                            '</div><div class="mob-ctt">' +
                            '<h2><a href="' + article_href + '" class="transition msubstr-row5" target="_blank">' + title + '</a></h2>' +
                            '<div class="mob-author"><div class="author-face">' +
                            '<a href="#" target="_blank"><img class="lazy" src="/resource/sy-img/59_1502432173.jpg"></a>' +
                            '</div><a href="#" target="_blank">' +
                            '<span class="author-name">autocarweekly</span>' +
                            '</a>' +
                            '</div>' +
                            '<div class="mob-author">' +
                            '<i class="icon icon-cmt" style="margin-left: 5px" title="点击量"></i><em title="点击量">' + hints + '</em>' +
                            '<i class="icon icon-fvr" style="margin-left: 5px" title="收藏量"></i><em title="收藏量">' + collection + '</em>' +
                            '<div class="article-type pull-right">' +
                            '<div class="icon-like-prompt" id="zanAdd"><i class="icon icon-like active"></i><span class="c1" id="upText">+1</span>' +
                            '</div>' +
                            '<div class="icon-no-like-prompt" style="margin-left: 27%;" id="zanDown"><i class="icon icon-no-like active"></i><span class="c1" id="downText">+1</span>' +
                            '</div>' +
                            '<ul>' +
                            '<li class="js-icon-like"  id="like"><i class="icon icon-like" id="up"></i>' +
                            '<span class="like" id="upNum">' + up + '</span></li>' +
                            '<li class="js-no-icon-like"  id="noLike"><i class="icon icon-no-like " id="down" ></i>' +
                            '<span class="like" id="downNum">' + down + '</span></li>' +
                            '</ul>' +
                            '</div></div>' +
                            '<div class="mob-sub" style="word-wrap:break-word;word-break:break-all;">' + summary + '</div>' +
                            '</div></div>'
                    }else {
                        if (i == 3 || i == 7) {
                            html += '<div class="mod-info-flow">' +
                                '<div class="mod-b mod-art">' +
                                /*state*/
                                '<div class="mod-angle"> 新 </div>' +
                                '<div class="mod-thumb "><a class="transition" title="' + title + '" href="' + article_href + '" target="_blank">' +
                                /*pic1*/
                                '<img class="lazy" style="max-width: 100%;max-height: 100%;" src="' + pic + '" alt="' + title + '">' +
                                '</a></div><div class="column-link-box">' +
                                /*tag1*/
                                '<a href="#" class="column-link" target="_blank">' + articleSource + '</a>' +
                                '</div>' +
                                '<div class="mob-ctt">' +
                                /*title*/
                                '<h2><a href="' + article_href + '" class="transition msubstr-row2" target="_blank">' + title + '</a></h2>' +
                                '<div class="mob-author"><div class="author-face">' +
                                /*user-avatar*/
                                '<a href="#" target="_blank"><img src="/resource/sy-img/59_1502432173.jpg"></a></div>' +
                                /*user-name*/
                                '<a href="#" target="_blank"><span class="author-name ">量子位</span></a>' +
                                /*comment-number*/
                                '<i class="icon icon-cmt" title="点击量"></i><em title="点击量">' + hints + '</em>' +
                                /*collection-number*/
                                '<i class="icon icon-fvr" title="收藏量"></i><em title="收藏量">' + collection + '</em>' +

                                //dian zan
                                '<div class="article-type pull-right">' +
                                '<div class="icon-like-prompt" id="zanAdd" ><i class="icon icon-like active"></i><span class="c1" id="upText" >+1</span></div>' +
                                '<div class="icon-no-like-prompt" style="margin-left: 14%" id="zanDown"><i class="icon icon-no-like active"></i><span class="c1" id="downText" >+1</span></div>' +
                                '<ul>' +
                                '<li class="js-icon-like"  id="like"><i class="icon icon-like" id="up"></i>' +
                                '<span class="like" id="upNum">' + up + '</span></li>' +
                                '<li class="js-no-icon-like"  id="noLike"><i class="icon icon-no-like " id="down" ></i>' +
                                '<span class="like" id="downNum">' + down + '</span></li>' +
                                '</ul>' +
                                '</div>' +
                                /*summary*/
                                '</div><div class="mob-sub" style="word-wrap:break-word;word-break:break-all;">' + summary + '</div>' +
                                '</div></div></div>'
                        }else if(i == 1 || i ==8){
                            html += '<div class="mod-info-flow">' +
                                '<div class="mod-b mod-art">' +
                                /*state*/
                                '<div class="mod-angle"> 热 </div>' +
                                '<div class="mod-thumb "><a class="transition" title="' + title + '" href="' + article_href + '" target="_blank">' +
                                /*pic1*/
                                '<img class="lazy" style="max-width: 100%;max-height: 100%;" src="' + pic + '" alt="' + title + '">' +
                                '</a></div><div class="column-link-box">' +
                                /*tag1*/
                                '<a href="#" class="column-link" target="_blank">' + articleSource + '</a>' +
                                '</div>' +
                                '<div class="mob-ctt">' +
                                /*title*/
                                '<h2><a href="' + article_href + '" class="transition msubstr-row2" target="_blank">' + title + '</a></h2>' +
                                '<div class="mob-author"><div class="author-face">' +
                                /*user-avatar*/
                                '<a href="#" target="_blank"><img src="/resource/sy-img/59_1502432173.jpg"></a></div>' +
                                /*user-name*/
                                '<a href="#" target="_blank"><span class="author-name ">量子位</span></a>' +
                                /*comment-number*/
                                '<i class="icon icon-cmt" title="点击量"></i><em title="点击量">' + hints + '</em>' +
                                /*collection-number*/
                                '<i class="icon icon-fvr" title="收藏量"></i><em title="收藏量">' + collection + '</em>' +

                                //dian zan
                                '<div class="article-type pull-right">' +
                                '<div class="icon-like-prompt" id="zanAdd" ><i class="icon icon-like active"></i><span class="c1" id="upText" >+1</span></div>' +
                                '<div class="icon-no-like-prompt" style="margin-left: 14%" id="zanDown"><i class="icon icon-no-like active"></i><span class="c1" id="downText" >+1</span></div>' +
                                '<ul>' +
                                '<li class="js-icon-like"  id="like"><i class="icon icon-like" id="up"></i>' +
                                '<span class="like" id="upNum">' + up + '</span></li>' +
                                '<li class="js-no-icon-like"  id="noLike"><i class="icon icon-no-like " id="down" ></i>' +
                                '<span class="like" id="downNum">' + down + '</span></li>' +
                                '</ul>' +
                                '</div>' +
                                /*summary*/
                                '</div><div class="mob-sub" style="word-wrap:break-word;word-break:break-all;">' + summary + '</div>' +
                                '</div></div></div>'
                        }else {
                            html += '<div class="mod-info-flow">' +
                                '<div class="mod-b mod-art">' +
                                /*state*/
                                '<div class="mod-thumb "><a class="transition" title="' + title + '" href="' + article_href + '" target="_blank">' +
                                /*pic1*/
                                '<img class="lazy" style="max-width: 100%;max-height: 100%;" src="' + pic + '" alt="' + title + '">' +
                                '</a></div><div class="column-link-box">' +
                                /*tag1*/
                                '<a href="#" class="column-link" target="_blank">' + articleSource + '</a>' +
                                '</div>' +
                                '<div class="mob-ctt">' +
                                /*title*/
                                '<h2><a href="' + article_href + '" class="transition msubstr-row2" target="_blank">' + title + '</a></h2>' +
                                '<div class="mob-author"><div class="author-face">' +
                                /*user-avatar*/
                                '<a href="#" target="_blank"><img src="/resource/sy-img/59_1502432173.jpg"></a></div>' +
                                /*user-name*/
                                '<a href="#" target="_blank"><span class="author-name ">量子位</span></a>' +
                                /*comment-number*/
                                '<i class="icon icon-cmt" title="点击量"></i><em title="点击量">' + hints + '</em>' +
                                /*collection-number*/
                                '<i class="icon icon-fvr" title="收藏量"></i><em title="收藏量">' + collection + '</em>' +

                                //dian zan
                                '<div class="article-type pull-right">' +
                                '<div class="icon-like-prompt" id="zanAdd" ><i class="icon icon-like active"></i><span class="c1" id="upText" >+1</span></div>' +
                                '<div class="icon-no-like-prompt" style="margin-left: 14%" id="zanDown"><i class="icon icon-no-like active"></i><span class="c1" id="downText" >+1</span></div>' +
                                '<ul>' +
                                '<li class="js-icon-like"  id="like"><i class="icon icon-like" id="up"></i>' +
                                '<span class="like" id="upNum">' + up + '</span></li>' +
                                '<li class="js-no-icon-like"  id="noLike"><i class="icon icon-no-like " id="down" ></i>' +
                                '<span class="like" id="downNum">' + down + '</span></li>' +
                                '</ul>' +
                                '</div>' +
                                /*summary*/
                                '</div><div class="mob-sub" style="word-wrap:break-word;word-break:break-all;">' + summary + '</div>' +
                                '</div></div></div>'
                        }

                    }
                    if (i == 5) {
                        //adver
                        html += '<div class="mod-b mod-art promote">' +
                            '<a href="#" title="">' +
                            '<div class="mod-thumb">' +
                            '<img class="lazy" src="' + path + '/resource/sy-img/233950517521.jpg">' +
                            '</div>' +
                            '</a>' +
                            '<div class="mob-ctt">' +
                            '<a href="#" >实体商业转型</a>' +
                            '<span class="point">&bull;</span>' +
                            '<a href="#" >实体空间在召唤，他们押宝了零售业态转型升级</a>' +
                            '<span class="span-mark-pro">推广</span>' +
                            '</div>' +
                            '</div>'
                    }
                }
                //渲染数据
                list.append(html);
                //接口是否查询完毕
                if (data.total == data.currentPage || currentPage > data.total) {
                    //数据全部加载完毕
                    isLoad = false;
                    //
                    loadingBtn.html(nomore_Text);
                }
            }

            function setData2Html(data) {
                //当前页自增
                currentPage++;
                var html = '', result = data.amounts, len = result.length, i = 0;
                var path = '${path}';
                for (; i < len; i++) {

                    //循环数据

                    var rs = result[i],
                        id = rs.articleId;

//                        pic = "http://localhost:8111/" + rs.articleAvatar,
                    if (rs.articleAvatar.length == 0 || rs.articleAvatar == "") {
                        var pic = "${path}/attached/cover/20180312/20180312131741_222.jpg"
                    } else
                        var pic = rs.articleAvatar
                    var title = rs.articleTitle,
                        summary = rs.articleSummary,
                        collection = rs.articleCollection,
                        state = "热",
                        up = rs.articleUp,
                        down = rs.articleDown,
                        hints = rs.articleHints,
                        kindParentName = rs.kindParentName;
                    if(i == 5||i == 7) {
                        state = "新"
                    }
                    if (rs.kindChildName != null) {
                        var kindChildName = rs.kindChildName
                    }
                    var articleSource = rs.articleSource
                    var articleBig = rs.articleBig;
//                    html+='<li data-id="'+id+'">'+title+'</li>';
                    var article_href = path + "/toarticle/" + id;
                    if (articleBig > 0) {
                        html += '<div class="mod-b mod-art mod-b-push ">' +
                            '<a class="transition" href="' + article_href + '" target="_blank" title="' + title + '">' +
                            '<div class="mod-thumb ">' +
                            '<img class="lazy" style="max-width: 100%;max-height: 100%;" src="' + pic + '" alt="' + title + '" >' +
                            '</div></a>' +
                            '<div class="column-link-box column-link-big-box">' +
                            '<a href="#" class="column-link" target="_blank">' + articleSource + ' </a> ' +
                            '</div><div class="mob-ctt">' +
                            '<h2><a href="' + article_href + '" class="transition msubstr-row5" target="_blank">' + title + '</a></h2>' +
                            '<div class="mob-author"><div class="author-face">' +
                            '<a href="#" target="_blank"><img class="lazy" src="/resource/sy-img/59_1502432173.jpg"></a>' +
                            '</div><a href="#" target="_blank">' +
                            '<span class="author-name"> 1-1 </span>' +
                            '</a>' +
                            '</div>' +
                            '<div class="mob-author">' +
                            '<i class="icon icon-cmt" style="margin-left: 5px" title="点击量"></i><em title="点击量">' + hints + '</em>' +
                            '<i class="icon icon-fvr" style="margin-left: 5px" title="收藏量"></i><em title="收藏量">' + collection + '</em>' +
                            '<div class="article-type pull-right">' +
                            '<div class="icon-like-prompt" id="zanAdd"><i class="icon icon-like active"></i><span class="c1" id="upText">+1</span>' +
                            '</div>' +
                            '<div class="icon-no-like-prompt" style="margin-left: 27%;" id="zanDown"><i class="icon icon-no-like active"></i><span class="c1" id="downText">+1</span>' +
                            '</div>' +
                            '<ul>' +
                            '<li class="js-icon-like"  id="like"><i class="icon icon-like" id="up"></i>' +
                            '<span class="like" id="upNum">' + up + '</span></li>' +
                            '<li class="js-no-icon-like"  id="noLike"><i class="icon icon-no-like " id="down" ></i>' +
                            '<span class="like" id="downNum">' + down + '</span></li>' +
                            '</ul>' +
                            '</div></div>' +
                            '<div class="mob-sub" style="word-wrap:break-word;word-break:break-all;">' + summary + '</div>' +
                            '</div></div>'
                    }else {
                        html += '<div class="mod-info-flow">' +
                            '<div class="mod-b mod-art">' +
                            /*state*/
                            '<div class="mod-angle">' + state + '</div>' +
                            '<div class="mod-thumb "><a class="transition" title="' + title + '" href="' + article_href + '" target="_blank">' +
                            /*pic1*/
                            '<img class="lazy" style="max-width: 100%;max-height: 100%;" src="' + pic + '" alt="' + title + '">' +
                            '</a></div><div class="column-link-box">' +
                            /*tag1*/
                            '<a href="#" class="column-link" target="_blank">' + articleSource + '</a>' +
                            '</div>' +
                            '<div class="mob-ctt">' +
                            /*title*/
                            '<h2><a href="' + article_href + '" class="transition msubstr-row2" target="_blank">' + title + '</a></h2>' +
                            '<div class="mob-author"><div class="author-face">' +
                            /*user-avatar*/
                            '<a href="#" target="_blank"><img src="/resource/sy-img/59_1502432173.jpg"></a></div>' +
                            /*user-name*/
                            '<a href="#" target="_blank"><span class="author-name ">量子位</span></a>' +
                            /*comment-number*/
                            '<i class="icon icon-cmt" title="点击量"></i><em title="点击量">' + hints + '</em>' +
                            /*collection-number*/
                            '<i class="icon icon-fvr" title="收藏量"></i><em title="收藏量">' + collection + '</em>' +

                            //dian zan
                            '<div class="article-type pull-right">' +
                            '<div class="icon-like-prompt" id="zanAdd" ><i class="icon icon-like active"></i><span class="c1" id="upText" >+1</span></div>' +
                            '<div class="icon-no-like-prompt" style="margin-left: 14%" id="zanDown"><i class="icon icon-no-like active"></i><span class="c1" id="downText" >+1</span></div>' +
                            '<ul>' +
                            '<li class="js-icon-like"  id="like"><i class="icon icon-like" id="up"></i>' +
                            '<span class="like" id="upNum">' + up + '</span></li>' +
                            '<li class="js-no-icon-like"  id="noLike"><i class="icon icon-no-like " id="down" ></i>' +
                            '<span class="like" id="downNum">' + down + '</span></li>' +
                            '</ul>' +
                            '</div>' +
                            /*summary*/
                            '</div><div class="mob-sub" style="word-wrap:break-word;word-break:break-all;">' + summary + '</div>' +
                            '</div></div></div>'
                    }
                    if (i == 5) {
                        //adver
                        html += '<div class="mod-b mod-art promote">' +
                            '<a href="#" title="">' +
                            '<div class="mod-thumb">' +
                            '<img class="lazy" src="' + path + '/resource/sy-img/233950517521.jpg">' +
                            '</div>' +
                            '</a>' +
                            '<div class="mob-ctt">' +
                            '<a href="#" >实体商业转型</a>' +
                            '<span class="point">&bull;</span>' +
                            '<a href="#" >实体空间在召唤，他们押宝了零售业态转型升级</a>' +
                            '<span class="span-mark-pro">推广</span>' +
                            '</div>' +
                            '</div>'
                    }
                }
                //渲染数据
                list.append(html);
                //接口是否查询完毕
                if (data.total == data.currentPage || currentPage > data.total) {
                    //数据全部加载完毕
                    isLoad = false;
                    //
                    loadingBtn.html(nomore_Text);
                }
            }
            //换一波
            $(document).on("click", "#change", function () {
                zeroModal.loading(2);
                var curPage = 1,rows=20;
                //发送ajax
                $.ajax({
                    //url
                    url: "${path}/changeReco",
                    //请求方式
                    type: 'POST',
                    //参数
                    data: {currentPage: curPage, rows: rows},
                    //成功回调
                    success: function (data) {
                        zeroModal.closeAll()
                        if (data.total == 0) {
                            alert("无推荐")
                        } else
                            setHuanYiPi(data);
                    },
                    //失败回调
                    error: function (e, e2, e3) {
                        alert("请求失败")
                    }
                });
            });

            /*
             判断是否要加载接口
             */
            /* function isScrollLoad(){
             //加载更多距离
             var btn_top = loadingBtn.offset().top;
             //窗体高度
             var window_height = $(window).height();
             //滚动距离
             var scroll_Top = $(window).scrollTop();
             //加载更多高度
             var loading_height = loadingBtn.height();
             //是否需要加载(底部距离是否小于窗口高度+滚动的距离)
             return btn_top < scroll_Top + window_height - (loading_height - 5) ? true : false;
             }*/
            /*
             滚动事件监听
             */
            /*   $(window).scroll(function(){
             //是否滚动到底部
             var _needload = isScrollLoad();
             //
             if(_needload && isLoad){
             //加载数据
             loadData();
             }
             });*/


            /*
             点击加载更多
             */
            loadingBtn.click(function () {
                <c:if test="${sessionScope.user == null}">
                //是否加载游客数据
                if (isLoad)
                    loadData();
                </c:if>
                <c:if test="${sessionScope.user != null}">
                if (isLoad)
                    loadRecoData();
                </c:if>

            });
        });
    </script>

</head>

<body>

<%@include file="header.jsp" %>

<div class="placeholder-height"></div>
<div class="container" id="index">
    <div class="wrap-left pull-left">
        <div style="width: 100%;height: 5%"><button style="float: right" class="myButton" id="change">换一批</button></div>
        <!--动态加载 -->
        <div class="mod-info-flow" style="width: 100%;">
            <ul id="list"></ul>
            <div class="get-mod-more js-get-mod-more-list transition" id="loading" style="cursor: pointer;">
                点击加载更多
            </div>
        </div>
    </div>


    <div class="wrap-right pull-right">
        <div class="right-ad-box"></div>
        <div class="box-moder moder-project-list promote-box">
            <h3>新鲜事</h3>
            <span class="span-mark"></span>
            <ul>
                <li>
                    <div class="mod-thumb">
                        <a href="#" target="_blank">
                            <img src="${path}/resource/sy-img/233950517521.jpg">
                        </a>
                    </div>
                    <div class="project-content">
                        <a href="#" class="c2" target="_blank">实体商业转型</a>
                        <span class="point">&bull;</span>
                        <a href="#" target="_blank">实体空间在召唤，他们押宝了零售业态转型升级</a>
                    </div>
                    <span style="float: right;margin-top: 2px;color: #f63756">1小时前</span>
                </li>
                <li>
                    <div class="mod-thumb">
                        <a href="#" target="_blank">
                            <img src="${path}/resource/images/ad1.jpg">
                        </a>
                    </div>
                    <div class="project-content">
                        <a href="#" class="c2" target="_blank">智易科技
                        </a>
                        <span class="point">&bull;</span>
                        <a href="#" target="_blank">一站式的AI研发与应用云服务平台</a>
                    </div>
                    <span style="float: right;margin-top: 2px;color: #f63756">3小时前</span>

                </li>
                <li>
                    <div class="mod-thumb">
                        <a href="#" target="_blank">
                            <img src="${path}/resource/images/ad2.jpg">
                        </a>
                    </div>
                    <div class="project-content">
                        <a href="#" class="c2" target="_blank">考拉优教
                        </a>
                        <span class="point">&bull;</span>
                        <a href="#" target="_blank">儿童素质教育严选平台</a>
                    </div>
                    <span style="float: right;margin-top: 2px;color: #f63756">1小时前</span>

                </li>
            </ul>
        </div>
        <div id="moment"></div>
        <div class="box-moder hot-article">
            <h3>实时热文</h3>
            <span class="pull-right project-more story-more">
            <a href="#" class="transition" target="_blank">查看全部</a></span>
            <span class="span-mark"></span>
            <ul id="reWen">

            </ul>
        </div>
        <div class="placeholder"></div>
        <!--24小时部分结束1-->
        <div class="ad-wrap">
            <div class="ad-title">广告</div>
        </div>
        <div class="placeholder"></div>

    </div>
</div>
<%@include file="footer.jsp" %>

<script type="text/javascript" src="${path}/resource/js/mouse.js"></script>
<!--<script language="javascript" type="text/javascript" src="${path}/resource/js/main.js"></script>
<script language="javascript" type="text/javascript" src="${path}/resource/js/popwin.js"></script>-->
</body>

</html>