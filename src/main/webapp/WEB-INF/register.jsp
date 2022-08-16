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
        <title>Đăng Ký</title>
    </head>
    <body>
        
            
<!-- Form đăng kí tài khoản -->
		<div id="logreg-forms">
            <form action="/register" method="post" class="form-signin">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Đăng kí</h1>
                <p class="text-danger">${alert1}</p>
                <p class="text-danger">${alert2}</p>
                <input name="user" type="text" id="user-name" class="form-control" placeholder="Username" required autofocus>
                <input name="pass" type="password" id="user-pass" class="form-control" placeholder="Password" required autofocus>
                <input name="repass" type="password" id="user-repeatpass" class="form-control" placeholder="Repeat Password" required autofocus>

                <button class="btn btn-primary btn-block" type="submit" ><i class="fas fa-user-plus"></i>Đăng kí</button>
                <a href="/login" id="cancel_signup"><i class="fas fa-angle-left"></i>Quay lại</a>
            </form>
            <br>

        </div>
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
       	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    </body>
</html>