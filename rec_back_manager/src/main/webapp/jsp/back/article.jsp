<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<!DOCTYPE html>
<html>
<head>
    <title>NewsPro-后台管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="${path}/static/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/select2.min.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="${path}/static/css/style.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/css/themes/flat-blue.css">
    <style type="text/css">
        tr td{
            vertical-align: middle;
        }
        tr th{
            vertical-align: middle;
        }
    </style>
</head>

<body class="flat-blue">
<div class="app-container">
    <div class="row content-container">
        <nav class="navbar navbar-default navbar-fixed-top navbar-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-expand-toggle">
                        <i class="fa fa-bars icon"></i>
                    </button>
                    <ol class="breadcrumb navbar-breadcrumb">
                        <li>知识管理</li>
                        <li class="active">知识审核</li>
                    </ol>
                    <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                        <i class="fa fa-th icon"></i>
                    </button>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                        <i class="fa fa-times icon"></i>
                    </button>
                    <li class="dropdown danger">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-expanded="false"><i class="fa fa-star-half-o"></i> 2</a>
                        <ul class="dropdown-menu danger  animated fadeInDown">
                            <li class="title">
                                消息提醒 <span class="badge pull-right">2</span>
                            </li>
                            <li>
                                <ul class="list-group notifications">
                                    <a href="#">
                                        <li class="list-group-item">
                                            <span class="badge">1</span> <i class="fa fa-exclamation-circle icon"></i>
                                            请尽快完成手头任务...
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li class="list-group-item">
                                            <span class="badge success">1</span> <i class="fa fa-check icon"></i> 新的订单待完成
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li class="list-group-item message">
                                            view all
                                        </li>
                                    </a>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown profile">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                            ${sessionScope.user} <span class="caret"></span></a>
                        <ul class="dropdown-menu animated fadeInDown">
                            <li>
                                <div class="profile-info">
                                    <h4 class="username">${sessionScope.user}</h4>
                                    <p>15558680172</p>
                                    <div class="btn-group margin-bottom-2x" role="group">
                                        <button type="button" class="btn btn-default"><i class="fa fa-user"></i> 个人信息
                                        </button>
                                        <button type="button" class="btn btn-default"><i class="fa fa-sign-out"></i>
                                            <a href="${path}/logout">退出</a>
                                        </button>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li >
                        <a href="http://127.0.0.1:8110/m"  role="button"
                           aria-expanded="false">WAP端入口</a>
                    </li>
                    <li >
                        <a href="http://127.0.0.1:8111/f"  role="button"
                           aria-expanded="false">官网入口</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="side-menu sidebar-inverse" style="overflow: scroll;overflow-y: hidden;">
            <nav class="navbar navbar-default" role="navigation">
                <div class="side-menu-container">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">
                            <div class="icon glyphicon glyphicon-fire"></div>
                            <div class="title">后台管理</div>
                        </a>
                        <button type="button" class="navbar-expand-toggle pull-right visible-xs">
                            <i class="fa fa-times icon"></i>
                        </button>
                    </div>
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="${path}/b">
                                <span class="icon fa fa-tachometer"></span><span class="title">首页</span>
                            </a>
                        </li>
                        <shiro:hasAnyRoles name="文章管理员,系统管理员">
                            <li class="panel panel-default dropdown active">
                                <a data-toggle="collapse" href="#dropdown-element">
                                    <span class="icon glyphicon glyphicon-list-alt"></span><span class="title">知识管理</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-element" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="${path}/article/1/10" style="text-align: center">知识审核(提交状态)</a>
                                            </li>
                                            <li><a href="${path}/SaveA/1/10" style="text-align: center">知识管理(保存状态)</a>
                                            </li>
                                            <li><a href="${path}/articleKind" style="text-align: center">类型管理</a>
                                            </li>
                                            <li><a href="${path}/articleComments" style="text-align: center">评论管理</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </shiro:hasAnyRoles>
                        <shiro:hasAnyRoles name="媒体管理员,系统管理员">
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-table">
                                    <span class="icon fa fa-table"></span><span class="title">媒体管理</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-table" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="${path}/adver" style="text-align: center">广告管理</a>
                                            </li>
                                            <li><a href="${path}/addAdver" style="text-align: center">新增广告</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </shiro:hasAnyRoles>
                        <shiro:hasAnyRoles name="用户管理员,系统管理员">
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-form">
                                    <span class="icon glyphicon glyphicon-user"></span><span class="title">用户管理</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-form" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="${path}/vip/1/10" style="text-align: center">会员管理</a>
                                            </li>
                                            <li><a href="${path}/user/1/10" style="text-align: center">普通用户管理</a>
                                            </li>
                                            <li><a href="${path}/manager/1/10" style="text-align: center">管理员管理</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </shiro:hasAnyRoles>
                        <shiro:hasAnyRoles name="权限管理员,系统管理员">
                            <!-- Dropdown-->
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#component-example">
                                    <span class="icon fa fa-cubes"></span><span class="title">权限管理</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="component-example" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="${path}/role" style="text-align: center">角色管理</a>
                                            </li>
                                            <li><a href="${path}/permission" style="text-align: center">权限分配</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </shiro:hasAnyRoles>
                        <!-- Dropdown-->
                        <li>
                            <a href="${path}/chart">
                                <span class="icon fa fa-slack"></span><span class="title">网站流量</span>
                            </a>
                        </li>
                        <!-- Dropdown-->
                        <li>
                            <a href="${path}/mesboard">
                                <span class="icon fa fa-archive"></span><span class="title">留言板</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>
        </div>
        <!-- Main Content -->
        <div class="container-fluid">
            <div class="side-body">
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-title">
                                    <div class="title">知识管理(提交状态)</div>
                                    <hr>
                                    <i style="font-size: 16px">审核状态：</i>
                                    <button type="button" class="btn btn-default"><a href="${path}/state/0/1/10">未审核</a>
                                    </button>
                                    <button type="button" class="btn btn-success"
                                            style="background-color: #99e9d9;color: black;border-color: transparent"><a
                                            href="${path}/state/1/1/10">审核通过</a>
                                    </button>
                                    <button type="button" class="btn btn-danger"
                                            style="background-color: #ffb8aa;color: black;border-color: transparent"><a
                                            href="${path}/state/2/1/10">审核失败</a>
                                    </button>
                                    <button type="button" class="btn " style="background-color: #ffe5a2;color: black">
                                        <a href="${path}/state/3/1/10">举报异常</a>
                                    </button>
                                    <hr>
                                    <i style="font-size: 16px">总共有：<em
                                            style="color: red;font-size: 20px">${pga.gettotal() * 10}</em> 条信息</i>
                                </div>
                            </div>
                            <div class="card-body">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>用户</th>
                                        <th>知识封面</th>
                                        <th>知识详情</th>
                                        <th>知识附件</th>
                                        <th>来源</th>
                                        <th>子类型</th>
                                        <th>点击量</th>
                                        <th>收藏量</th>
                                        <th>赞</th>
                                        <th>踩</th>
                                        <th>是否大图</th>
                                        <th>审核状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${pga.amounts}" var="ar">
                                        <c:if test="${ar.checkUp == 0}">
                                            <tr class="active">
                                        </c:if>
                                        <c:if test="${ar.checkUp == 1}">
                                            <tr class="success">
                                        </c:if>
                                        <c:if test="${ar.checkUp == 2}">
                                            <tr class="danger">
                                        </c:if>
                                        <c:if test="${ar.checkUp == 3}">
                                            <tr class="warning">
                                        </c:if>
                                        <th scope="row" style="vertical-align: middle;">${ar.articleId}</th>
                                        <td style="vertical-align: middle;">${ar.userId}</td>
                                        <td style="vertical-align: middle;">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-default btn-sm dropdown-toggle"
                                                        style="margin: 0 auto;background-color: #c2c2c2;border-radius: 6px"
                                                        data-toggle="dropdown">查看封面 <span
                                                        class="caret"></span></button>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#" data-toggle="modal"
                                                           data-target="#fengmian">查看封面一</a></li>
                                                </ul>
                                            </div>
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-default btn-sm dropdown-toggle"
                                                        style="margin: 0 auto;background-color: #c2c2c2;border-radius: 6px"
                                                        data-toggle="modal" data-target="#quanWen">浏览全文
                                                </button>
                                            </div>
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-default btn-sm dropdown-toggle"
                                                        style="margin: 0 auto;background-color: #c2c2c2;border-radius: 6px"
                                                        data-toggle="modal" data-target="#quanWen">浏览附件
                                                </button>
                                            </div>
                                        </td>
                                        <td style="vertical-align: middle;">${ar.articleSource}</td>
                                        <td style="vertical-align: middle;">--</td>
                                        <td style="vertical-align: middle;">${ar.articleHints}</td>
                                        <td style="vertical-align: middle;">${ar.articleCollection}</td>
                                        <td style="vertical-align: middle;">${ar.articleUp}</td>
                                        <td style="vertical-align: middle;">${ar.articleDown}</td>
                                        <c:if test="${ar.articleBig == 0}">
                                            <td style="vertical-align: middle;">否</td>
                                        </c:if>
                                        <c:if test="${ar.articleBig == 1}">
                                            <td style="vertical-align: middle;">是</td>
                                        </c:if>
                                        <c:if test="${ar.checkUp == 0}">
                                            <td style="vertical-align: middle;">未审核</td>
                                        </c:if>
                                        <c:if test="${ar.checkUp == 1}">
                                            <td style="vertical-align: middle;">审核通过</td>
                                        </c:if>
                                        <c:if test="${ar.checkUp == 2}">
                                            <td style="vertical-align: middle;">审核失败</td>
                                        </c:if>
                                        <c:if test="${ar.checkUp == 2}">
                                            <td style="vertical-align: middle;">存在异常</td>
                                        </c:if>
                                        <!--未审核-->
                                        <c:if test="${ar.checkUp == 0}">
                                            <td style="vertical-align: middle;">
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary dropdown-toggle"
                                                            data-toggle="dropdown"
                                                            style="margin: 0 auto;border-radius: 6px">
                                                        操作 <span
                                                            class="caret"></span></button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="${path}/addIndex/${ar.articleId}">建立搜索索引</a></li>
                                                        <li><a onclick="minGanCiTest(this)" href="#">敏感词审核</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="#" style="color: red">审核不予通过</a></li>
                                                    </ul>
                                                </div>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-danger" data-toggle="dropdown"
                                                            style="margin: 0 auto;border-radius: 6px">审核通过
                                                    </button>
                                                </div>
                                            </td>
                                        </c:if>
                                        <!--审核通过-->
                                        <c:if test="${ar.checkUp == 1}">
                                            <td style="vertical-align: middle;">
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary dropdown-toggle"
                                                            data-toggle="dropdown"
                                                            style="margin: 0 auto;border-radius: 6px">
                                                        操作 <span
                                                            class="caret"></span></button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="${path}/addIndex/${ar.articleId}">建立搜索索引</a></li>
                                                        <c:if test="${ar.articleBig == 0}">
                                                            <li><a href="${path}/setBig/${ar.articleId}">设为大图</a>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${ar.articleBig == 1}">
                                                            <li><a href="${path}/setBig/${ar.articleId}">设为正常</a>
                                                            </li>

                                                        </c:if>

                                                        <li><a href="#" style="color: red">强制下线</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </c:if>
                                        <!--审核失败-->
                                        <c:if test="${ar.checkUp == 2}">
                                            <td style="vertical-align: middle;">
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary dropdown-toggle"
                                                            data-toggle="dropdown"
                                                            style="margin: 0 auto;border-radius: 6px">
                                                        操作 <span
                                                            class="caret"></span></button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a id="minGanCi" onclick="minGanCiTest(this)"
                                                               href="#">敏感词审核</a></li>
                                                        <li class="divider"></li>
                                                        <li><a href="#" style="color: red">重新上线</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </c:if>
                                        <!--举报异常-->
                                        <c:if test="${ar.checkUp == 3}">
                                            <td style="vertical-align: middle;">
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary dropdown-toggle"
                                                            data-toggle="dropdown"
                                                            style="margin: 0 auto;border-radius: 6px">
                                                        操作 <span
                                                            class="caret"></span></button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#" data-toggle="modal" data-target="#juBaoMes">查看举报信息</a>
                                                        </li>
                                                        <li class="divider"></li>
                                                        <li><a href="#" style="color: red">文章下线</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </c:if>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div>
                                    <nav>
                                        <ul class="pagination pagination-lg" style="margin-left: 40%;margin-top: 5%">
                                            <li>
                                                <a href="${path}/article/1/10" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <c:if test="${pga.currentPage == 1}">
                                                <li class="active"><a href="${path}/article/1/10">1</a></li>
                                            </c:if>
                                            <c:if test="${pga.currentPage != 1}">
                                                <li><a href="${path}/article/1/10">1</a></li>
                                            </c:if>
                                            <c:if test="${pga.gettotal() > 1}">
                                                <c:if test="${pga.currentPage == 2}">
                                                    <li class="active"><a href="${path}/article/2/10">2</a></li>
                                                </c:if>
                                                <c:if test="${pga.currentPage != 2}">
                                                    <li><a href="${path}/article/2/10">2</a></li>
                                                </c:if>
                                                <c:if test="${pga.currentPage == 3}">
                                                    <li class="active"><a href="${path}/article/3/10">3</a></li>
                                                </c:if>
                                                <c:if test="${pga.currentPage != 3}">
                                                    <li><a href="${path}/article/3/10">3</a></li>
                                                </c:if>
                                                <c:if test="${pga.currentPage == 4}">
                                                    <li class="active"><a href="${path}/article/4/10">4</a></li>
                                                </c:if>
                                                <c:if test="${pga.currentPage != 4}">
                                                    <li><a href="${path}/article/4/10">4</a></li>
                                                </c:if>
                                                <c:if test="${pga.currentPage == 5}">
                                                    <li class="active"><a href="${path}/article/5/10">5</a></li>
                                                </c:if>
                                                <c:if test="${pga.currentPage != 5}">
                                                    <li><a href="${path}/article/5/10">5</a></li>
                                                </c:if>
                                                <li><a href="#">..</a></li>
                                            </c:if>
                                            <li>
                                                <a href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 封面Modal -->
<div class="modal fade" id="fengmian" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">封面一</h4>
            </div>
            <div class="modal-body">
                <img style="width: 100%"
                     src="http://hta.hengtiansoft.com/image/group1/M00/24/87/fwAAAVqXuSuAUeLWAATdLNGoNG0069.png">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!--全文-->
<div class="modal fade" id="quanWen" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel2"></h4>
            </div>
            <div class="modal-body">
                <div style="width: 100%"><h4 class="modal-title">一加手机布局北欧市场，与瑞典运营商Telia达成战略合作</h4></div>
                <hr>
                <div style="width: 100%"><p
                        style="color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;">
                    <div class="article-img-box"
                         style="text-align:center;color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:14px;background-color:#FFFFFF;">
                        <img src="https://img.huxiucdn.com/article/cover/201803/12/103943272635.jpg?imageView2/1/w/800/h/600/|imageMogr2/strip/interlace/1/quality/85/format/jpg"
                             alt="极米科技获超 6 亿元融资，联手百度能卖得动“投影仪”吗？" style="width:100%;"/></div>
                    <div id="article_content235394" class="article-content-wrap"
                         style="font-size:16px;text-align:justify;color:#303030;font-family:Arial, 微软雅黑, &quot;background-color:#FFFFFF;">
                        <p> 3&nbsp;月 12&nbsp;日上午，智能投影仪厂商极米科技宣布获超 6
                            亿元融资，百度、经纬中国、四川文投、赛领资本、博将资本、磐霖资本、鲁信创投、基锐资本等投资机构联合投资。 </p>
                        <p><br/></p>
                        <p> 极米科技成立于 2013 年 11 月，主打产品为“无屏电视”，通过几年的耕耘做到了细分市场头名的位置。极米科技创始人、CEO&nbsp;钟波非常固执地坚持“未来电视一定属于无屏”，除了无屏电视以外，这家硬件创业公司就再没推出过其他产品。 </p>
                        <p><br/></p>
                        <p>
                            无屏电视的优点显而易见，无需液晶屏幕，决定了它的成本可以压缩到非常低，同时便于保存和携带。也因此，这个新兴的品类，催生了极米、火乐神画、智歌、一数科技等初创公司，也吸引了海信、长虹等家电厂商，小米、暴风等互联网公司入场，欲从市场中抢一杯羹。 </p>
                        <p><br/></p>
                        <p>
                            目前的无屏电视依然是小众玩物。去年，暴风发布无屏电视时，我们曾提到，当下投影仪式无屏电视的技术已经相当成熟，但使用场景依然非常受到限制，暂时还不能取代传统电视，当务之急就是要解决亮度、距离等问题。 </p>
                        <p><br/></p>
                        <p> 极米算是目前跑的比较快的，至今已经拿到四轮融资。值得注意的是，在本轮增资后，百度成为了除创始团队外最大股东。 </p>
                        <p><br/></p>
                        <p> 百度与极米的合作关系开始于 2017 年 7 月，极米发布三款搭载了百度 DuerOS 人工智能操作系统的激光无屏电视。同年 11
                            月，成都极米科技宣布完成百度风投(BV)领投的C轮融资。 </p>
                        <p><br/></p>
                        <p> 双方合作的逻辑也非常清晰了，极米负责硬件，百度负责软件，加强目前流行的人工智能电视上的布局。 </p>
                        <p><br/></p>
                        <p> 上周（3&nbsp;月 6&nbsp;日），百度完成了结构调整，在内部宣布正式成立“智能生活事业群组”，百度集团总裁兼首席运营官陆奇兼任总经理。百度的策略就是双管齐下，既要有自研的产品，也要继续壮大
                            DuerOS&nbsp;平台的建设。&nbsp; </p>
                        <p><br/></p>
                        <p> 未来电视的目标定位是家庭娱乐的中心，以及连接整套智能家居系统的入口，重要性不言而喻，这也是百度 DuerOS 最好的落地机会之一。根据百度公布的数据，截至 2018 年 1 月，搭载
                            DuerOS 的智能设备激活数量已突破 5000 万，月活跃设备超过 1000 万。DuerOS 已新增 130 余家合作伙伴、落地硬件解决方案超过 20 个、每月新增 5 款以上搭载
                            DuerOS 的设备。 </p>
                        <p><br/></p>
                        <p> 但实际上，目前消费者每天都在接触的消费电子产品中，DuerOS&nbsp;的存在感并不强，它更多的存在于车载及某些更小众的智能产品中。而手机、电视这些设备的厂商，几乎都会选择搭载自家的操作系统及助手，DuerOS&nbsp;在容身之地越来越小的情况下，选择把宝押在未来，因此无屏电视成了最好的选择。 </p>
                        <p><br/></p>
                        <p> 随着技术的升级、成本逐渐降低，以及人工智能等概念的落地，本来显得“老气横秋”的电视逐渐焕发出了新的生命力，正努力夺回客厅娱乐主力的位置。慧聪网的数据显示，2018
                            年彩电市场将回暖，规模预计增长 3.1%，达到 4898 万台。与此同时，奥维云网发布的数据显示，2017 年激光电视市场规模销量 6.7 万台，销额&nbsp; 20.8
                            亿元，增长率分别达 116％，109％。 </p>
                        <p><br/></p>
                        <p> 极米有了百度的支持，能继续砸钱做研发，完善产品；而百度也能提前完成布局，“拉拢”更多的厂商加入到 Dueros&nbsp;的大平台中，继续抢占市场份额。看起来似乎很美好，不过最终还是看实际的产品表现说话，毕竟传统家电厂商，以及小米、暴风等竞争对手也不是吃素的。 </p>
                        <p><br/></p>
                        <p> 未来无屏电视的可用性肯定会越来越好，就差一套大房子了。 </p></div>
                    </p>
                    <p style="color:#303030;font-family:Arial, 微软雅黑, &quot;font-size:16px;text-align:justify;background-color:#FFFFFF;">
                        <br/></p>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!--举报信息-->
<div class="modal fade" id="juBaoMes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel3">举报信息</h3>
            </div>
            <div class="modal-body">
                <h4 class="modal-title">这篇文章错别字太多，请网站管理员将其下架。</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!--敏感词-->
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true" id="pop-result"
     style="display:none;">
    <div class="modal-dialog" style="width: 759px;height: 445px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    &times;
                </button>
                <h4 class="modal-title" id="resultTitle">
                    检测结果
                </h4>
            </div>
            <div class="modal-body" id="resultIntro">
                <h4 class="modal-title" id="myModalLabel4"></h4>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div>
    </div>
</div>
<!-- Javascript Libs -->
<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">
    function minGanCiTest(elementId) {
        var buttonId = $(elementId).parent().parent().parent().parent().parent().find("th:eq(0)").text(),
            url = "${path}/wordTest/" + buttonId;
        $.ajax({
            url: url,
            //请求方式
            type: 'GET',
            //成功回调
            success: function (data) {
                var html = "";
                html += '<h2>检测到的敏感词数量:  ' + data.wordSize + '</h2><br>' +
                    '<h3>检测到的敏感词如下：  <p style="color: red">' + data.words + '</p></h3><br>' +
                    '<h3>检测用时：  ' + data.excuteTime + '</h3><br>' +
                    '<h3>敏感词占比： ' + data.passProb + '</h3><br>';
                $("#resultIntro").append(html);
                $("#pop-result").modal('show');
            },
            //失败回调
            error: function (e, e2, e3) {
                alert('请求失败，原因：' + e3);
            }
        });
    }

    $(function () {
        $('#pop-result').on('hidden.bs.modal',
            function () {
                $("#resultIntro").empty();
            });


    })

</script>
<script type="text/javascript" src="${path}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path}/static/js/Chart.min.js"></script>
<script type="text/javascript" src="${path}/static/js/bootstrap-switch.min.js"></script>

<script type="text/javascript" src="${path}/static/js/jquery.matchHeight-min.js"></script>
<script type="text/javascript" src="${path}/static/js/select2.full.min.js"></script>
<!--<script type="text/javascript" src="${path}/static/js/ace/ace.js"></script>-->
<!--<script type="text/javascript" src="${path}/static/js/ace/mode-html.js"></script>-->
<!--<script type="text/javascript" src="${path}/static/js/ace/theme-github.js"></script>-->
<!-- Javascript -->
<script type="text/javascript" src="${path}/static/js/app.js"></script>
</body>

</html>
