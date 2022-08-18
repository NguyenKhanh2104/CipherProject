<%@ page import="com.nlu.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-light navbar-expand-md navigation-clean-search">
    <div class="container-fluid"><a class="navbar-brand" href="/" style="font-size: 40px;">${shopDetails.shopName}</a>
        <button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="nav navbar-nav">
                <li class="nav-item"><a class="nav-link" href="/">Trang chủ</a></li>
                <li class="nav-item"><a class="nav-link" href="/products?category=all&pages=1">Sản phẩm</a></li>
                <li class="nav-item"><a class="nav-link" href="/main/support.jsp">Hỗ Trợ</a></li>
                <li class="nav-item"><a class="nav-link" href="/main/cart.jsp">Giỏ hàng<i class="fa fa-shopping-cart"
                                                                                          style="padding-left: 5px;"></i></a>
                </li>
                <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" data-toggle="dropdown"
                                                 aria-expanded="false" href="#">Doanh Mục</a>
                    <div class="dropdown-menu">
                        <c:forEach items="${categories}" var="category">
                            <c:if test="${category.status == 1}">
                                <a class="dropdown-item"
                                   href="/products?category=${category.name}&pages=1">${category.name}</a>
                            </c:if>
                        </c:forEach>
                    </div>
                </li>
                <form class="form-inline mr-auto" target="_self" action="searchProduct" method="post">
                    <div class="form-group"><label for="search-field">
                        <i class="fa fa-search"></i>
                    </label><input
                            class="form-control search-field" type="search" id="search-field" name="txt">
                    </div>
                </form>

            </ul>
            <%
                User auth = (User) session.getAttribute("auth");
                request.setAttribute("auth", auth);
            %>
            <c:if test="${auth != null}">
                <span class="authName " style="color: #d9d9d9;margin-left: 321px">Hi! ${auth.username}</span>
            </c:if>
            <c:if test="${auth != null}">
                <span class="logout " style="margin-left: 15px"> <a class="btn btn-light action-button" role="button"  href="/logout">Đăng Xuất</a></span>
            </c:if>
            <c:if test="${auth == null}">
                <span class="navbar-text "> <a class="login" href="/main/login.jsp">Đăng Nhập</a></span>
            </c:if>
            <c:if test="${auth == null}">
                <a class="btn btn-light action-button" role="button" href="/main/register.jsp">Đăng Kí</a>
            </c:if>
        </div>

    </div>
</nav>
