<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="footer-dark">
    <footer>
        <div class="container">
            <h1>${shopDetails.shopName}</h1>
            <p>${shopDetails.bottomDescription}<br></p>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-3 col-xl-2 item">
                    <h3>Thương hiệu</h3>
                    <ul>
                        <c:forEach items="${categories}" var="category">
                            <c:if test="${category.status == 1}">
                                <li>
                                    <a href="/products?category=${category.name}">${category.name}</a>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
                <div class="col-sm-6 col-md-3 col-xl-2 item">
                    <h3>About</h3>
                    <ul>
                        <c:forEach items="${tags}" var="tag">
                            <c:if test="${tag.status == 1}">
                                <li><a href="#">${tag.name}</a></li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
                <div class="col-sm-6 col-md-3 col-xl-4 item">
                    <h3>About</h3>
                    <ul>

                        <li>
                            <i class="fa fa-phone"></i>
                            <a href="#" style="padding-left: 10px;">${shopDetails.phone}</a>
                        </li>
                        <li>
                            <i class="fas fa-envelope"></i>
                            <a href="#" style="padding-left: 10px;">${shopDetails.email}</a>
                        </li>
                        <li>
                            <i class="fa fa-location-arrow"></i>
                            <a href="#" style="padding-left: 10px;">${shopDetails.address}</a>
                        </li>

                    </ul>
                    <li>
                        <a href="/admin/dashboard.jsp">Quan Li</a>
                    </li>
                </div>
                <div class="col-md-6 col-xl-4 item text">
                    <h3>${shopDetails.shopName}</h3>
                    <p>Praesent sed lobortis mi. Suspendisse vel placerat ligula. Vivamus ac sem lacus. Ut vehicula
                        rhoncus elementum. Etiam quis tristique lectus. Aliquam in arcu eget velit pulvinar dictum vel
                        in justo.</p>
                </div>
                <div class="col item social"><a href="#"><i class="icon ion-social-facebook"></i></a><a href="#"><i
                        class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a
                        href="#"><i class="icon ion-social-instagram"></i></a></div>
            </div>
            <p class="copyright">${shopDetails.shopName} © 2017</p>
        </div>
    </footer>
</div>