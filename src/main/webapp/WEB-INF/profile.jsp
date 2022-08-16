<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">
	<style type="text/css">
            body {
                margin-top: 20px;
                background-color: #f2f6fc;
                color: #69707a;
            }

            .img-account-profile {
                height: 10rem;
            }

            .rounded-circle {
                border-radius: 50% !important;
            }

            .card {
                box-shadow: 0 0.15rem 1.75rem 0 rgb(33 40 50 / 15%);
            }

            .card .card-header {
                font-weight: 500;
            }

            .card-header:first-child {
                border-radius: 0.35rem 0.35rem 0 0;
            }

            .card-header {
                padding: 1rem 1.35rem;
                margin-bottom: 0;
                background-color: rgba(33, 40, 50, 0.03);
                border-bottom: 1px solid rgba(33, 40, 50, 0.125);
            }

            .form-control,
            .dataTable-input {
                display: block;
                width: 100%;
                padding: 0.875rem 1.125rem;
                font-size: 0.875rem;
                font-weight: 400;
                line-height: 1;
                color: #69707a;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #c5ccd6;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                border-radius: 0.35rem;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }

            .nav-borders .nav-link.active {
                color: #0061f2;
                border-bottom-color: #0061f2;
            }

            .nav-borders .nav-link {
                color: #69707a;
                border-bottom-width: 0.125rem;
                border-bottom-style: solid;
                border-bottom-color: transparent;
                padding-top: 0.5rem;
                padding-bottom: 0.5rem;
                padding-left: 0;
                padding-right: 0;
                margin-left: 1rem;
                margin-right: 1rem;
            }
        </style>
</head>

<body>
    <div id="snippetContent">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <div class="container-xl px-4 mt-4">
            <hr class="mt-0 mb-4">
            <div class="row">
                <div class="col-xl-4">
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Ảnh đại diện</div>
                        <div class="card-body text-center"> <img class="img-account-profile rounded-circle mb-2"
                                src="${user.user_img}" alt="">
                            <!-- <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div> <button
                                class="btn btn-primary" type="button">Tải ảnh lên</button>-->
                        </div>
                    </div>
                </div>
                <div class="col-xl-8">
                    <div class="card mb-4">
                        <div class="card-header">Thông tin tài khoản</div>
                        <div class="card-body">
                            <form action="/user/${user.userID}" method="post">
                                <div class="mb-3"> <label class="small mb-1">Tên đăng nhập (Tên hiển thị trên trang web)</label> 
                                <input class="form-control" id="inputUsername" type="text" value="${user.username}" name="username" readonly></div>
                                
                                <div class="mb-3"> <label class="small mb-1">Ảnh Đại Diện</label> 
                                <input class="form-control" id="inputUsername" type="text" value="${user.user_img}" name="user_img"></div>
                                
                                <div class="mb-3"> <label class="small mb-1">Họ và tên</label> 
                                <input class="form-control" id="inputUsername" type="text" value="${user.fullname}" name="fullname"></div>
                                
                                <div class="row gx-3 mb-3">
                                    <div class="col-md-6"> 
                                    	<label class="small mb-1" for="inputOrgName">Giới tính</label>
                                    	<select class="form-control" id="inputOrgName" name="gender">
                                    	<c:choose>
                                    		<c:when test="${user.gender==1}">
                                    			<option value="1" selected="selected">Nam</option>
                                    			<option value="0">Nữ</option>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<option value="1" >Nam</option>
                                    			<option value="0" selected="selected">Nữ</option>
                                    		</c:otherwise>
                                    	</c:choose>
                                    	</select>
                                    </div>
                                    
                                    <div class="col-md-6"> <label class="small mb-1">Ngày sinh</label> 
                                    <input class="form-control" id="inputLocation" type="date" value="${user.dateOfBirth}" name="date_of_birth"></div>
                                </div>
                                <div class="mb-3"> <label class="small mb-1">Mô tả bản thân</label> 
                                <input class="form-control" id="inputEmailAddress" type="text" value="${user.short_description}" name="short_description"></div>
                                
                                <input class="btn btn-primary" onclick="alert('Lưu Thành Công')" type="submit" value="Lưu thay đổi">
                                <a href="/home"><button type="button" class="btn btn-primary">Quay lại trang chủ</button></a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       </div>
</body>

</html>