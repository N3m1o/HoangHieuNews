<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-lg-4 col-md-4 col-sm-4">
        <div class="latest_post">
          <h2><span>Bài viết mới nhất</span></h2>
          <div class="latest_post_container">
            <div id="prev-button"><i class="fa fa-chevron-up"></i></div>
            <ul class="latest_postnav">
            <c:forEach var="o" items="${lastestNews}">
              <li>
                <div class="media"> <a href="/details/${o.newsId}" class="media-left"> <img alt="" src="${o.display_img}"> </a>
                  <div class="media-body"> <a href="/details/${o.newsId}" class="catg_title">${o.title}</a> </div>
                </div>
              </li>
             </c:forEach>
            </ul>
            <div id="next-button"><i class="fa  fa-chevron-down"></i></div>
          </div>
        </div>
      </div>