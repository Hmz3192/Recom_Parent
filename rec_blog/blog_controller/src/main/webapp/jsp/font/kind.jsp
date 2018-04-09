<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>筛选页-NewsPro</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/build.css">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/cy.css">
    <link rel="stylesheet" type="text/css" href="${path}/resource/model/zeroModal.css"/>

</head>
<body>
<jsp:include page="header.jsp"/>
<div class="placeholder-height" style="height: 10%"></div>
<div class="container cy_center_search" id="cy_center">
    <div class="cy-wrap">
        <div class="cy-search"><i class="icon icon-cy-search js-icon-cy-search"></i></div>
        <span class="span-mark-author active">全部项目</span>
        <div class="sl-v-list">
            <div class="sl-key">
                一级
            </div>
            <ul class="js-search-li" data-type="tag" id="first">
                <li class="active" dataid="0">全部</li>
                <li data-id="1"><a href="javascript:">电影新闻</a></li>
                <li data-id="2"><a href="javascript:">热点新闻</a></li>
            </ul>
        </div>
        <div class="sl-v-list">
            <div class="sl-key">
                二级
            </div>
            <ul class="js-search-li" data-type="city" id="second">
                <li class="active">全部</li>
                <li data-id="1"><a href="javascript:">影片介绍</a></li>
                <li data-id="2"><a href="javascript:">影片观后感</a></li>
                <li data-id="3"><a href="javascript:">影片推荐</a></li>
                <li data-id="4"><a href="javascript:">热点新闻</a></li>
                <li data-id="5"><a href="javascript:">国内新闻</a></li>
                <li data-id="6"><a href="javascript:">国外新闻</a></li>
            </ul>
        </div>
        <div class="sl-v-list">
            <div class="sl-key">
                三级
            </div>
            <ul class="js-search-li" data-type="city" id="third">
                <li class="active">全部</li>
                <li data-name="社会"><a href="javascript:">社会</a></li>
                <li data-name="国际"><a href="javascript:">国际</a></li>
                <li data-name="影视"><a href="javascript:">影视</a></li>
                <li data-name="司法"><a href="javascript:">司法</a></li>
            </ul>
        </div>
    </div>
    <div class="placeholder-height" style="height: 8%"></div>

    <div class="mod-info-flow" style="width:100%;">
        <div id="list"></div>
        <div class="get-mod-more transition js-get-chuangye-more-list" id="loadingBtn">
            点击加载更多
        </div>
    </div>

</div>
<jsp:include page="footer.jsp"/>
<script type="text/javascript" src="${path}/resource/js/jquery.js"></script>
<script src="${path}/resource/model/zeroModal.min.js"></script>

<script type="text/javascript">
    $('#first').on("click", "li", function () {
        var dataId = $(this).attr("data-id");
        $(this).parent().children("li").removeClass("active")
        $(this).addClass("active")
    })
    $('#second').on("click", "li", function () {
        var dataId = $(this).attr("data-id");
        $(this).parent().children("li").removeClass("active")
        $(this).addClass("active")
    });


    $('#third').on("click", "li", function () {
        var kind = $(this).attr("data-name");
        $(this).parent().children("li").removeClass("active")
        $(this).addClass("active")
        $("#list").empty();
        var currentpage = 1, rows = 5;
        var html = ""
        var list = $("#list");
        var isLoad = true;

        loadData(kind, currentpage, rows);


        function loadData(kind, currentpage, rows) {
            zeroModal.loading(2)
            //发送ajax
            $.ajax({
                //url
                url: "${path}/sk",
                //请求方式
                type: 'POST',
                //参数
                data: {kind: kind, currentPage: currentpage, rows: rows},
                //成功回调
                success: function (data) {
                    zeroModal.closeAll()
                    setHtml(data);
                },
                //失败回调
                error: function (e, e2, e3) {
                    alert('请求失败，原因：' + e3);
                }
            });
        }


        function setHtml(data) {
            //当前页自增
            currentpage++;
            var html = '', result = data.amounts, len = result.length, i = 0;
            var path = '${path}';
            for (; i < len; i++) {
                var rs = result[i],
                    id = rs.articleId;
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
                html += '<div class="mod-b mod-art" style="width: 100%"><div class="mod-thumb ">' +
                    '<a class="transition" title="' + title + '" href="' + article_href + '" target="_blank">' +
                    '<img class="lazy" src=" ' + pic + '" alt="' + title + '">' +
                    '</a></div>' +
                    ' <div class="column-link-box">' +
                    '<a href="' + article_href + '" class="column-link" target="_blank">' + articleSource + '</a>' +
                    '</div>' +
                    '<div class="mob-ctt" style=" margin-left: 25%;width: 77%;">' +
                    '<h2><a href="' + article_href + '" class="transition msubstr-row2" target="_blank">' + title + '</a>' +
                    ' </h2>' +
                    ' <div class="mob-author">' +
                    '  <div class="author-face">' +
                    ' <a href="' + article_href + '" target="_blank"><img src="' + pic + '"></a>' +
                    ' </div>' +
                    ' <span class="author-name "> 1-1 </span>' +
                    '  </a>' +
                    '<i class="icon icon-cmt" style="margin-left: 5px" title="点击量"></i><em title="点击量">' + hints + '</em>' +
                    '<i class="icon icon-fvr" style="margin-left: 5px" title="收藏量"></i><em title="收藏量">' + collection + '</em>' +
                    '<ul>' +
                    '<li class="js-icon-like"  id="like"><i class="icon icon-like" id="up"></i>' +
                    '<span class="like" id="upNum">' + up + '</span></li>' +
                    '<li class="js-no-icon-like"  id="noLike"><i class="icon icon-no-like " id="down" ></i>' +
                    '<span class="like" id="downNum">' + down + '</span></li>' +
                    '</ul></div></div><div class="mob-sub">' + summary + '</div>' +
                    '  </div></div>'
            }
            //渲染数据
            $("#list").append(html);

            //接口是否查询完毕
            if (data.total == data.currentpage || currentpage > data.total) {
                //数据全部加载完毕
                isLoad = false;
                //
                $('#loadingBtn').html("暂无更多数据");
            }
        }


        /*
         点击加载更多
         */
        $('#loadingBtn').click(function () {
            if (isLoad)
                loadData(kind, currentpage, rows);
        });

    })

</script>
</body>
</html>
