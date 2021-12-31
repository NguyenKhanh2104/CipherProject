<%@ page import="com.nlu.model.User" %>

<%
  User user =(User) session.getAttribute("auth");
  if (user == null || !user.getRole().equals("admin")){
    response.sendRedirect("/");
  }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html >
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Banner</title>
    <link rel="stylesheet" href="./style/main.css" />
    <style>
      .banner_setting img {
        width: 100%;
      }

      .img-container {
        width: 800px !important;
        position: relative;
      }
      .edit-img {
        background-image: url(./images/edit.svg) no-repeat;
        height: 40px !important;
        margin: 10px;
        cursor: pointer;
        position: absolute !important;
        right: 0 !important;
        top: 0 !important;
      }
      div.edit-img input {
        background: url(./images/edit.svg) no-repeat;
        cursor: pointer;
        width: 200px;
        height: 100px;
        border: none;
      }
    </style>
  </head>
  <body>
    <div class="body_container">
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
            <div class="menu">
              <div class="menu_title">
                <img src="./images/box.svg" class="img-icon" alt="" />
                <h4>Giao Diện</h4>
              </div>
              <div class="sub_menu">
                <a href="banner-setting.jsp">Banner</a>
              </div>
            </div>
          </div>
        </div>
      </div>

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
          <div class="right_content">
            <div class="banner_setting">
              <h1>Banner hiện tại</h1>
              <div class="img-container">
                <img src="../main/images/duybanner.jpg" alt="" />
                <div class="edit-img">
                  <input type="file" name="" value="" />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
