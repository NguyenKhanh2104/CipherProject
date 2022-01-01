<%@ page import="com.nlu.service.ProductService" %>
<%@ page import="com.nlu.model.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Trang Chủ</title>
    <link
            rel="shortcut icon"
            href="main/images/Jordan1-Retro.jpg"
            type="image/x-icon"
    />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta charset="UTF-8"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/main/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/main/css/style.css" type="text/css" media="all"/>
    <link href="main/css/font-awesome.css" rel="stylesheet"/>
    <!--  -->
    <link
            rel="stylesheet"
            href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>

<!-- Start: Header Blue -->
<div>
    <!-- Start: Header -->
    <div class="header-blue" style="height: 696px;">
        <jsp:include page="/main/menu.jsp"/>
        <div class="container hero">
            <div class="row">
                <!-- Start: Text -->
                <div class="col-12 col-lg-6 col-xl-6 offset-xl-1" style="margin-left: -15px;margin-top: 0px;">
                    <h1 style="margin-top: 90px;font-size: 35px;">Sneaker chính hãng nhập khẩu Mỹ</h1>
                    <p>Mauris egestas tellus non ex condimentum, ac ullamcorper sapien dictum. Nam consequat neque quis
                        sapien viverra convallis. In non tempus lorem. </p>
                    <button class="btn btn-light btn-lg action-button" type="button">Mua Ngay</button>
                </div><!-- End: Text -->
                <div class="col-md-5 col-lg-5 offset-lg-1 offset-xl-0 d-none d-lg-block phone-holder"><img
                        src="/main/images/nikelazerbanner.jpg" style="width: 570px;height: 100%;"></div>
            </div>
        </div>
    </div>
    <!-- End: Header -->
</div>
<section class="about py-md-5 py-5">
    <div class="container-fluid">
        <div class="feature-grids row px-3">
            <div class="col-lg-3 gd-bottom">
                <div class="bottom-gd row">
                    <div class="icon-gd col-md-3 text-center">
                        <span class="fa fa-truck" aria-hidden="true"></span>
                    </div>
                    <div class="icon-gd-info col-md-9">
                        <h3 class="mb-2">MIỄN PHÍ VẬN CHUYỂN</h3>
                        <h6>HÓA ĐƠN TRÊN $100</h6>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 gd-bottom">
                <div class="bottom-gd row bottom-gd2-active">
                    <div class="icon-gd col-md-3 text-center">
                        <span class="fa fa-bullhorn" aria-hidden="true"></span>
                    </div>
                    <div class="icon-gd-info col-md-9">
                        <h3 class="mb-2">MIỄN PHÍ ĐỔI HÀNG</h3>
                        <h6>TRONG VÒNG 30 NGÀY</h6>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 gd-bottom">
                <div class="bottom-gd row">
                    <div class="icon-gd col-md-3 text-center">
                        <span class="fa fa-gift" aria-hidden="true"></span>
                    </div>

                    <div class="icon-gd-info col-md-9">
                        <h3 class="mb-2">ÁP DỤNG KHUYỄN MÃI</h3>
                        <h6>KHI ĐĂNG KÝ THÀNH VIÊN</h6>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 gd-bottom">
                <div class="bottom-gd row">
                    <div class="icon-gd col-md-3 text-center">
                        <span class="fa fa-usd" aria-hidden="true"></span>
                    </div>
                    <div class="icon-gd-info col-md-9">
                        <h3 class="mb-2">HỖ TRỢ KHÁCH HÀNG</h3>
                        <h6>24/7</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- //ab -->
<!--/ab -->
<section class="about py-5">
    <div class="container pb-lg-3">
        <h3 class="tittle text-center">SẢN PHẨM MỚI</h3>
        <div class="row">
            <%
                List<Product> newestProduct = new ProductService().findAllSortByDate(6);
                request.setAttribute("newestProduct", newestProduct);
            %>
            <c:forEach items="${newestProduct}" var="product">
                <div class="col-md-4 product-men">
                    <div class="product-shoe-info shoe text-center">
                        <div class="men-thumb-item">
                            <img
                                    src="${product.img}"
                                    class="img-fluid"
                                    alt=""
                            />
                            <span class="product-new-top">MỚI</span>
                        </div>
                        <div class="item-info-product">
                            <h4>
                                <a href="/products/product-single?id=${product.productId}"
                                >${product.name}</a>
                            </h4>

                            <div class="product_price">
                                <div class="grid-price">
                                    <span class="regular-price">${product.price} vnd</span>
                                    <span class="money">${product.discount}%</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<section class="about py-5">
    <div class="container pb-lg-3">
        <h3 class="tittle text-center">SẢN PHẨM YÊU THÍCH</h3>
        <div class="row">
            <div class="col-md-6 latest-left">
                <div class="product-shoe-info shoe text-center">
                    <img src="main/images/img1.png" class="img-fluid" alt=""/>
                    <div class="shop-now img1">
                        <a href="main/product.jsp" class="btn">CHI TIẾT</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 latest-right">
                <div class="row latest-grids">
                    <div class="latest-grid1 product-men col-12">
                        <div class="product-shoe-info shoe text-center">
                            <div class="men-thumb-item">
                                <img
                                        src="main/images/jordan1_tokyo.png"
                                        class="img-fluid"
                                        alt=""
                                />
                                <div class="shop-now img2">
                                    <a href="main/product.jsp" class="btn">CHI TIẾT</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="latest-grid2 product-men col-12 mt-lg-4">
                        <div class="product-shoe-info shoe text-center">
                            <div class="men-thumb-item">
                                <img src="main/images/img3.png" class="img-fluid" alt=""/>
                                <div class="shop-now img3">
                                    <a href="main/product.jsp" class="btn">CHI TIẾT</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- //ab -->


<!-- footer -->
<jsp:include page="/main/footer.jsp"/>
<!-- //footer -->


</body>
<script src="main/script/main.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/js/bootstrap.bundle.min.js"></script>
<!-- Initialize Swiper -->
<script>
    const swiper = new Swiper(".swiper-container", {
        slidesPerView: 3,
        spaceBetween: 30,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        autoplay: {
            delay: 1000,
        },
    });
</script>
</html>