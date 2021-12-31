<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
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
            /* background-color: #2143a0; */
            background: url("./images/Jordan1-Retro.jpg");
            background-position: center;
            /* background-repeat: no-repeat; */
        }
    </style>
</head>
<body>
<%
    String success = (String) request.getAttribute("register-success");
    request.setAttribute("success", success);
%>

<form action="/register" method="post" accept-charset="UTF-8">
    <div class="container">

        <h1>
            <%=
            request.getAttribute("register-success") == null ? "Đăng kí thành viên" : "Đăng kí thành công"
            %>
        </h1>
        <c:if test="${success.length() > 0}">
            <h1>
                <a href="/main/login.jsp">Dăng Nhập</a>
            </h1>
        </c:if>
        <span>
            <%=
            request.getAttribute("mess") == null ? "" : request.getAttribute("mess")
            %>
        </span>
<c:if test="${success.length() == null}">
        <input
                value="<%=
                    request.getParameter("username") == null ? "": request.getParameter("username")

                %>"
                type="text"
                placeholder="Tên người dùng"
                name="username"
                id="username"
                required
        />

        <input
                value="<%=
                    request.getParameter("email") == null ? "": request.getParameter("email")

                %>"
                type="text"
                placeholder="Email"
                name="email"
                id="email"
                required
        />
        <input
                value="<%=
                    request.getParameter("phone") == null ? "": request.getParameter("phone")

                %>"
                type="text"
                placeholder="Diện thoại"
                name="phone"
                id="phone"
                required
        />
        <input
                value="<%=
                    request.getParameter("city") == null ? "": request.getParameter("city")

                %>"
                type="text" name="city" placeholder="Thành Phố"/>
        <input
                value="<%=
                    request.getParameter("district") == null ? "": request.getParameter("district")

                %>"
                type="text" name="district" placeholder="Quận/Huyện"/>
        <input type="text" name="address-details" placeholder="Địa chỉ chi tiết"/>
        <input
                type="password"
                placeholder="Mật khẩu"
                name="password"
                id="psw"
                required
        />

        <input
                type="password"
                placeholder="Xác nhận mật khẩu"
                name="confirm-password"
                id="psw-repeat"
                required
        />
        <hr/>
        <a href="/">Quay lại trang chủ</a>
        <button type="submit" class="registerbtn">Đăng kí</button>
</c:if>

    </div>
</form>
</body>
</html>
