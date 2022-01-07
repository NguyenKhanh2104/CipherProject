
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
    <title>Đăng nhập</title>
    <style>
      .container {
        width: 400px;
        margin: auto;
        text-align: start;
      }
      .form-container {
        background-color: aliceblue;
        margin: auto;
        padding: 2rem;
        margin-top: 5rem;
        box-shadow: 0px 0px 10px 5px #c9c9c9;
      }
      input {
        border: 1px solid #c9c9c9;
        width: 100%;
        height: 2rem;
        outline: none;
        margin: 1rem 0;
      }
      input[type="button"] {
        background-color: #08a05c;
        color: white;
        height: 2rem;
      }
      body {
        background-color: #e0e0e0;
      }
      .form-control button {
        border: 1px solid transparent;
        background-color: green;
        outline: none;
        padding: 0.75rem 1rem;
      }
      .form-container button a {
        text-decoration: none;
        color: white;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="form-container">
        <div style="text-align: center">
          <h2 style="color: green; letter-spacing: 5px; font-size: 40px">
            <a
              style="text-decoration: none; color: green"
              href="../index.jsp"
              >SKED</a
            >
          </h2>
          <h4 style="letter-spacing: 1px; font-weight: 400">
            Đăng nhập quản lí
          </h4>
        </div>
        <form action="">
          <div class="form-control">
            <input
              type="text"
              name="username"
              id="username"
              required
              placeholder="Tên đăng nhập"
            />
          </div>
          <div class="form-control">
            <input
              type="password"
              name="password"
              id="password"
              required
              placeholder="Mật khẩu"
            />
          </div>
          <div class="form-control">
            <!-- <input style="cursor: pointer" type="button" value="Đăng nhập" /> -->
            <button>
              <a href="dashboard.jsp">Đăng nhập</a>
            </button>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>
