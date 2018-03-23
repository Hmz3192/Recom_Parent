<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>NewsPro-后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="${path}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/static/login/animate.css">
    <link rel="stylesheet" href="${path}/static/login/style.css">


</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-12 text-center">
        </div>
    </div>
    <div class="row">
        <div class="col-md-8 col-md-offset-2">


            <!-- Start Sign In Form -->
            <form action="${path}/tl" class="fh5co-form animate-box"  method="post" data-animate-effect="fadeIn">
                <h2>后台管理员登录</h2>
                <div class="form-group">
                    <label for="adminName" class="sr-only">用户名</label>
                    <input type="text" class="form-control" id="adminName"  name="adminName" placeholder="用户名" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="password" class="sr-only">密码</label>
                    <input type="password" class="form-control" id="password"  name="password" placeholder="密码" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="remember"><input type="checkbox" id="remember"> 记住我</label>
                </div>
                <div class="form-group">
                    <input type="submit" value="登录" class="btn btn-primary">
                </div>
            </form>
            <!-- END Sign In Form -->
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
</body>
</html>


