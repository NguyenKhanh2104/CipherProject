<%@ page import="com.nlu.model.User" %>

<%
    User user =(User) session.getAttribute("auth");
    if (user == null || !user.getRole().equals("admin")){
        response.sendRedirect("/");
    }
%>

<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Doanh mục</title>
    <link rel="shortcut icon" href="./images/webpage.svg" type="image/x-icon" />
    <link rel="stylesheet" href="./style/main.css" />
    <link rel="stylesheet" href="./style/category.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script>
    <link rel="stylesheet" href="/admin/style/category_setting.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>
<div class="body_container">
    <!-- ===***LEFT***=== -->
    <div class="left_wrapper">
        <div class="left">
            <div class="dashboard_title">
                <img src="./images/webpage.svg" class="img-icon" alt="" />
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
                        <img src="./images/received.svg" class="img-icon" alt="" />
                        <h4 class="active">Sản Phẩm</h4>
                    </div>
                    <div class="sub_menu">
                        <a href="products.jsp">Tất Cả</a>
                        <a href="product-new.jsp">Thêm Sản Phẩm</a>
                        <a href="category.jsp" class="active">Doanh Mục</a>
                    </div>
                </div>
                <div class="menu">
                    <div class="menu_title">
                        <img src="./images/profile.svg" class="img-icon" alt="" />
                        <h4>Người Dùng</h4>
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
                        <img src="./images/box.svg" class="img-icon" alt="" />
                        <h4>Đơn Hàng</h4>
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
        <div class="right">
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
                                src="./images/wallpaperflare.com_wallpaper (1).jpg"
                                alt=""
                        />
                        <div class="current_user-sub-menu">
                            <a href="user-setting.jsp"
                            ><img src="./images/settings.svg" alt="" />Cài đặt</a
                            >
                            <a href="login.jsp"
                            ><img src="./images/logout.svg" alt="" /> Đăng xuất
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end of right topbar -->
            <div id="divsetting">
                <h3>Chỉnh Sửa Doanh Mục</h3>
                <div class="formSetting">

                    <div class="old-name">
                        <label class="lblold">
                            Tên doanh mục cũ
                        </label>
                        <input class="inputold"/>
                    </div>
                    <div class="new-name">
                        <label class="lblold">
                            Tên doanh mục mới
                        </label>
                        <br>
                        <input class="inputold"/>
                    </div>
                    <div class="chooseSetting">
                        <div class="choose">
                            <select class="form-select" aria-label="Default select example">
                                <option selected>Tác Vụ</option>
                                <option value="1">Xóa Vĩnh viễn</option>
                                <option value="2">Chuyển vào thùng rác</option>
                                <option value="3">Đổi tên</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ===***END OF RIGHT***=== -->
</div>
</body>
<%--  <script src="./js/category.js"></script>--%>
<script src="./js/main.js"></script>
</html>
