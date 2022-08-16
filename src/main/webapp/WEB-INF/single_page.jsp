<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.laptrinhjavaweb.entity.UserEntity"%>
<%
Object object = session.getAttribute("userEntity");
UserEntity userEntity = (UserEntity)object;
%>
<!DOCTYPE html>
<html>
<head>
<title>${details.title}</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/li-scroller.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slick.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/theme.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>

</head>
<body>
	<a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
	<div class="container">

		<jsp:include page="header.jsp"></jsp:include>

		
		
		<section id="contentSection">
			<div class="row">
				<div class="col-lg-8 col-md-8 col-sm-8">
					<div class="left_content">
						<div class="single_page">
							<ol class="breadcrumb">
								<li><a href="/home">Trang chủ</a></li>
								<li><a href="/category/${cate.cid}">${cate.cname}</a></li>
							</ol>
							<h1>${details.title}</h1>
							<div class="post_commentbox">
								<a href="#"><i class="fa fa-user"></i>${person.fullname}</a> 
								<a href="/category/${cate.cid}"> <i class="fa fa-tags"></i>${cate.cname}</a>
								<a><i class="fa fa-calendar"></i>${details.date_submitted}</a>
							</div>
							<div class="single_page_content">
								<img class="img-center" src="${details.display_img}" alt="">
								
								<blockquote>${details.shortDescription}</blockquote>
								<p>${details.content}</p>
								<br>
								<p align = "right"><b>Tác giả: ${person.fullname}</b></p>
							</div>
							<div class="social_link">
								<ul class="sociallink_nav">
									<li><a href="https://www.facebook.com/sharer/sharer.php?u=http://localhost:8089/details/${details.newsId}" target="_blank"><i class="fa fa-facebook"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a href="https://plus.google.com/share?url=http://localhost:8089/details/${details.newsId}"><i class="fa fa-google"></i></a></li>
									<li><a href="https://www.youtube.com/c/vtv24" target="_blank"><i class="fa fa-youtube"></i></a></li>
									<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
								</ul>
							</div>
							<%
							if (object != null) {
							%>
					<form action="/details/${details.newsId}" method="post" style="margin-bottom:10px">
						<div>
						<h1 style="margin-bottom:10px;">Ý kiến bạn đọc</h1>
						<h4>Bình luận     <i class="fa fa-pencil"></i></h4>
							<textarea name="main" class="form-control" required id="main"></textarea>
							<script type="text/javascript">
								CKEDITOR.replace('main', {
									editorplaceholder: 'Quý độc giả vui lòng viết Tiếng Việt có dấu. Mọi bình luận mang tính chất xúc phạm, đe dọa, tục tĩu đều sẽ bị xóa!',
									toolbar: [
							               [ 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink' ],
							               [ 'FontSize', 'TextColor', 'BGColor' ],
							               [ 'Cut', 'Copy', 'Paste', 'Undo', 'Redo' ],
							               [ 'Smiley']
							           ]
								});
							</script>
						</div>
						<button class="btn btn-success btn-block" type="submit" style="background-color:#d083cf;">Bình luận</button>
					</form>
							<%
							} else {
							%>
							<h1 style="margin-bottom:10px;">Ý kiến bạn đọc</h1>
							<p>Quý độc giả vui lòng <a href="/login" style="color:rgb(255, 0, 0); font-size:15px; background-color:#ffff00;"><strong>Đăng nhập</strong></a> để tham gia Bình luận!</p>
							<%
							}
							%>	
							
					<div>
					<c:forEach var="c" items="${comment}">
						<li style="list-style: none;">
                  		<div class="media wow fadeInDown"> <a class="media-left"> <img alt="" style="height:40px; width:40px;border-radius:50px;" src="${c.userId.user_img}"> </a>
                    		<div class="media-body"> <a class="catg_title" style="font-size:20px; font-weight:bold;">${c.userId.fullname} </a> </div>
                  		</div>
                  		<div style="margin-left:51px;">${c.commentMain}</div>
                  		<a style="font-size:12px; margin-left:51px;"><i class="fa fa-clock-o"></i>         ${c.commentDate}</a>
                  		<br><hr>
                		</li>
					</c:forEach>
					</div>
					
					
							<div class="related_post">
								<h2>
									Bài viết liên quan
								</h2>
								<ul class="spost_nav wow fadeInDown animated">
								<c:forEach var="r" items="${random}">
									<li>
										<div class="media">
											<a class="media-left" href="/details/${r.newsId}" title="${r.title}"> 
												<img src="${r.display_img}">
											</a>
											<div class="media-body">
												<div style="overflow: hidden;
  															display: -webkit-box;
  															-webkit-line-clamp: 3;
  															-webkit-box-orient: vertical;">
  												<a class="catg_title" href="/details/${r.newsId}" title="${r.title}">${r.title}</a></div>
											</div>
										</div>
									</li>
								</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				<jsp:include page="lastest.jsp"></jsp:include>

				<jsp:include page="right.jsp"></jsp:include>

			</div>
		</section>

		<jsp:include page="footer.jsp"></jsp:include>

	</div>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.li-scroller.1.0.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.newsTicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.pack.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
</body>
</html>