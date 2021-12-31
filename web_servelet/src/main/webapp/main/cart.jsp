<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.nlu.model.Cart" %>
<%@ page import="com.nlu.model.CartItem" %>
<%@ page import="java.util.Collection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>

    <title>Giỏ hàng</title>
    <link
            rel="shortcut icon"
            href="./images/Jordan1-Retro.jpg"
            type="image/x-icon"
    />
    <meta charset="UTF-8"/>

    <!-- Custom-Files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/main/css/bootstrap.css"/>
    <!-- Bootstrap-Core-CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/main/css/style.css" type="text/css" media="all"/>
    <link href="${pageContext.request.contextPath}/main/css/font-awesome.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>
<div>
    <!-- Start: Header -->
    <div class="header-blue" style="height: 15vh;">
        <jsp:include page="/main/menu.jsp"/>
    </div>
    <!-- End: Header -->
</div>
<%--products--%>
<ol class="breadcrumb">
    <li class="breadcrumb-item">
        <a href="../index.jsp">TRANG CHỦ</a>
    </li>
    <li class="breadcrumb-item"><a href="product.jsp">SẢN PHẨM</a></li>
    <li class="breadcrumb-item">
        <a href="product-single.jsp">CHI TIẾT</a>
    </li>
    <li class="breadcrumb-item active">GIỎ HÀNG</li>
</ol>

<section class="ab-info-main py-5">
    <div class="container py-3">
        <table class="table_cart">
            <thead>
            <th>Hình Ảnh</th>
            <th>Tên Sản Phẩm</th>
            <th>Đơn Giá</th>
            <th>Số Lượng</th>
            <th>Size</th>
            <th>Tổng Tiền</th>
            <th>Thao Tác</th>
            </thead>
            <%
                Cart cart = (Cart) Cart.getCart(session);
                Collection<CartItem> data = cart.getData();
                request.setAttribute("data", data);
            %>
            <tbody>
            <c:forEach items="${data}" var="item">
                <tr>
                    <td class="table-image">
                        <div class="table-imagediv">
                            <img
                                    src="${item.img}"
                                    class="img-jordan"
                                    alt="anh"
                            />
                        </div>
                    </td>
                    <td>${item.name}</td>
                    <td>${item.price}</td>
                    <td>
                        <button class="custom_btn"><a href="/cart?id=${item.productDetailsId}&quality=-1">-</a></button>
                        <span>${item.quality}</span>
                        id:
                        <span>${item.productDetailsId}</span>
                        <button class="custom_btn"><a href="/cart?id=${item.productDetailsId}&quality=1">+</a></button>
                    </td>
                    <td>${item.size}</td>
                    <td>
                        <fmt:formatNumber maxFractionDigits="0" type="number" value="${item.price * item.quality}"/> vnd
                    </td>
                    <td class="delete">
                        <a href="/cart/remove?id=${item.productDetailsId}">
                            <i style="transform: scale(2)" class="fa fa-trash" aria-hidden="true"></i>
                        </a>
                    </td>

                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            <tr>
                <td class="title-total">Tổng Cộng</td>
                <td></td>
                <td></td>
                <td>${cart.count()}</td>
                <td></td>
                <td>
                    <fmt:formatNumber maxFractionDigits="0" type="number" value="${cart.total()}"/> vnd
<%--                ${cart.total()}--%>
                </td>
                <td class="buy">
                    <a href="#">
                        <button class="btnhuy">Hủy</button>
                    </a>
                    <a href="/main/checkout.jsp"
                    >
                        <button class="btnbuy">Thanh Toán</button>
                    </a
                    >
                </td>
            </tr>
            </tfoot>
        </table>
    </div>
</section>
<jsp:include page="/main/footer.jsp"/>
<script src="./script/main.js"></script>
</body>
</html>
