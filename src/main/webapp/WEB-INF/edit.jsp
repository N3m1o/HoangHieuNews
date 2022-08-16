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
							Sửa <b>Bài Viết</b>
						</h2>
					</div>
					<div class="col-sm-6"></div>
				</div>
			</div>
		</div>
		<div id="editEmployeeModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="/edit/${news.newsId}" method="post">
						<div class="modal-header">
							<h4 class="modal-title">Sửa bài viết</h4>
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>ID</label> <input value="${news.newsId}" name="id"
									type="text" class="form-control" readonly required>
							</div>
							<div class="form-group">
								<label>Tiêu đề</label> <input value="${news.title}" name="title"
									type="text" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Ảnh đại diện</label> <input value="${news.display_img}"
									name="display_image" type="text" class="form-control" required>
							</div>

							<div class="form-group">
								<label>Nội dung</label>
								<textarea name="content" class="form-control" required
									id="content">${news.content}</textarea>
								<script type="text/javascript">
									CKEDITOR.replace('content', {
										width : "560px",
										height : "700px"
									});
								</script>
								<div class="form-group">
									<label>Mô tả ngắn</label>
									<textarea name="short_description" class="form-control"
										required>${news.shortDescription}</textarea>
								</div>
							</div>
							<div class="form-group">
								<label>Thể loại</label> <select name="category"
									class="form-select" aria-label="Default select example"
									style="width: 120px; margin-left: 30px;">
									<c:forEach var="c" items="${cateList}">
										<c:choose>
											<c:when test="${c.cid==news.cateId.cid}">
												<option value="${c.cid}" selected>${c.cname}</option>
											</c:when>
											<c:otherwise>
												<option value="${c.cid}">${c.cname}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>

						</div>
						<div class="modal-footer">
							<a href="/author" type="button" class="btn btn-default" data-dismiss="modal">Hủy</a>
							<input type="submit" onclick="return confirm('Bạn có muốn lưu thay đổi?')"  class="btn btn-success" value="Lưu">
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
