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
</head>

<body class="flat-blue" style="height: auto">
<div class="app-container">
    <div class="row content-container">
        <!--titleBar-->
        <nav class="navbar navbar-default navbar-fixed-top navbar-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-expand-toggle">
                        <i class="fa fa-bars icon"></i>
                    </button>
                    <ol class="breadcrumb navbar-breadcrumb">
                        <li class="active">首页</li>
                    </ol>
                    <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                        <i class="fa fa-th icon"></i>
                    </button>
                </div>
                <ul class="nav navbar-nav navbar-right" >
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
        <!--sideBar-->
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
                        <li class="active">
                            <a href="${path}/b">
                                <span class="icon fa fa-tachometer"></span><span class="title">首页</span>
                            </a>
                        </li>
                        <shiro:hasAnyRoles name="文章管理员,系统管理员">
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-element">
                                    <span class="icon glyphicon glyphicon-list-alt"></span><span class="title">课程管理</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-element" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="${path}/article/1/10" style="text-align: center">课程审核(提交状态)</a>
                                            </li>
                                            <li><a href="${path}/SaveA/1/10" style="text-align: center">课程管理(保存状态)</a>
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
            <div class="side-body padding-top">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <a href="#">
                            <div class="card red summary-inline">
                                <div class="card-body">
                                    <i class="icon fa fa-inbox fa-4x"></i>
                                    <div class="content">
                                        <div class="title">50</div>
                                        <div class="sub-title">APP下载量</div>
                                    </div>
                                    <div class="clear-both"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <a href="#">
                            <div class="card yellow summary-inline">
                                <div class="card-body">
                                    <i class="icon fa fa-comments fa-4x"></i>
                                    <div class="content">
                                        <div class="title">23</div>
                                        <div class="sub-title">评论量</div>
                                    </div>
                                    <div class="clear-both"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <a href="#">
                            <div class="card green summary-inline">
                                <div class="card-body">
                                    <i class="icon fa fa-tags fa-4x"></i>
                                    <div class="content">
                                        <div class="title">280</div>
                                        <div class="sub-title">用户量</div>
                                    </div>
                                    <div class="clear-both"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <a href="#">
                            <div class="card blue summary-inline">
                                <div class="card-body">
                                    <i class="icon fa fa-share-alt fa-4x"></i>
                                    <div class="content">
                                        <div class="title">16</div>
                                        <div class="sub-title">分享量</div>
                                    </div>
                                    <div class="clear-both"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="card-body">
                        <div class="col-xs-12">
                            <div class="sub-title" style="font-size: 18px;">客户意见板</div>
                            <hr>
                            <div>
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        <span class="badge">14</span> 哇哦，我觉得这个真的超级方便啊!
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge">1</span> 同意楼上，我也是这样感觉的，超级棒的APP!
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge">2</span> 都是我喜欢的资讯商家，超级赞！！！
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge">2</span> 强烈推荐，哇，真是科技改变生活啊！
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge">2</span> 非常棒，期望可以带来更好的作品！
                                    </li>
                                    <li class="list-group-item">
                                        <span class="badge">2</span> APP新闻推荐的真棒！
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<footer class="app-footer" style="margin-left: 60%;">
</footer>
<!-- Javascript Libs -->
<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>

<script type="text/javascript" src="${path}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path}/static/js/Chart.min.js"></script>
<script type="text/javascript" src="${path}/static/js/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="${path}/static/js/jquery.matchHeight-min.js"></script>
<script type="text/javascript" src="${path}/static/js/select2.full.min.js"></script>
<script type="text/javascript" src="${path}/static/js/ace/ace.js"></script>
<script type="text/javascript" src="${path}/static/js/ace/mode-html.js"></script>
<script type="text/javascript" src="${path}/static/js/ace/theme-github.js"></script>
<!-- Javascript -->
<script type="text/javascript" src="${path}/static/js/app.js"></script>

<script type="text/javascript">
    window.onload = function(){
        $(".app-footer").hide()
        Toast();
    }

    function Toast() {
        var html = '<div><div class="alert alert-success alert-dismissible fade in" role="alert">' +
        '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
        '<span aria-hidden="true">×</span></button>' +
        '<h4 id="oh-snap!-you-got-an-error!">系统提醒' +
        '<a class="anchorjs-link" href="#oh-snap!-you-got-an-error!">' +
        '<span class="anchorjs-icon"></span></a></h4>' +
        '<p>发现新的未完成任务.</p>' +
        '</div></div>'
        $(".app-footer").append(html);
        $(".app-footer").fadeIn("slow");
        $('.app-footer').delay(3000).fadeOut("slow",Toast2());
    }

    function Toast2() {
        var html = '<div><div class="alert alert-warning alert-dismissible fade in" role="alert">' +
            '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
            '<span aria-hidden="true">×</span></button>' +
            '<h4 id="oh-snap!-you-got-an-error!">系统提醒' +
            '<a class="anchorjs-link" href="#oh-snap!-you-got-an-error!">' +
            '<span class="anchorjs-icon"></span></a></h4>' +
            '<p>请尽快完成手头任务，保证网站的正常运营，今日下午正常开例会.</p>' +
            '<p><button type="button" class="btn btn-danger">收到</button>' +
            '</p></div></div>'
        $(".app-footer").append(html);
        $(".app-footer").fadeIn("slow");
        $('.app-footer').delay(3000).fadeOut("slow");
    }


</script>
</body>

</html>

