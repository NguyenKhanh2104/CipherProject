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

</style>
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
        <a href="../index.jsp">TRANG CHỦ</a>
    </li>
    <li class="breadcrumb-item"><a href="product.jsp">SẢN PHẨM</a></li>
    <li class="breadcrumb-item">
        <a href="product-single.jsp">CHI TIẾT</a>
    </li>
    <li class="breadcrumb-item active">GIỎ HÀNG</li>
</ol>

<%--products--%>
<section class="ab-info-main py-md-5 py-4">
    <div style="width: 90%; margin: auto" class="container-fluid  py-md-3 main-container">
        <div class="row">
            <div class="side-bar col-lg-4">
                <div class="search-bar w3layouts-newsletter">
                    <h3 class="sear-head">TÌM KIẾM</h3>
                    <form action="#" method="post" class="d-flex">
                        <input type="search" placeholder="TÊN SẢN PHẨM" name="search" class="form-control"
                               required=""/>
                        <button class="btn1">
                            <span class="fa fa-search" aria-hidden="true"></span>
                        </button>
                    </form>
                </div>
                <form class="accordion" id="accordionExample">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                Accordion Item #1
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                             data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <c:forEach  items="${tags}" var="tag">
                                    <c:if test="${tag.status == 1}">
                                        <input type="checkbox" id="${tag.name} name=${tag.name} value=${tag.id}">
                                        <label for="${tag.name}">${tag.name}</label>
                                        <br>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                Accordion Item #2
                            </button>
                        </h2>
                        <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                             data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <strong>This is the second item's accordion body.</strong> It is hidden by default,
                                until the collapse plugin adds the appropriate classes that we use to style each
                                element. These classes control the overall appearance, as well as the showing and hiding
                                via CSS transitions. You can modify any of this with custom CSS or overriding our
                                default variables. It's also worth noting that just about any HTML can go within the
                                <code>.accordion-body</code>, though the transition does limit overflow.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                Accordion Item #3
                            </button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                             data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <strong>This is the third item's accordion body.</strong> It is hidden by default, until
                                the collapse plugin adds the appropriate classes that we use to style each element.
                                These classes control the overall appearance, as well as the showing and hiding via CSS
                                transitions. You can modify any of this with custom CSS or overriding our default
                                variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>,
                                though the transition does limit overflow.
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="left-ads-display col-lg-8">
                <div class="row">
                    <c:forEach items="${products}" var="item">
                        <div class="col-md-4 product-men">
                            <div class="product-shoe-info shoe text-center">
                                <div class="men-thumb-item">
                                    <img src="${item.img}" class="img-fluid" alt=""/>
                                </div>
                                <div class="item-info-product">
                                    <h4>

                                        <a href="/products/product-single?id=${item.productId}">${item.name}
                                        </a>
                                    </h4>

                                    <div class="product_price">
                                        <div class="grid-price">
                                            <c:if test="${item.discount > 0}">
                                                <span style="color: #44bd32" class="money">
                                                    <fmt:formatNumber maxFractionDigits="0" type="number"   value="${ (item.price - (item.price * item.discount /100))}"/> vnd
                                                </span>

                                            </c:if>
                                            <c:if test="${item.discount <= 0}">
                                                <span style="color: #44bd32" class="money">${item.price} vnd</span>

                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${item.discount > 0}">
                                    <div class="discount-tag">
                                        <span>${item.discount}%</span>
                                        <i class="fas fa-tags"></i>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
    </div>


    <div class="container" style="background-color: red;position: relative">
        <div style="margin: auto;text-align: center">
            <nav style="text-align: center;margin: auto">
                <ul class="pagination" style="text-align: center;position: absolute;left: 50%">
                    <%--prev--%>
                    <c:if test="${pagesCount >  1}">
                        <li>
                            <a style="padding: 10px 15px; background: #2d2f35; border: 1px solid whitesmoke"
                                    <c:if test="${currentPage >1}">
                                        href="/products?category=${currentCategory}&pages=${currentPage +1}"
                                    </c:if> aria-label="Previous">
                                <span aria-hidden="true">«</span>
                            </a>
                        </li>
                    </c:if>
                    <%--prev--%>
                    <c:forEach var="i" begin="1" end="${pagesCount}">
                        <li>
                            <a style="padding: 10px 15px; background: #2d2f35;border: 1px solid whitesmoke"
                               href="/products?category=${currentCategory}&pages=${i}">${i}</a>
                        </li>
                    </c:forEach>
                    <%--next--%>
                    <c:if test="${pagesCount > 1}">
                        <li>
                            <a style="padding: 10px 15px; background: #2d2f35; border: 1px solid whitesmoke"
                                    <c:if test="${currentPage < pagesCount}">
                                        href="/products?category=${currentCategory}&pages=${currentPage +1}"
                                    </c:if> aria-label="Next">
                                <span aria-hidden="true">»</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>

    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-end">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1">Previous</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#">Next</a>
            </li>
        </ul>
    </nav>
</section>


<jsp:include page="/main/footer.jsp"/>
<script src="/main/script/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/js/bootstrap.bundle.min.js"></script>
</body>

</html>