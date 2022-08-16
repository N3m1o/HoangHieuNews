<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-lg-4 col-md-4 col-sm-4" style="float:right">
        <aside class="right_content">
          <div class="single_sidebar">
            <h2><span>Bài Viết Nổi Bật</span></h2>
            <ul class="spost_nav">
            <c:forEach var="r" items="${random}">
              <li>
                <div class="media wow fadeInDown"> <a href="/details/${r.newsId}" class="media-left"> <img alt="" src="${r.display_img}"> </a>
                  <div class="media-body"> <a href="/details/${r.newsId}" class="catg_title">${r.title}</a> </div>
                </div>
              </li>
              </c:forEach>
            </ul>
          </div>
          <div class="single_sidebar">
            <ul class="nav nav-tabs" role="tablist">
              <li role="presentation" class="active"><a href="#category" aria-controls="home" role="tab" data-toggle="tab">Thể loại</a></li>
              <li role="presentation"><a href="#video" aria-controls="profile" role="tab" data-toggle="tab">Video</a></li>
            </ul>
            <div class="tab-content">
              <div role="tabpanel" class="tab-pane active" id="category">
                <ul>
                <c:forEach var="c" items="${cateList}">
                  <li class="cat-item"><a href="/category/${c.cid}">${c.cname}</a></li>
                </c:forEach>
                </ul>
              </div>
              <div role="tabpanel" class="tab-pane" id="video">
                <div class="vide_area">
              		<iframe width="100%" height="250" src="https://www.youtube.com/embed/nIE-CycFToI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
              </div>
            </div>
          </div>
  
          <div class="single_sidebar wow fadeInDown">
            <h2><span>Links</span></h2>
            <ul>
              <li><a href="#">FaceBook</a></li>
              <li><a href="#">Twitter</a></li>
              <li><a href="https://www.youtube.com/c/vtv24" target="_blank">Youtube</a></li>
              <li><a href="/login">Login</a></li>
            </ul>
          </div>
          					<div class="social_link">
								<ul class="sociallink_nav">
									<li><a href="#"><i class="fa fa-facebook"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a href="#"><i class="fa fa-google"></i></a></li>
									<li><a href="https://www.youtube.com/c/vtv24" target="_blank"><i class="fa fa-youtube"></i></a></li>
									<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
								</ul>
							</div>
        </aside>
      </div>