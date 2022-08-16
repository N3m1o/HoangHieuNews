<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Footer -->
<footer id="footer">
    <div class="footer_top">
      <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-4">
          <div class="footer_widget wow fadeInLeftBig">
            <h2>Website tin tức</h2>
          </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4">
          <div class="footer_widget wow fadeInDown">
            <h2>Chủ đề</h2>
            <ul class="tag_nav">
              <li>
          		<c:forEach var="c" items="${cateList}">
          			<a href="/category/${c.cid}">${c.cname}</a>
          		</c:forEach>
          	</li>
            </ul>
          </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4">
          <div class="footer_widget wow fadeInRightBig">
            <h2>Liên hệ chúng tôi</h2>
            <p></p>
            <address>
            55 Giải Phóng, Hai Bà Trưng, Hà Nội, <br> 
            Số điện thoại: 123-456-899, <br> 
            Gmail: doanlaptrinhUDM@gmail.com
            </address>
          </div>
        </div>
      </div>
    </div>
  </footer>