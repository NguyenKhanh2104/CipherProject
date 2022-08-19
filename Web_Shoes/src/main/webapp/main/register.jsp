<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
            width: 570px;
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

<form action="/register" method="post" accept-charset="UTF-8" onsubmit="return ValidateForm()">
    <div class="container">

        <h1>
            <%=
            request.getAttribute("register-success") == null ? "Đăng kí thành viên" : "Đăng kí thành công"
            %>
        </h1>
        <c:if test="${success.length() > 0}">
            <h1>
                 <span>
            <%=
            request.getAttribute("mess") == null ? "" : request.getAttribute("mess")
            %>
        </span>

            </h1>
            <h2 class="text-danger" style="word-wrap:break-word;text-align: center">Vui lòng lưu lại nội dung bên dưới
                để xác nhận khi mua hàng </h2>
            <div class="border border-success">

                <h5 id="inputCopy" style="width: 100%;word-wrap: break-word;
    height: fit-content;"> <%=request.getAttribute("messPri") == null ? "" : request.getAttribute("messPri")%>
                </h5>
<%--                <button type="button" id="btnCopy" style="float: right" onclick="copy"--%>
<%--                        class="btn btn-primary">Copy--%>
<%--                </button>--%>
            </div>
            <div style="display: flex;justify-content: space-between">
                <a style="color: rgb(78, 110, 255);font-size: 30px;margin-top: 10px;margin-left: 50px"
                   href="/main/login.jsp">Đăng Nhập</a>

            </div>
        </c:if>
        <c:if test="${success.length() == null}">
            <div class="form-group">
            <input
                    value="<%=
                    request.getParameter("username") == null ? "": request.getParameter("username")

                %>"
                    type="text"
                    placeholder="Tên người dùng"
                    name="username"
                    id="username"

            />
            <label id="eruser" style="color: red">
                <%=request.getAttribute("mess") == null ? "" : request.getAttribute("mess")%>
            </label>
            </div>

            <input
                    value="<%=
                    request.getParameter("email") == null ? "": request.getParameter("email")

                %>"
                    type="text"
                    placeholder="Email"
                    name="email"
                    id="email"
                    onclick="checkEmail()"

            />
            <label id="eremail" style="color: red">
                <%=request.getAttribute("mess") == null ? "" : request.getAttribute("mess")%>
            </label>

            <input
                    value="<%=
                    request.getParameter("phone") == null ? "": request.getParameter("phone")

                %>"
                    type="text"
                    placeholder="Điện thoại"
                    name="phone"
                    id="phone"

            />
            <label id="erphone" style="color: red"></label>
            <input
                    value="<%=
                    request.getParameter("city") == null ? "": request.getParameter("city")

                %>"
                   id="city"  type="text" name="city" placeholder="Tỉnh/Thành Phố"/>
            <label id="ercity" style="color: red"></label>
            <input
                    value="<%=
                    request.getParameter("district") == null ? "": request.getParameter("district")

                %>"
                    type="text" name="district" id="district" placeholder="Quận/Huyện"/>
            <label id="erdistrict" style="color: red"></label>
            <input type="text" name="address-details" placeholder="Địa chỉ chi tiết" id="address"/>
            <label id="eraddress" style="color: red"></label>
            <input
                    type="password"
                    placeholder="Mật khẩu"
                    name="password"
                    id="psw"

            />
            <label id="erpsw" style="color: red"></label>
            <input
                    type="password"
                    placeholder="Xác nhận mật khẩu"
                    name="confirm-password"
                    id="psw-repeat"

            />
            <label id="erconfirm" style="color: red"></label>
            <hr/>
            <a href="/">Quay lại trang chủ</a>
            <button type="submit" class="registerbtn">Đăng kí</button>
        </c:if>

    </div>
</form>
<script type="text/javascript">
    var button = document.getElementById("btnCopy"),
        input = document.getElementById("inputCopy");


    button.addEventListener("click", function (event) {
        event.preventDefault();
        input.select();
        document.execCommand("copy");

    });

</script>
<script>
    function ValidateForm(){
        var username = document.getElementById("username").value;
        var email = document.getElementById("email").value;
        var phone = document.getElementById("phone").value;
        var distric = document.getElementById("district").value;
        var city = document.getElementById("city").value;
        var psw = document.getElementById("psw").value;
        var confirm = document.getElementById("psw-repeat").value;
        var address = document.getElementById("address").value;
        var erusername = document.getElementById("eruser");
        var eremail = document.getElementById("eremail");
        var erphone = document.getElementById("erphone");
        var erdistric = document.getElementById("erdistrict");
        var ercity = document.getElementById("ercity");
        var erpsw = document.getElementById("erpsw");
        var erconfirm = document.getElementById("erconfirm");
        var eraddress = document.getElementById("eraddress");
        var regex = /^\w+@[a-zA-Z]{3,}\.com$/i ;
        var regexphone = /^\d{3}[-\s]?\d{3}[-\s]?\d{4}$/;

        if (username == "" || username == null){
            erusername.innerHTML = '<label style="color: red">Họ và tên không thể bỏ trống </label>';
            erphone.innerHTML = '<label style="color: red"></label>';
            ercity.innerHTML = '<label style="color: red"></label>';
            return  false;
        }else{
            erusername.innerHTML = '<label style="color: red"></label>';

        }

        if (email == "" || email == null){
            eremail.innerHTML = '<label style="color: red">Email không thể bỏ trống </label>';
            return  false;


        } else{
            eremail.innerHTML = '<label style="color: red"></label>';
        }
        if (regex.test(email)){
            eremail.innerHTML = '<label style="color: red"></label>';
        }else {
            eremail.innerHTML = '<label style="color: red">Email Sai định dạng </label>';
            return false;
        }
        if (phone == "" || phone == null){
            erphone.innerHTML = '<label style="color: red">Số điện thoại không thể bỏ trống </label>';
            return  false;
        }else{
            erphone.innerHTML = '<label style="color: red"></label>';
        }
        if (regexphone.test(phone)){
            erphone.innerHTML = '<label style="color: red"></label>';
        }else {
            erphone.innerHTML = '<label style="color: red">Số điện thoại sai định dạng</label>';
            return false;
        }
        if (city == ""|| city == null){
            ercity.innerHTML = '<label style="color: red">Địa chỉ không thể bỏ trống </label>';
            return  false;
        }else{
            ercity.innerHTML = '<label style="color: red"></label>';

        }
        if (distric == ""|| distric == null){
            erdistric.innerHTML = '<label style="color: red">Địa chỉ không thể bỏ trống </label>';
            return  false;
        }else{
            erdistric.innerHTML = '<label style="color: red"></label>';

        }
        if (address == ""|| address == null){
            eraddress.innerHTML = '<label style="color: red">Địa chỉ không thể bỏ trống </label>';
            return  false;
        }else{
            eraddress.innerHTML = '<label style="color: red"></label>';

        }
        if (psw == ""|| psw == null ){
            erpsw.innerHTML = '<label style="color: red">Mật khẩu không thể bỏ trống </label>';
            return  false;
        }else{
            erpsw.innerHTML = '<label style="color: red"></label>';
        }
        if (psw.length() <= 8){
            erpsw.innerHTML = '<label style="color: red">Mật khẩu không thể dưới 8 ký tự </label>';
            return  false;
        }else {
            erpsw.innerHTML = '<label style="color: red"></label>';
        }


        if (confirm == "" || confirm == null){
            erconfirm.innerHTML = '<label style="color: red">Xác nhận mật khẩu không thể bỏ trống </label>';
            return  false;
        } else{
            erconfirm.innerHTML = '<label style="color: red"></label>';
        }
        if (psw != confirm){
            erconfirm.innerHTML = '<label style="color: red">Xác nhận mật khẩu không đúng </label>';
            return  false;
        } else{
            erconfirm.innerHTML = '<label style="color: red"></label>';
        }

    }




</script>

</body>
</html>
