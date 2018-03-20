<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<!DOCTYPE html>
<html>

<head>
    <title>后台管理</title>
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
                        <li>文章管理</li>
                        <li class="active">类型管理</li>
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
                                    <span class="icon glyphicon glyphicon-list-alt"></span><span class="title">文章管理</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-element" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="${path}/article/1/10" style="text-align: center">文章审核(提交状态)</a>
                                            </li>
                                            <li><a href="${path}/SaveA/1/10" style="text-align: center">文章管理(保存状态)</a>
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
                                    <div class="title">文章类型管理</div>
                                    <hr>
                                    <i style="font-size: 16px">总共有：<em
                                            style="color: red;font-size: 20px">7</em> 条信息</i>
                                    <hr>
                                    <div>
                                        <!-- 新增类型 -->
                                        <button type="button" class="btn btn-primary" data-toggle="modal"
                                                data-target="#addKind">
                                            新增类型
                                        </button>
                                        <!-- 新增类型 -->
                                        <div class="modal fade" id="addKind" tabindex="-1" role="dialog"
                                             aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close"><span
                                                                aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title" id="myModalLabel">新增类型</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <label for="exampleInputEmail1">父类名称</label>
                                                            <input type="email" class="form-control" id="exampleInputEmail1" placeholder="">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="exampleInputPassword1">子类名称</label>
                                                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="子类名称可为空">
                                                        </div>
                                                        <div class="radio3" >
                                                            <input type="radio" id="radio3" name="radio2" value="option1">
                                                            <label for="radio2">
                                                                电影新闻
                                                            </label>
                                                            <input type="radio" id="radio4" name="radio2" value="option2">
                                                            <label for="radio2">
                                                                热点新闻
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default"
                                                                data-dismiss="modal">关闭
                                                        </button>
                                                        <button type="button" class="btn btn-primary">确定</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>


                                <div class="card-body">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>父类型</th>
                                            <th>子类型数量</th>
                                            <th>子类型ID</th>
                                            <th>子类型</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr class="active">
                                            <th scope="row" >1</th>
                                            <td>电影新闻</td>
                                            <td>3</td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary dropdown-toggle"
                                                            data-toggle="dropdown"
                                                            style="margin: 0 auto;border-radius: 6px">
                                                        操作 <span
                                                            class="caret"></span></button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#" data-toggle="modal"
                                                               data-target="#editParent">修改信息</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"></th>
                                            <td></td>
                                            <td></td>
                                            <td>2</td>
                                            <td>影片介绍</td>
                                            <td>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary dropdown-toggle"
                                                            data-toggle="dropdown"
                                                            style="margin: 0 auto;border-radius: 6px">
                                                        操作 <span
                                                            class="caret"></span></button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#" data-toggle="modal"
                                                               data-target="#editParent">修改信息</a></li>
                                                        <li><a href="#" data-toggle="modal"
                                                               data-target="#editSon">修改父类</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"></th>
                                            <td></td>
                                            <td></td>
                                            <td>3</td>
                                            <td>影片观后感</td>
                                            <td>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary dropdown-toggle"
                                                            data-toggle="dropdown"
                                                            style="margin: 0 auto;border-radius: 6px">
                                                        操作 <span
                                                            class="caret"></span></button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#" data-toggle="modal"
                                                               data-target="#editParent">修改信息</a></li>
                                                        <li><a href="#" data-toggle="modal"
                                                               data-target="#editSon">修改父类</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"></th>
                                            <td></td>
                                            <td></td>
                                            <td>4</td>
                                            <td>影片推荐</td>
                                            <td>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary dropdown-toggle"
                                                            data-toggle="dropdown"
                                                            style="margin: 0 auto;border-radius: 6px">
                                                        操作 <span
                                                            class="caret"></span></button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#" data-toggle="modal"
                                                               data-target="#editParent">修改信息</a></li>
                                                        <li><a href="#" data-toggle="modal"
                                                               data-target="#editSon">修改父类</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr class="active">
                                            <th scope="row" >5</th>
                                            <td>热点新闻</td>
                                            <td>2</td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary dropdown-toggle"
                                                            data-toggle="dropdown"
                                                            style="margin: 0 auto;border-radius: 6px">
                                                        操作 <span
                                                            class="caret"></span></button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#" data-toggle="modal"
                                                               data-target="#editParent">修改信息</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"></th>
                                            <td></td>
                                            <td></td>
                                            <td>6</td>
                                            <td>国内新闻</td>
                                            <td>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary dropdown-toggle"
                                                            data-toggle="dropdown"
                                                            style="margin: 0 auto;border-radius: 6px">
                                                        操作 <span
                                                            class="caret"></span></button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#" data-toggle="modal"
                                                               data-target="#editParent">修改信息</a></li>
                                                        <li><a href="#" data-toggle="modal"
                                                               data-target="#editSon">修改父类</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"></th>
                                            <td></td>
                                            <td></td>
                                            <td>7</td>
                                            <td>国外新闻</td>
                                            <td>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-primary dropdown-toggle"
                                                            data-toggle="dropdown"
                                                            style="margin: 0 auto;border-radius: 6px">
                                                        操作 <span
                                                            class="caret"></span></button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#" data-toggle="modal"
                                                               data-target="#editParent">修改信息</a></li>
                                                        <li><a href="#" data-toggle="modal"
                                                               data-target="#editSon">修改父类</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div>
                                        <nav>
                                            <ul class="pagination pagination-lg" style="margin-left: 40%;margin-top: 5%">
                                                <li>
                                                    <a href="#" aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                                <li class="active"><a href="#">1</a></li>
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
</div>

<!--修改信息-->
<div class="modal fade" id="editParent" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel1">修改父类信息</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="exampleInputEmail1">新父类名称</label>
                    <input type="email" class="form-control" id="exampleInputEmail2" placeholder="电影新闻">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary">发布</button>
            </div>
        </div>
    </div>
</div>
<!--父类选择-->
<div class="modal fade" id="editSon" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel2">父类选择</h4>
            </div>
            <div class="modal-body">
                <div class="radio3">
                    <input type="radio" id="radio1" name="radio1" value="option1">
                    <label for="radio1">
                        电影新闻
                    </label>
                </div>
                <div class="radio3">
                    <input type="radio" id="radio2" name="radio1" value="option2">
                    <label for="radio2">
                        热点新闻
                    </label>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary">保存</button>

            </div>
        </div>
    </div>
</div>

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
</body>

</html>