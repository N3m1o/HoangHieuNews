<%@page import="org.springframework.ui.Model"%>
<%@page import="com.laptrinhjavaweb.controller.CategoryController"%>
<%@page import="com.laptrinhjavaweb.entity.CateEntity"%>
<%@page import="java.util.List"%>
<%@page import="com.laptrinhjavaweb.serviceImpl.CategoryServiceImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en"> 
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Manager Product</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/manager.css" rel="stylesheet" />
<style>
img {
	width: 200px;
	height: 120px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>
							QUẢN LÝ <b>TÀI KHOẢN</b>
						</h2>
					</div>
					<div class="col-sm-6">
						<a href="/home" class="btn btn-primary">
						<i class="material-icons">&#xE88A;</i><span>Home</span></a>
						<a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal">
						<i class="material-icons">&#xE147;</i> <span>Thêm Tài Khoản</span></a> 
						<!-- <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal">
						<i class="material-icons">&#xE15C;</i> <span>Xóa Tài Khoản</span></a> -->
						
					</div>
				</div>
			</div>
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<select style="display:inline-block;background-color:white;color:black" onchange="window.location=this.options[this.selectedIndex].value">
						<c:choose>
							<c:when test="${combobox==1 }">
								<option value="/admin-users/all/1"selected>Tất Cả</option>
								<option value="/admin-users/reader/1" >Người Đọc</option>
								<option value="/admin-users/author/1" >Nhà Báo</option>
							</c:when>
							
								<c:when test="${combobox==2 }">
									<option value="/admin-users/all/1">Tất Cả</option>
									<option value="/admin-users/reader/1" selected>Người Đọc</option>
									<option value="/admin-users/author/1" >Nhà Báo</option>
								</c:when>
								<c:otherwise>
									<option value="/admin-users/all/1">Tất Cả</option>
									<option value="/admin-users/reader/1" >Người Đọc</option>
									<option value="/admin-users/author/1" selected >Nhà Báo</option>
								</c:otherwise> 
	
						</c:choose>
						</select>
						
						<div class="container-1" style="display:inline-block;width: 300px; vertical-align: middle; white-space: nowrap;">
                              <form action="/admin-users/all">
                              <input style="width: 90%;color:black" name="searchString" value="" id="search" placeholder="Search..." />
                              <button type="submit"><i style="color:black" class="fa fa-search"></i></button>
                              </form>
                              </div>
					</div>
					<div class="col-sm-6">
						
					</div>
				</div>
			</div>
			
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Vai Trò</th>
						<th>Tên Đăng Nhập</th>
						<th>Hình đại diện</th>
						<th>Tên Đầy Đủ</th>
						<th>Mật Khẩu</th>
						<th>Thao tác</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="u" items="${users}">
						<tr>
							<td>
									<c:choose>
                                    		<c:when test="${u.isAuthor==1}">
                                    			<label>Nhà Báo</label>
                                    		</c:when>
                                    		<c:when test="${u.isAuthor==0 && u.isAdmin==0}">
                                    			<label>Người Đọc</label>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<label>Admin</label>
                                    		</c:otherwise>
                            		</c:choose>
                            </td>
							<td>${u.username}</td>
							<td><img src="${u.user_img}"></td>
							<td>${u.fullname}</td>
							<td>${u.password}</td>
							
							<td>
								<a href="/editAdminUsers/${u.userID}" class="edit" data-toggle="modal"> 
								<i class="material-icons" data-toggle="tooltip" title="Sửa">&#xE254;</i></a> 
								<a href="/deleteAdminUsers/${u.userID}" onclick="return confirm('Are you sure you want to delete this item')"  class="delete" data-toggle="modal"> 
								<i class="material-icons" data-toggle="tooltip" title="Xóa">&#xE872;</i></a>
								
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="clearfix">
				
			</div>
		</div>
		<a href="/home"><button type="button" class="btn btn-primary">Quay lại trang chủ</button></a>
	</div>
	
	<!-- Add Modal HTML -->
	<div id="addEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="/admin-users" method="post">
					<div class="modal-header">
						<h4 class="modal-title">Thêm Nhà Báo</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Tên Đăng Nhập</label> <input name="username" type="text"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Mật Khẩu</label> <input name="password" type="text"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Tên Đầy Đủ</label> <input name="fullname" type="text"
								class="form-control" >
						</div>
						<div class="form-group">
							<label>Ngày Sinh</label>
							 <input class="form-control" id="inputLocation" type="date" value="" name="dateOfBirth" required>
						</div>
						<div class="form-group">
							<label>Ảnh đại diện</label> <input name="user_img" type="text"
								class="form-control" >
						</div>
						
						<div class="form-group">
							<label>Mô tả ngắn</label>
							<textarea name="short_description" class="form-control" ></textarea>
						</div>
						<div class="form-group">
							<label>Giới Tính</label>
							<select name="gender" class="form-select" aria-label="Default select example" style = "width: 120px; margin-left: 30px;">
									<option value = "1">Nam</option>
									<option value = "0">Nữ</option>
							</select>
						</div>
						
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy"> 
						<input type="submit" class="btn btn-success" value="Thêm">
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- Delete Modal HTML--> 
	<div id="deleteEmployeeModal" class="modal fade">
		<div class="modal-dialog" style="max-width: 500px;">
			<div class="modal-content">
				<form>
					<div class="modal-header">
						<h4 class="modal-title">Xóa bài viết</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body" style="height: 200px;">
						<p>Bạn có chắc muốn xóa bài viết này không?</p>
						<p class="text-warning">
							<small>Hành động này sẽ không thể hủy bỏ.</small>
						</p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy"> 
						<input type="submit" class="btn btn-danger" value="Xóa">
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/manager.js" type="text/javascript"></script>
</body>
</html>