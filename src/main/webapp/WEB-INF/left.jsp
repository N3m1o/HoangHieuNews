<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="left_content">

          <div class="single_post_content">
            <h2><span>Thể Thao</span></h2> 
            
            <div class="single_post_content_left">
              <ul class="business_catgnav wow fadeInDown">
              <c:forEach var="c" items="${sportLeft}">
                <li>
                  <figure class="bsbig_fig"> <a href="/details/${c.newsId}" class="featured_img"> <img alt="" src="${c.display_img}"> <span class="overlay"></span> </a>
                    <figcaption> <a href="/details/${c.newsId}">${c.title}</a></figcaption>
                    <p style="overflow: hidden;
  											display: -webkit-box;
  											-webkit-line-clamp: 3;
  											-webkit-box-orient: vertical;">${c.shortDescription}
  					</p>
                  </figure>
                </li>
                </c:forEach>
              </ul>
            </div>
            
            <div class="single_post_content_right">
              <ul class="spost_nav">
              <c:forEach var="c" items="${sportRight}">
                <li>
                  <div class="media wow fadeInDown"> <a href="/details/${c.newsId}" class="media-left"> <img alt="" src="${c.display_img}"> </a>
                    <div class="media-body"> <a href="/details/${c.newsId}" class="catg_title">${c.title}</a> </div>
                  </div>
                </li>
              </c:forEach>
              </ul>
            </div>
          </div>
          
          <div class="fashion_technology_area">
            <div class="fashion">
            
              <div class="single_post_content">
                <h2><span>Văn Hóa</span></h2>
                <ul class="spost_nav">
                <c:forEach var="v" items="${cultural}">
                  	<li>
                  		<div class="media wow fadeInDown"> <a href="/details/${v.newsId}" class="media-left"> <img alt="" src="${v.display_img}"> </a>
                    		<div class="media-body"> <a href="/details/${v.newsId}" class="catg_title" style="font-size:20px;">${v.title}</a> </div>
                  		</div>
                  		<p style="overflow: hidden;
  											display: -webkit-box;
  											-webkit-line-clamp: 2;
  											-webkit-box-orient: vertical;"><a href="/details/${v.newsId}" title="${v.shortDescription}">${v.shortDescription}</a>
  						</p>
                	</li>
                </c:forEach>
                </ul>
              </div>
              
            </div>
            <div class="technology">
              <div class="single_post_content">
                <h2><span>Du Lịch</span></h2>
                <ul class="spost_nav">
                <c:forEach var="d" items="${travel}">
                  <li>
                  	<div class="media wow fadeInDown"> <a href="/details/${d.newsId}" class="media-left"> <img alt="" src="${d.display_img}"> </a>
                    	<div class="media-body"> <a href="/details/${d.newsId}" class="catg_title" style="font-size:20px;">${d.title}</a> </div>
                  	</div>
                  	<p style="overflow: hidden;
  											display: -webkit-box;
  											-webkit-line-clamp: 2;
  											-webkit-box-orient: vertical;"><a href="/details/${d.newsId}" title="${d.shortDescription}">${d.shortDescription}</a>
  					</p>
                  </li>
                </c:forEach>
                </ul>
              </div>
            </div>
          </div>
          
          <div class="single_post_content">
            <h2><span>Thời Sự</span></h2>
            <div class="single_post_content_left">
              <ul class="business_catgnav">
              <c:forEach var="t" items="${newsLeft}">
                <li>
                  <figure class="bsbig_fig"> <a href="/details/${t.newsId}" class="featured_img"> <img alt="" src="${t.display_img}"> <span class="overlay"></span> </a>
                    	<figcaption> <a href="/details/${t.newsId}">${t.title}</a> </figcaption>
                  	</figure>
                  	<p style="overflow: hidden;
  											display: -webkit-box;
  											-webkit-line-clamp: 3;
  											-webkit-box-orient: vertical;">${t.shortDescription}
  					</p>
                </li>
                </c:forEach>
              </ul>
            </div>
            <div class="single_post_content_right">
              <ul class="spost_nav">
              <c:forEach var="t" items="${newsRight}">
                <li>
                  <div class="media wow fadeInDown"> <a href="/details/${t.newsId}" class="media-left"> <img alt="" src="${t.display_img}"> </a>
                    	<div class="media-body"> <a href="/details/${t.newsId}" class="catg_title">${t.title}</a> </div>
                  	</div>
                </li>
                </c:forEach>
              </ul>
            </div> 
          </div>
          
          <div class="single_post_content">
            <h2><span>Chính Trị</span></h2>
            <div class="single_post_content_left">
              <ul class="business_catgnav">
              <c:forEach var="c" items="${politicsLeft}">
                <li>
                  <figure class="bsbig_fig"> <a href="/details/${c.newsId}" class="featured_img"> <img alt="" src="${c.display_img}"> <span class="overlay"></span> </a>
                    	<figcaption> <a href="/details/${c.newsId}">${c.title}</a> </figcaption>
                  	</figure>
                  	<p style="overflow: hidden;
  											display: -webkit-box;
  											-webkit-line-clamp: 3;
  											-webkit-box-orient: vertical;">${c.shortDescription}
  					</p>
                </li>
                </c:forEach>
              </ul>
            </div>
            <div class="single_post_content_right">
              <ul class="spost_nav">
              <c:forEach var="c" items="${politicsRight}">
                <li>
                  <div class="media wow fadeInDown"> <a href="/details/${c.newsId}" class="media-left"> <img alt="" src="${c.display_img}"> </a>
                    	<div class="media-body"> <a href="/details/${c.newsId}" class="catg_title">${c.title}</a> </div>
                  	</div>
                </li>
                </c:forEach>
              </ul>
            </div>
          </div>
          
          <div class="single_post_content">
            <h2><span>Giải Trí</span></h2>
            <div class="single_post_content_left">
              <ul class="business_catgnav">
              <c:forEach var="g" items="${entertainLeft}">
                <li>
                  <figure class="bsbig_fig"> <a href="/details/${g.newsId}" class="featured_img"> <img alt="" src="${g.display_img}"> <span class="overlay"></span> </a>
                    	<figcaption> <a href="/details/${g.newsId}">${g.title}</a> </figcaption>
                  	</figure>
                  	<p style="overflow: hidden;
  											display: -webkit-box;
  											-webkit-line-clamp: 3;
  											-webkit-box-orient: vertical;">${g.shortDescription}
  					</p>
                </li>
                </c:forEach>
              </ul>
            </div>
            <div class="single_post_content_right">
              <ul class="spost_nav">
              <c:forEach var="g" items="${entertainRight}">
                <li>
                  <div class="media wow fadeInDown"> <a href="/details/${g.newsId}" class="media-left"> <img alt="" src="${g.display_img}"> </a>
                    	<div class="media-body"> <a href="/details/${g.newsId}" class="catg_title">${g.title}</a> </div>
                  	</div>
                </li>
                </c:forEach>
              </ul>
            </div> 
          </div>
    
</div>