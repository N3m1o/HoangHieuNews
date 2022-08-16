<%@page import="org.springframework.ui.Model"%>
<%@page import="com.laptrinhjavaweb.controller.CategoryController"%>
<%@page import="com.laptrinhjavaweb.entity.CateEntity"%>
<%@page import="java.util.List"%>
<%@page import="com.laptrinhjavaweb.serviceImpl.CategoryServiceImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int pageId = (Integer)request.getAttribute("pageId"); 
	int pageIdprevious = pageId-1;
	int pageIdfollowing = pageId+1;
	int pageIdLimit = (Integer)request.getAttribute("pageIdLimit");
	int pageIdNumber = (Integer)request.getAttribute("pageIdNumber");
	int newsNumber = (Integer)request.getAttribute("newsNumber");
	String filter = (String)request.getAttribute("filter");
%>
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
							QUẢN LÝ <b>BÀI VIẾT</b>
						</h2>
					</div>
					<div class="col-sm-6">
						<a href="/home" class="btn btn-primary">
						<i class="material-icons">&#xE88A;</i><span>Home</span></a>
						<a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal">
						<i class="material-icons">&#xE147;</i> <span>Thêm bài viết</span></a> 
						
					</div>
				</div>
			</div>
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<select style="display:inline-block;background-color:white;color:black" onchange="window.location=this.options[this.selectedIndex].value">
						<c:choose>
							<c:when test="${combobox==1 }">
								<option value="/author/all/1"selected>Tất Cả</option>
								<option value="/author/daduyet/1" >Đã Duyệt</option>
								<option value="/author/chuaduyet/1" >Chưa Duyệt</option>
							</c:when>
							
								<c:when test="${combobox==2 }">
									<option value="/author/all/1">Tất Cả</option>
									<option value="/author/daduyet/1" selected>Đã Duyệt</option>
									<option value="/author/chuaduyet/1">Chưa Duyệt</option>
								</c:when>
								<c:otherwise>
									<option value="/author/all/1">Tất Cả</option>
									<option value="/author/daduyet/1" >Đã Duyệt</option>
									<option value="/author/chuaduyet/1" selected>Chưa Duyệt</option>
								</c:otherwise> 
	
						</c:choose>
						</select>
						
						      <div class="container-1" style="display:inline-block;width: 300px; vertical-align: middle; white-space: nowrap;">
                              <form action="/author/all">
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
						<th>Status</th>
						<th>Tiêu đề</th>
						<th>Hình đại diện</th>
						<th>Ngày Đăng</th>
						<th>Mô tả ngắn</th>
						<th>Thao tác</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="c" items="${news}">
						<tr>
							<td>
									<c:choose>
                                    		<c:when test="${c.status==true}">
                                    			<label>Đã duyệt</label>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<label>Chưa duyệt</label>
                                    		</c:otherwise>
                            		</c:choose>
                            </td>
							<td>${c.title}</td>
							<td><img src="${c.display_img}"></td>
							<td>${c.date_submitted}</td>
							<td>${c.shortDescription}</td>
							
							<td>
								<a href="/edit/${c.newsId}" class="edit" data-toggle="modal"> 
								<i class="material-icons" data-toggle="tooltip" title="Sửa">&#xE254;</i></a> 
								<a href="/delete/${c.newsId}" onclick="return confirm('Are you sure you want to delete this item')"  class="delete" data-toggle="modal"> 
								<i class="material-icons" data-toggle="tooltip"  title="Xóa">&#xE872;</i></a>

								
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="clearfix">
				<div class="hint-text">

					Hiển thị <b><%=pageIdNumber %></b> trong số <b><%=newsNumber %></b> bài
				</div>
				<ul class="pagination"> 
					<li class="page-item"><a href="/author/<%=filter%>/1">Đầu</a></li>
					
					<% if (pageId==1){ %>
					<li class="page-item"><a href="#">Trước</a></li>
					<% } else { %>
					<li class="page-item"><a href="/author/<%=filter%>/<%=pageIdprevious%>">Trước</a></li>
					<% } 
					
					if (pageId==pageIdLimit) {%>
					<li class="page-item"><a href="#">Sau</a></li>
					<%} else { %>
					<li class="page-item"><a href="/author/<%=filter%>/<%=pageIdfollowing%>">Sau</a></li>
					<%} %>
					
					
					<li class="page-item"><a href="/author/<%=filter%>/<%=pageIdLimit%>">Cuối</a></li>
				</ul>

				
				</div>
				
			</div>
		</div>


	
	<!-- Add Modal HTML -->
	<div id="addEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="/author" method="post">
					<div class="modal-header">
						<h4 class="modal-title">Thêm bài viết</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Tiêu đề</label> <input name="title" type="text"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Ảnh đại diện</label> <input name="display_image" type="text"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Mô tả ngắn</label>
							<textarea name="short_description" class="form-control" required></textarea>
						</div>
						<div class="form-group">
							<label>Thể loại</label>
							<select name="category" class="form-select" aria-label="Default select example" style = "width: 120px; margin-left: 30px;">
									<c:forEach var="c" items="${cateList}">
									<option value = "${c.cid}">${c.cname}</option>
									</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>Nội dung</label>
							<textarea name="content" class="form-control" required
								id="content"></textarea>
							<script type="text/javascript">
								CKEDITOR.replace('content', {
									//width : "520px",
									height : "550px"
								});
							</script>
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
				<form id="helloForm">
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
	
	<script src="${pageContext.request.contextPath}/resources/js/manager.js" type="text/javascript">
	
	</script>
	
</body>
</html>