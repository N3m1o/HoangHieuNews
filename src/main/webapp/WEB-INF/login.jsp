<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
        <link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet" type="text/css"/>
        <title>Đăng nhập</title>
    </head>
    <body>
        <div id="logreg-forms">
            <form class="form-signin" action="login" method="post">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Đăng nhập</h1>
                
                <p class="text-danger">${mess}</p>
                <input name="username"  type="text" id="inputEmail" class="form-control" placeholder="Username" required autofocus>
                <input name="password"  type="password" id="inputPassword" class="form-control" placeholder="Password" required>

                <div class="form-group form-check">
                    <input name="remember-me" type="checkbox" value="yes" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Ghi nhớ</label>
                </div>

                <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Đăng nhập</button>
                <hr>
                <p>Chưa có Tài Khoản? <a style="display:inline-block;" href="/register">Đăng kí tài khoản</a></p>
            </form>
       		</div>
       	
       	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
       	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	</body>
</html>