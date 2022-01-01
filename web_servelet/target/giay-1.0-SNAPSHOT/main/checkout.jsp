<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.nlu.model.Cart" %>
<%@ page import="com.nlu.model.CartItem" %>
<%@ page import="java.util.Collection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"  %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>

<html>
<head>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <title>Thanh Toán</title>
    <link
            rel="shortcut icon"
            href="./images/Jordan1-Retro.jpg"
            type="image/x-icon"
    />
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Custom-Files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/main/css/bootstrap.css"/>
    <!-- Bootstrap-Core-CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/main/css/style.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta charset="UTF-8">
    <style>
        .submit-now {
            margin-top: 20px;
            font-size: 16px;
            width: 200px;
            height: 50px;
            background-color: #e74c3c;
            border-color: transparent
        }

        .form-control.input {
            border: 0;
            background: 0 0;
            border-bottom: 1px solid silver;
            border-radius: 0 !important
        }

        .getintouch {
            height: auto;
            background-size: cover;
            background-repeat: no-repeat
        }

        input[type=email], input[type=tel], input[type=text], textarea {
            border-radius: 8px !important
        }

        .btn-primary:hover {
            color: #fff;
            background-color: #4daade;
            border-color: #4daade;
            box-shadow: 0 10px 15px rgba(157, 157, 157, .4)
        }

        .btn-primary:not(:disabled):not(.disabled).active, .btn-primary:not(:disabled):not(.disabled):active, .show > .btn-primary.dropdown-toggle {
            color: #fff;
            background-color: #4daade;
            border-color: #4daade
        }

        .modern-form {
            padding-top: 80px;
            padding-bottom: 80px
        }

        .modern-form__hr {
            border-color: #4daade;
            border-width: 2px;
            width: 121px
        }

        .modern-form__form-container {
            padding-top: 100px
        }

        .modern-form__form-group--padding-r {
            padding-right: 20px
        }

        .modern-form__form-group--padding-t {
            padding-top: 50px
        }

        .modern-form__form-control--textarea {
            height: 95px !important;
            resize: none
        }
    </style>
</head>

<body>
<div>
    <!-- Start: Header -->
    <div class="header-blue" style="height: 15vh;">
        <jsp:include page="/main/menu.jsp"/>
    </div>
    <!-- End: Header -->
</div>


<ol class="breadcrumb">
    <li class="breadcrumb-item">
        <a href="../index.jsp">THANH TOÁN</a>
    </li>
    <li class="breadcrumb-item"><a href="product.jsp">SẢN PHẨM</a></li>
    <li class="breadcrumb-item">
        <a href="product-single.jsp">CHI TIẾT SẢN PHẨM</a>
    </li>
    <li class="breadcrumb-item"><a href="cart.jsp">GIỎ HÀNG</a></li>
    <li class="breadcrumb-item active">THANH TOÁN</li>
</ol>
<section class="ab-info-main py-5">
    <div class="container" style="display: flex">
        <!-- Start: Modern Contact Form -->
        <section style="flex: 6" class="getintouch">
            <div class="container modern-form">
                <div class="text-center">
                    <h4 style="color: #212529; font-size: 45px; height: 0px">
                        Thông tin khách hàng
                    </h4>
                </div>
                <hr class="modern-form__hr"/>
                <div
                        class="modern-form__form-container"
                        style="width: 100%; height: 603px"
                >
                    <form method="post" action="/checkout" accept-charset="UTF-8">
                        <div class="form-row">
                            <div class="col col-contact">
                                <div class="form-group modern-form__form-group--padding-r">
                                    <input
                                            name="fullName"
                                            class="form-control input input-tr"
                                            type="text"
                                            placeholder="Họ Tên"
                                    />
                                    <div class="line-box">
                                        <div class="line"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col col-contact">
                                <div class="form-group modern-form__form-group--padding-l">
                                    <input
                                            name="email"
                                            class="form-control input input-tr"
                                            type="text"
                                            placeholder="Email"
                                    />
                                    <div class="line-box">
                                        <div class="line"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col col-contact">
                                <div class="form-group modern-form__form-group--padding-r">
                                    <input
                                            name="phone"
                                            class="form-control input input-tr"
                                            type="text"
                                            placeholder="Số Điện Thoại"
                                    />
                                    <div class="line-box">
                                        <div class="line"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col col-contact">
                                <div class="form-group modern-form__form-group--padding-r">
                                    <input
                                            name="city"
                                            class="form-control input input-tr"
                                            type="text"
                                            placeholder="Thành Phố"
                                    />
                                    <div class="line-box">
                                        <div class="line"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col col-contact">
                                <div class="form-group modern-form__form-group--padding-r">
                                    <input
                                            name="address"
                                            class="form-control input input-tr"
                                            type="text"
                                            placeholder="ĐỊa chỉ giao hàng"
                                    />
                                    <div class="line-box">
                                        <div class="line"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col">
                                <div class="form-group modern-form__form-group--padding-t">
                  <textarea
                          class="form-control input modern-form__form-control--textarea"
                          name="note"
                          placeholder="Ghi Chú"
                  >

                  </textarea>
                                    <div class="line-box">
                                        <div class="line"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col text-center">
                                <button class="btn btn-primary submit-now" type="submit">
                                    Đặt Hàng
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <!-- End: Modern Contact Form -->
        <%
            Cart cart = Cart.getCart(session);
            Collection<CartItem> data = cart.getData();
            request.setAttribute("data", data);
        %>
        <div style="flex: 4" class="">
            <h3 class="titleOrder">ĐƠN HÀNG CỦA BẠN</h3>
            <table class="tableOrder">
                <tr>
                    <th>Sản Phẩm</th>
                    <th>Size</th>
                    <th>Số lượng</th>
                    <th>Tạm Tính</th>
                </tr>
                <tbody>

                <c:forEach items="${data}" var="item">
                    <tr>
                        <td>${item.name}</td>
                        <td>${item.size}đ</td>
                        <td>${item.quality}</td>

                        <td>
                            <fmt:formatNumber maxFractionDigits="0" type="number"   value="${item.price * item.quality}"/>
                            vnd
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <td>Tổng Cộng</td>
                <td></td>
                <td colspan="2">
                    <fmt:formatNumber maxFractionDigits="0" type="number"   value="${cart.total()}"/>
                    vnd
                </td>
                </tfoot>
            </table>
            <div class="payments">
                <input checked type="checkbox" id="radio2" class="payShip"/> Trả bằng tiền
                mặt
                <p class="usePayShip">
                    Trả bằng tiền mặt khi nhận hàng thông qua đường bưu điện hoặc giao
                    hàng nhanh
                </p>
            </div>
            <button class="orderProduct">Đặt Hàng</button>
        </div>
    </div>
</section>

<jsp:include page="/main/footer.jsp"/>
<script src="${pageContext.request.contextPath}/src/main/webapp/main/script/main.js"></script>
</body>
</html>
