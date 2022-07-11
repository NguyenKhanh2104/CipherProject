<%@ page import="com.nlu.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />

    <title>Sản Phẩm Chi Tiết</title>
    <link
            rel="shortcut icon"
            href="./images/Jordan1-Retro.jpg"
            type="image/x-icon"
    />
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta charset="UTF-8"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/main/css/bootstrap.css"/>
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
<ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="../index.jsp">TRANG CHỦ</a></li>
    <li class="breadcrumb-item"><a href="product.jsp">SẢN PHẨM</a></li>
    <li class="breadcrumb-item active">CHI TIẾT SẢN PHẨM</li>
</ol>
<!-- banner -->
<section class="ab-info-main py-md-5 py-4">
    <div class="container py-md-3">
        <!-- top Products -->
        <div class="row contend">
            <!-- product left -->
            <div class="side-bar col-lg-4">
                <div class="search-bar w3layouts-newsletter">
                    <h3 class="sear-head">TÌM KIẾM</h3>
                    <form action="#" method="post" class="d-flex">
                        <input
                                type="search"
                                placeholder="TÊN SẢN PHẨM"
                                name="search"
                                class="form-control"
                                required=""
                        />
                        <button class="btn1">
                            <span class="fa fa-search" aria-hidden="true"></span>
                        </button>
                    </form>
                </div>
                <!--preference -->
                <div class="left-side my-4">
                    <h3 class="sear-head">NHU CẦU</h3>
                    <ul class="w3layouts-box-list">
                        <li>
                            <input type="checkbox" class="checked"/>
                            <span class="span">CHẠY BỘ</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checked"/>
                            <span class="span">DÃ NGOẠI</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checked"/>
                            <span class="span">ĐI HỌC</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checked"/>
                            <span class="span">ĐI LÀM</span>
                        </li>
                    </ul>
                </div>
                <!-- // preference -->
                <!-- discounts -->
                <div class="left-side">
                    <h3 class="sear-head">KHUYẾN MÃI</h3>
                    <ul class="w3layouts-box-list">
                        <li>
                            <input type="checkbox" class="checked"/>
                            <span class="span"><=5%/Sản Phẩm</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checked"/>
                            <span class="span"><=10%/Sản Phẩm</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checked"/>
                            <span class="span"><=15%/Sản Phẩm</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checked"/>
                            <span class="span"><=20%/Sản Phẩm</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checked"/>
                            <span class="span"><=30%/Sản Phẩm</span>
                        </li>
                    </ul>
                </div>
                <!-- //discounts -->
                <div class="left-side">
                    <h3 class="sear-head">TÌM THEO GIÁ</h3>
                    <ul class="w3layouts-box-list">
                        <li>
                            <input type="checkbox" class="checked"/>
                            <span class="span"><=$50</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checked"/>
                            <span class="span"><=$100</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checked"/>
                            <span class="span"><=$150</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checked"/>
                            <span class="span"><=$200</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checked"/>
                            <span class="span"><=$250</span>
                        </li>
                        <li>
                            <input type="checkbox" class="checked"/>
                            <span class="span">>$250></span>
                        </li>
                    </ul>
                </div>
                <!-- //deals -->
            </div>
            <!-- //product left -->
            <!-- product right -->
            <div class="left-ads-display col-lg-8">
                <div class="row" style=" justify-content: space-around">

                    <div class="desc1-left col-md-6">

                        <img
                                src="${product.img}"
                                class="img-fluid"
                                alt="anh san pham"
                        />

                    </div>

                    <%--                    class="details"--%>
                    <form action="/cart/add" method="post">
                        <h4 class="product_name">${product.name}</h4>
                        <h2 class="size_title">Size :</h2>
                        <div class="product_size-container"
                             style="display: flex; background-color:indianred; justify-content: space-around">
                            <c:forEach items="${details}" var="item">
                                <div class="product_size">
                                    <label>${item.size}</label>
                                    <input name="details_id" class="details_id" value="${item.productDetailsId}"
                                           type="checkbox">
                                </div>
                            </c:forEach>
                        </div>

                        <div class="total">
                            <div class="total_title" style="margin: 1rem 0">
                                <strong>Giá :</strong>

                                <span> ${product.price}</span>
                                <span>đ</span>
                            </div>
                        </div>
                        <div class="total" style="font-size: 23px !important">
                            <strong>Tổng cộng :</strong>
                            <span class="total-value" style="color: green; margin-left: 10px">100000</span>
                            <span style="color: green"> đ</span>
                        </div>
                        <!-- <hr /> -->


                        <div class="button-product">

                            <%
                                User auth = (User) session.getAttribute("auth");
                                request.setAttribute("auth", auth);
                            %>
                            <c:if test="${auth == null}">
                                <button onclick="addCart()" class="buttons buttons-cart btn-add">
                                    <a href="/main/login.jsp"> Thêm vào giỏ</a>
                                </button>
                            </c:if>
                            <c:if test="${auth != null}">
                                <button type="submit" class="buttons buttons-cart btn-add">
                                    Thêm vào giỏ
                                </button>
                            </c:if>
                            <a href="cart.jsp">
                                <button class="buttons buttons-carts" type="button">
                                    <a href="/main/cart.jsp">Xem Giỏ Hàng</a>
                                </button>
                            </a>
                        </div>
                        <div class="describle">
                            <div class="describle_title">
                                <h5 class="titleofdes">MÔ TẢ</h5>
                            </div>
                            <div class="contendes">
                                <p class="contendofdes">
                                    ${product.description}
                                </p>
                            </div>
                        </div>
                    </form>

                </div>
                <h3 class="shop-sing">SẢN PHẨM LIÊN QUAN</h3>
                <div class="row m-0">
                    <div class="col-md-4 product-men">
                        <div class="product-shoe-info shoe text-center">
                            <div class="men-thumb-item">
                                <img
                                        src="/images/adidas Yeezy Boost 350 V2 Semi Frozen Yellow.jpg"
                                        class="img-fluid"
                                        alt="fdfafsad"
                                />
                            </div>
                            <div class="item-info-product">
                                <h4>
                                    <a href="product-single.jsp">Nike Free X Metcon2</a>
                                </h4>

                                <div class="product_price">
                                    <div class="grid-price">
                                        <span class="money">$675.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 product-men">
                        <div class="product-shoe-info shoe text-center">
                            <div class="men-thumb-item">
                                <img
                                        src="/images/adidas Yeezy Boost 350 V2 Desert Sage.jpg"
                                        class="img-fluid"
                                        alt="dfafadfdsa"
                                />
                            </div>
                            <div class="item-info-product">
                                <h4>
                                    <a href="product-single.jsp">Nile Drunk Low</a>
                                </h4>

                                <div class="product_price">
                                    <div class="grid-price">
                                        <span class="money">$575.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- //contact -->
<!-- footer -->
<jsp:include page="/main/footer.jsp"/>
<!-- //footer -->
<script src="main/script/main.js"></script>
<script>
    const size = Array.from(document.getElementsByClassName("size"));
    size.forEach(changeColor);

    const defaultOpacity = (el) => {
        el.style.opacity = "0.5";
    };

    function changeColor(el) {
        el.addEventListener("click", () => {
            size.forEach(defaultOpacity);
            if ((el.style.opacity = "0.5")) {
                el.style.opacity = 1;
            } else if ((el.style.opacity = "1")) {
                el.style.opacity = 0.5;
            }
        });
    }

    const amountValue = document.querySelector(".product_amount-value");
    const totalValue = document
        .querySelector(".total-value")
        .textContent.split(".")
        .join("");
    let value = Number(amountValue.textContent);
    document.querySelector(".up").addEventListener("click", () => {
        value++;
        amountValue.textContent = value;
    });
    document.querySelector(".down").addEventListener("click", () => {
        value--;
        if (value >= 1) {
            amountValue.textContent = value;
        } else {
            value = 1;
        }
    });

    document.querySelector(".btn-add").addEventListener("click", () => {
        alert("Sản phẩm đã được thêm vào giỏ hàng");
    });
</script>
<script>
    function addCart() {
        alert("Vui lòng đăng nhập \nđể thêm sản phẩm vào giỏ hàng");
    }
</script>
</body>
</html>
