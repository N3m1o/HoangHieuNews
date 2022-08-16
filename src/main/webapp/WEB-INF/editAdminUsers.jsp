<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Chỉnh sửa</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/manager.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<style>
img {
	width: 200px;
	height: 120px;
}
</style>
<body>
	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>
							Sửa <b>Tài Khoản</b>
						</h2>
					</div>
					<div class="col-sm-6"></div>
				</div>
			</div>
		</div>
		<div id="addEmployeeModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="/editAdminUsers/${user.userID}" method="post">
					<div class="modal-header">
						<h4 class="modal-title">Sửa Tài Khoản</h4>
						<!-- <button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button> -->
					</div>
					<div class="modal-body">
					
						<div class="form-group">
								<label>ID</label> <input value="${user.userID}" name="userID"
									type="text" class="form-control" readonly required>
						</div>
						<div class="form-group">
							<label>Tên Đăng Nhập</label> <input value="${user.username}" name="username" type="text"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Mật Khẩu</label> <input value="${user.password}" name="password" type="text"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Tên Đầy Đủ</label> <input value="${user.fullname}" name="fullname" type="text"
								class="form-control" >
						</div>
						<div class="form-group">
							<label>Vai Trò</label>
							<c:choose>
								<c:when test="${user.isAuthor==0 && user.isAdmin==0 }">
									<input value="Người Đọc" type="text"
									class="form-control" readonly>
								</c:when>
								
								<c:when test="${user.isAuthor==1}">
									<input value="Nhà Báo" type="text"
									class="form-control" readonly>
								</c:when>
						
								<c:otherwise>
								<input value="Admin" name="fullname" type="text"
								class="form-control" readonly>
								</c:otherwise>
							</c:choose>
							 
						</div>
						<div class="form-group">
							<label>Ngày Sinh</label>
							 <input class="form-control" id="inputLocation" type="date" value="${user.dateOfBirth}" name="dateOfBirth" required>
						</div>
						<div class="form-group">
							<label>Ảnh đại diện</label> <input name="user_img" type="text" value="${user.user_img}"
								class="form-control">
						</div>
						
						<div class="form-group">
							<label>Mô tả ngắn</label>
							<textarea name="short_description" class="form-control" >${user.short_description}</textarea>
						</div>
						<div class="form-group">
							<label>Giới Tính</label>
							<select name="gender" class="form-select" aria-label="Default select example" style = "width: 120px; margin-left: 30px;">
									<c:choose>
										<c:when test="${user.gender==1 }">
											<option value = "1" seleted>Nam</option>
											<option value = "0">Nữ</option>
										</c:when>
										<c:otherwise>
											<option value = "1" >Nam</option>
											<option value = "0" seleted>Nữ</option>
										</c:otherwise>
									</c:choose>
									
							</select>
						</div>
						
					</div>
					<div class="modal-footer">
						<a href="/admin-users" type="button" class="btn btn-default" data-dismiss="modal">Hủy</a>
						<input type="submit" onclick="return confirm('Bạn có muốn lưu thay đổi?')" class="btn btn-success" value="Lưu">
					</div>
				</form>
			</div>
		</div>
	</div>

	</div>


	<script
		src="${pageContext.request.contextPath}/resources/js/manager.js"
		type="text/javascript"></script>
</body>
</html>
