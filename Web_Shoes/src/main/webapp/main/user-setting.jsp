<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../styleAdmin/style.css">
    <link rel="stylesheet" type="text/css" href="../assets/extra-libs/multicheck/multicheck.css">
    <link href="../assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
    <link href="../dist/css/style.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng Kí</title>
    <style>
      * {
        box-sizing: border-box;
      }

      .container {
        padding: 16px;
        background-color: #fff;
        z-index: 9999;
      }
      .container h1 {
        text-align: center;
        color: #047000;
      }
      form .container {
        width: 500px;
        margin: auto;
        border: 1px solid #9b9b9b;
        box-shadow: 0px 0px 10px 1px #c0c0c0;
        margin-top: 2rem;
      }
      input {
        border: 1px solid #dcdfe6;
      }
      input[type="text"],
      input[type="password"] {
        width: 100%;
        padding: 15px;
        margin: 5px 0 22px 0;
        display: inline-block;
      }

      input[type="text"]:focus,
      input[type="password"]:focus {
        outline: none;
      }

      hr {
        border: 1px solid #f1f1f1;
        margin-bottom: 25px;
      }

      .registerbtn,
      .btn-cancel {
        background-color: #047000;
        color: white;
        padding: 16px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
        opacity: 0.9;
        font-size: 0.8rem;
      }

      .registerbtn:hover,
      .btn-cancel {
        opacity: 1;
      }
      .btn-cancel {
        background-color: #ffaa5b;
      }
      .btn-cancel a {
        color: white;
        font-size: 0.75rem;
      }
      label b {
        font-weight: 600 !important;
        color: #343a40;
      }
      a {
        color: rgb(78, 110, 255);
      }

      .signin {
        background-color: #f1f1f1;
        text-align: center;
      }
      body {
        background: url("./images/kbanner2.jpg");
        background-position: center;
      }
    </style>
  </head>
  <body>
    <form action="">
      <div class="container">
        <h1>Sửa thông tin</h1>
        <input
          type="text"
          placeholder="Tên người dùng"
          name="username"
          id="username"
          required
        />

        <input
          type="text"
          placeholder="Email"
          name="email"
          id="email"
          required
        />
        <input
          type="text"
          placeholder="Diện thoại"
          name="phone"
          id="phone"
          required
        />
        <input type="text" name="address" placeholder="Địa chí" />
        <input
          type="password"
          placeholder="Mật khẩu"
          name="psw"
          id="psw"
          required
        />

        <input
          type="password"
          placeholder="Xác nhận mật khẩu"
          name="psw-repeat"
          id="psw-repeat"
          required
        />
        <hr />
        <button type="submit" class="registerbtn">Cập nhật</button>
        <a href="../index.jsp">Quay lại trang chủ</a>
      </div>
    </form>
  </body>
</html>
