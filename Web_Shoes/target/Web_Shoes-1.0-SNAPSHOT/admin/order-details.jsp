
<%@ page import="com.nlu.model.User" %>

<%
    User user =(User) session.getAttribute("auth");
    if (user == null || !user.getRole().equals("admin")){
        response.sendRedirect("/");
    }
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Chi tiết order</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/admin/images/webpage.svg" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style/main.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style/order.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style/order-details.css"/>
</head>
<body>
<div class="body_container">
    <!-- ===***LEFT***=== -->
    <div class="left_wrapper">
        <div class="left">
            <div class="dashboard_title">
                <img src="./images/webpage.svg" class="img-icon" alt=""/>
                <h2><a href="dashboard.jsp">DASH BOARD</a></h2>
                <img
                        src="./images/close.svg"
                        id="close-btn"
                        alt=""
                        class="img-icon"
                />
            </div>
            <div class="left_menu">
                <div class="menu">
                    <div class="menu_title">
                        <img src="./images/received.svg" class="img-icon" alt=""/>
                        <h4>Sản Phẩm</h4>
                    </div>
                    <div class="sub_menu">
                        <a href="users.jsp">Quản Trị</a>
                        <a href="user-new.jsp">Thêm Người Dùng</a>
                        <a href="user-setting.jsp">Cài Đặt</a>
                        <a href="customers.jsp">Khách Hàng</a>
                    </div>
                </div>
                <div class="menu">
                    <div class="menu_title">
                        <img src="./images/profile.svg" class="img-icon" alt=""/>
                        <h4>Người Dùng</h4>
                    </div>
                    <div class="sub_menu">
                        <a href="users.jsp">Tất Cả</a>
                        <a href="user-new.jsp">Thêm Người Dùng</a>
                        <a href="user-setting.jsp">Cài Đặt</a>
                    </div>
                </div>
                <div class="menu">
                    <div class="menu_title">
                        <img src="./images/box.svg" class="img-icon" alt=""/>
                        <h4 class="active">Đơn Hàng</h4>
                    </div>
                    <div class="sub_menu">
                        <a href="order.jsp">Tất Cả Đơn Hàng</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ===***END OF LEFT***=== -->

    <!-- ===***RIGHT***=== -->
    <div class="right_wrapper">
        <div class="topbar">
            <div class="topbar_content">
                <div class="logo">
                    <img
                            src="./images/bars-solid.svg"
                            alt=""
                            class="img-icon"
                            id="left_menu-toggle"
                    />
                    <h3>SKED</h3>
                </div>
                <div class="current_user">
                    <h5 class="current_user-name">Duy Nguyen</h5>
                    <img
                            class="img-small"
                            src="./images//wallpaperflare.com_wallpaper (1).jpg"
                            alt=""
                    />
                    <div class="current_user-sub-menu">
                        <a href=""><img src="./images/settings.svg" alt=""/>Cài Đặt</a>
                        <a href="login.jsp"
                        ><img src="./images/logout.svg" alt=""/> Đăng Xuất
                        </a>
                        <a href="../index.jsp"> THOÁT </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="right">
            <div>
                <div class="heading_inline">
                    <h1>Chi tiết đơn hàng</h1>
                </div>
                <div class="order_data_panel">
                    <div class="order_data">
                        <div class="order_data-heading">Đơn hành #898 chi tiết</div>
                        <div class="order_data-meta">
                            Thanh toán qua trả tiền mặt khi nhận hàng.
                        </div>
                    </div>
                    <div class="order_data_col_container">
                        <div class="order_data-col">
                            <h3>Chung</h3>
                            <div>
                                <p>${cart.orderDate}</p>
                                <br/>
                                <div class="select">
                                    <select name="action">
                                        <option value="default">Tác Vụ</option>
                                        <option value="recyle">Xóa</option>
                                        <option value="processing">
                                            Đổi trạng thái đang xử lí
                                        </option>
                                        <option value="complete">
                                            Đổi trạng thái đã hoàn thành
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="order_data-col">
                            <h3>Thanh Toán</h3>
                            <p>
                                ${cart.username} ${cart.shippingAddress}
                            </p>
                            <br/>
                            <strong> Địa chỉ email: </strong><br/>
                            <a href="mailto:nguyenkhanhduy21123@gmail.com"
                            >${cart.email}</a
                            ><br/>
                            <strong>So diện thoại</strong><br/>
                            <a href="tel:+8469104353">${cart.phone}</a>
                        </div>

                        <div class="order_data-col">
                            <h3>Giao Hàng</h3>
                            <p>
                                ${cart.shippingAddress}
                            </p>
                            <br/>
                            <p class="note"> ${cart.shippingAddress}</p>
                        </div>
                    </div>
                </div>
                <div class="order_items-wrapper">
                    <table class="order_items">
                        <thead>
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Chi phí</th>
                            <th>Size</th>
                            <th>SL</th>
                            <th>Tổng</th>
                        </tr>
                        </thead>
                        <tbody class="order_line-item">
                        <c:forEach items="${cart.getData()}" var="cartItem">
                            <tr class="item">
                                <td>
                                    <div class="thumb">
                                        <img
                                                class="img-small"
                                                src="${cartItem.product.img}"
                                                alt=""
                                        />
                                        <a href="">${cart.username} ${cartItem.product.name}</a>
                                    </div>
                                </td>
                                <td>${cartItem.product.price}</td>
                                <td>${cartItem.size}</td>
                                <td>${cartItem.quality}</td>
                                <td>${cartItem.product.price * cartItem.quality}</td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                </div>
                <div>
                    <button class="btn_submit">Hoàn Tất</button>
                </div>
            </div>
        </div>
    </div>
    <!-- ===***END OF RIGHT***=== -->
</div>
</body>
<!-- <script src="./js/order.js"></script> -->
<script src="./js/main.js"></script>
</html>
