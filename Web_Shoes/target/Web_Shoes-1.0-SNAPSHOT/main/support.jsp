<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<html>

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>

    <title>Tất Cả Sản Phẩm</title>
    <link rel="shortcut icon" href="/main/images/Jordan1-Retro.jpg" type="image/x-icon"/>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta charset="UTF-8"/>
    <meta name="keywords"
          content="Bootie Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"/>
    <!-- //Meta tag Keywords -->
    <link rel="stylesheet" href="/main/css/menu.css">

    <!-- Custom-Files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/main/css/bootstrap.css"/>
    <!-- Bootstrap-Core-CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/main/css/style.css" type="text/css" media="all"/>
    <!-- Style-CSS -->
    <!-- font-awesome-icons -->
    <link href="${pageContext.request.contextPath}/main/css/font-awesome.css" rel="stylesheet"/>
    <!-- //font-awesome-icons -->
    <!-- /Fonts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="main/css/design.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
    body{
        background-color: #f5f6fa;
    }
    .main-container {
        width: 100%;
        min-height: 100vh;
    }

    .side-bar {
        background-color: #dcdde1;
    }
    .search-bar{
        padding: 1rem 0;
    }
    .product-shoe-info{
        background-color: white;
        margin-bottom: 20px;
        position: relative;
    }
    .product-shoe-info:hover{
        box-shadow: 4px 6px 3px 0px rgba(127,143,166,0.75);
    }
    .discount-tag{
        position: absolute;
        top: 0;
        right: 0;
        margin: 20px;
        animation: big-big 1s ease-in-out 1s infinite alternate;
        /*transition: .2s ease-in-out;*/
    }

    .discount-tag span{
        font-size: 18px;
        color : red;
    }
    .fa-tags{
        color : red;
    }
    @keyframes big-big {
        from {
            transform: scale(1);
        }
        to {
            transform: scale(1.5);
        }
    }
     .linkInstall {
         border: 1px solid red;
         height: max-content;
         width: max-content;
         font-size: 32px;
         margin: auto;
     }
</style>
<body>
<div>
    <!-- Start: Header -->
    <div class="header-blue" style="height: 15vh;">
        <jsp:include page="/main/menu.jsp"/>
    </div>
    <!-- End: Header -->
</div>

<%--products--%>
<section class="ab-info-main py-md-5 py-4">
    <div class="container">
        <div class="linkInstall">
            <span class="content"> Tải link ứng dụng mã hoá chữ ký tại đây :  <a href="Filedownload?filename=check2.exe">Download</a></span>
        </div>
    </div>


</section>


<jsp:include page="/main/footer.jsp"/>
<script src="/main/script/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/js/bootstrap.bundle.min.js"></script>
</body>

</html>