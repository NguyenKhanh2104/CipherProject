
<%@ page import="com.nlu.model.User" %>

<%
    User user =(User) session.getAttribute("auth");
    if (user == null || !user.getRole().equals("admin")){
        response.sendRedirect("/");
    }
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"  %>
<div class="left_wrapper">
    <div class="left">
        <div class="dashboard_title">
            <img src="/admin/images/webpage.svg" class="img-icon" alt=""/>
            <h2><a href="dashboard.jsp">DASH BOARD</a></h2>
            <img
                    src="/admin/images/close.svg"
                    id="close-btn"
                    alt=""
                    class="img-icon"
            />
        </div>
        <div class="left_menu">
            <div class="menu">
                <div class="menu_title">
                    <img src="/admin/images/received.svg" class="img-icon" alt=""/>
                    <h4 class="active">Sản Phẩm</h4>
                </div>
                <div class="sub_menu">
                    <a href="/admin/products.jsp">Tất Cả</a>
                    <a href="/admin/product-new.jsp" class="active">Thêm Sản Phẩm</a>
                    <a href="/admin/category.jsp">Doanh Mục</a>
                </div>
            </div>
            <div class="menu">
                <div class="menu_title">
                    <img src="/admin/images/profile.svg" class="img-icon" alt=""/>
                    <h4>Người Dùng</h4>
                </div>
                <div class="sub_menu">
                    <a href="/admin/users.jsp">Quản Trị</a>
                    <a href="/admin/user-new.jsp">Thêm Người Dùng</a>
<%--                    <a href="/admin/user-setting.jsp">Cài Đặt</a>--%>
<%--                    <a href="/admin/customers.jsp">Khách Hàng</a>--%>
                </div>
            </div>
            <div class="menu">
                <div class="menu_title">
                    <img src="/admin/images/box.svg" class="img-icon" alt=""/>
                    <h4>Đơn Hàng</h4>
                </div>
                <div class="sub_menu">
                    <a href="/admin/order.jsp">Tất Cả Đơn Hàng</a>
                </div>
            </div>
        </div>
    </div>
</div>