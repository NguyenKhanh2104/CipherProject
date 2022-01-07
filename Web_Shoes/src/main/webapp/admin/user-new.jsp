
<%@ page import="com.nlu.model.User" %>

<%
  User user =(User) session.getAttribute("auth");
  if (user == null || !user.getRole().equals("admin")){
    response.sendRedirect("/");
  }
%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html >
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Thêm người dùng</title>
    <link rel="shortcut icon" href="./images/webpage.svg" type="image/x-icon" />
    <link rel="stylesheet" href="./style/main.css" />
    <link rel="stylesheet" href="./style/user-new.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script>
  </head>
  <body>
    <div class="body_container">
      <!-- ===***LEFT***=== -->
   <jsp:include page="sidebar.jsp"/>
      <!-- ===***END OF LEFT***=== -->

      <!-- ===***RIGHT***=== -->
      <div class="right_wrapper">
        <div class="right">
          <jsp:include page="top-bar.jsp"/>
          <!-- end of right topbar -->
          <div class="right_content">
            <h3 style="font-weight: 400">Thêm Người Dùng</h3>
            <small style="font-weight: 100; font-style: italic"
              >Tạo người dùng mới và thêm vào trang</small
            >
            <form method="post" action="/admin/new-admin" class="new_user">
              <table style="width: 100%">
                <tr>
                  <span>jkssdjsdkjdsh</span>
                  <th>
                    Tên người dùng
                    <small style="font-weight: 100; font-style: italic"
                      >(bắt buộc)</small
                    >
                  </th>
                  <td><input type="text" id="username" name="username" required /></td>
                </tr>
                <tr>
                  <span>jkssdjsdkjdsh</span>
                  <th>
                    Email
                    <small style="font-weight: 100; font-style: italic"
                      >(bắt buộc)</small
                    >
                  </th>
                  <td><input type="email" name="email" id="email" /></td>
                </tr>
                <tr>
                  <th>
                    Mật khẩu
                    <small style="font-weight: 100; font-style: italic"
                      >(bắt buộc)</small
                    >
                  </th>
                  <td>
                    <input type="password" name="password" id="password" />
                  </td>
                </tr>
                <tr>
                  <th>
                    Xác Nhận Mật khẩu
                    <small style="font-weight: 100; font-style: italic"
                      >(bắt buộc)</small
                    >
                  </th>
                  <td>
                    <input type="password" name="confirm-password" id="confirm-password" />
                  </td>
                </tr>


              </table>
              <button type="submit">Thêm</button>
            </form>
          </div>
        </div>
      </div>
      <!-- ===***END OF RIGHT***=== -->
    </div>
  </body>
  <script></script>
  <script src="./js/main.js"></script>
</html>
