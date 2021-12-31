<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.nlu.model.Product" %>
<%@ page import="com.nlu.service.ProductService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.nlu.service.CartService" %>
<%@ page import="java.util.Collection" %>
<%@ page import="com.nlu.model.Cart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/HomePage.css" type="text/css" media="all"/>--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/HomePage.css"/>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>HOME</title>
    <style>
        td {
            padding: 5px 0px;
        }
    </style>
</head>
<style>
    label:hover {
        color: blue;
    }

    .tour-mg {
        margin-bottom: 20px;

    }

    .bor-tour {
        border: 1px solid #dedbdb;
        padding-bottom: 10px;

    }

    .bor-tour:hover {
        position: absolute;
        margin-top: -10px;
        margin-bottom: 20px;
    }
</style>
<body>

<div class="containerHome">

    <div class="header_home">
        <div class="posisionbtn">
            <ul class="nav nav-pills">
                <li><a data-toggle="pill" href="#ban">Phòng bàn</a></li>
                <li class="active"><a data-toggle="pill" href="#menu">Thực Đơn</a></li>

            </ul>
            <div class="tab-content"
                 style="box-shadow: 0px 19px 22px -2px rgba(255,135,23,0.44);width: 575px; height: 445px;border-radius: 13px;margin-left: -205px;   margin-top: 38px">
                <div id="menu" class="tab-pane fade in active" style="color: black;padding: 5px">


                    <c:forEach items="${data}" var="o">
                        <div class="col-md-2 column productbox tour-mg"
                             style="width: 120px;height: 120px;padding: 5px">
                            <div class="bor-tour">

                                <img src="${o.image}" class="img-responsive">
                                <div class="producttitle">${o.nameProduct}</div>
                                <div class="productprice">
                                    <div class="pricetext">${o.price}
                                    </div>
                                    <a href="/addcart?id=${o.idProduct}">Chọn</a>
                                </div>

                            </div>

                        </div>
                    </c:forEach>

                </div>
                <div id="ban" class="tab-pane fade">
                </div>
            </div>
            <form action="search"
                  class="form-inline d-flex justify-content-center md-form form-sm active-purple-2 mt-2">
                <input name="txt" class="form-control form-control-sm mr-3 w-75" type="text" placeholder="Tìm kiếm"
                       style="width: 240px ; margin-left: -355px"
                       aria-label="Search">
                <button style="justify-content: center;align-items:center;width: 50px;margin-top: 3px" type="submit"
                        class="btn btn-primary search"><i class="fas fa-search" aria-hidden="true"
                                                          style="color: #FFFFFF"></i></button>

            </form>
            <ul class="nav nav-pills">
                <li><a data-toggle="pill" href="#bill">Hóa đơn 1</a></li>

            </ul>

            <div class="tab-content two"
                 style="box-shadow: 0px 19px 22px -2px rgba(255,135,23,0.44);width: 662px; height: 445px;border-radius: 13px;margin-left: -114px;   margin-top: 38px">
                <div id="bill" class="tab-pane fade in active">


                    <form class="form-inline d-flex justify-content-center md-form form-sm active-purple-2 mt-2">
                        <input name="txt" class="form-control form-control-sm mr-3 w-75" type="text"
                               placeholder="Tìm kiếm"
                               style="height: 30px;width: 265px ; margin-left: 119px; margin-top: 5px"
                               aria-label="Search">
                        <i class="fas fa-search" aria-hidden="true" style="color: #9EA4EC"></i>
                    </form>
                    <div class="dropdown">
                        <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Bảng giá
                            <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li><a href="#">Giá gốc</a></li>
                            <li><a href="#">Giá khuyến mãi</a></li>
                        </ul>

                    </div>
                    <div class="dropdown">
                        <button class="btn btn-primary dropdown-toggle1" type="button" data-toggle="dropdown">Loại khách
                            <span class="caret"></span></button>
                        <ul class="dropdown-menu " style="margin-left:459px ; margin-top: -37px">
                            <li><a href="#">Khách mới</a></li>
                            <li><a href="#">Khách thân thiết</a></li>
                        </ul>
                    </div>

                    <table style="margin-left: 47px;position: absolute">

                        <tbody>
                        <% Cart cart = Cart.getCart(session);
                            Collection<Product> data = cart.getData();
                            request.setAttribute("data", data);
                        %>
                        <c:forEach items="${data}" var="o">
                            <tr>
                                <td class="tdname" style="width: 210px">${o.nameProduct}</td>

                                <td  class="tdquantity" style="width: 129px">
                                    <button class="btn btn-primary btn-circle" style="text-align: center"><a class="add"
                                                                                                             style="color: #FFFFFF;
    font-size: 28px;
    margin-left: -7px;
    margin-top: -19px;
    position: absolute;" href="/addProduct?id=${o.idProduct}">+</a></button>
                                    &nbsp
                                        ${o.quantity}&nbsp
                                    <button class="btn btn-primary btn-circle" style="align-items: center"><a
                                            class="sub" style="color: #FFFFFF; font-size: 41px;
    margin-left: -6px;
    margin-top: -30px;
    position: absolute;" href="/subProduct?id=${o.idProduct}">-</a></button>
                                    </button></td>
                                <td class="tdprice" style="width: 104px">${o.price}</td>
                                <td class="tdpricetotal" style="width: 145px">${o.quantity * o.price}</td>
                                <td class="tdtrash">
                                    <a href="/remove?id=${o.idProduct}"><i class="fas fa-trash-alt" style="color: #FFFFFF"></i></a>

                                </td>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="note"
                     style="height: 70px;background-color: gainsboro ; margin-top: 250px;display: flex;width: 643px;margin-left: 19px">
                    <button type="button" class="btn btn-primary btn-circle" style="margin-top: 33px;margin-left: 15px">
                        <i class="fa fa-pencil"></i> &nbsp; &nbsp;
                        Ghi chú
                    </button> &nbsp; &nbsp;
                    <button type="button" class="btn btn-primary btn-circle" style="margin-top: 33px;margin-left: 70px">
                        <i class="fas fa-history"></i> &nbsp;&nbsp;
                        Lịch sử
                    </button>

                </div>
                &nbsp; &nbsp; &nbsp; <p class="total" style="width: 250px;margin-left: 231px;margin-top: -50px">Tổng
                tiền: ${cart.total()}</p>

                <button type="button" class="btn btn-primary btn-circle"
                        style="width: 125px;margin-left: 480px;margin-top: -60px">
                    Tách ghép đơn
                </button>
                <div class="sellinfo" style="margin-left: 19px;width: 643px">
                    <div class="sell"><p class="sellbill">Thanh Toán</p></div>
                    <div class="info"><p class="sellbill">Thông Báo</p></div>
                </div>
            </div>
            <div class="btnclick">
                <button type="button" class="btn btn-primary btn-circle"><i class="fas fa-plus"></i>
                </button>
                &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                <button type="button" class="btn btn-primary btn-circle"><i class="fa fa-volume-up"></i></button>
                &nbsp
                <button type="button" class="btn btn-primary btn-circle"><i class="fas fa-globe"></i></button>
                &nbsp
                <button type="button" class="btn btn-primary btn-circle" style="color: #FFFFFF"><i
                        class="fas fa-sync-alt"></i></button>
                &nbsp
                <button type="button" class="btn btn-primary btn-circle"><i class="fa fa-print"></i></button>
                <button type="button" class="btn btn-primary btn-circle " style="width: 124px">
                    <c:if test="${sessionScope.acc!=null}">

                        HI! ${sessionScope.acc.userName}
                    </c:if>
                </button>
                <a href="/store/quanlihoadon.jsp">
                    <button type="button" class="btn btn-primary btn-circle-lg"><i
                            class="glyphicon glyphicon-list fa-lg"></i>
                    </button>
                </a>
            </div>
        </div>
    </div>
    <div class="footer" style=" height: 25px; width: 100%;margin-top: 460px;text-align: center;margin-left: -115px">
        Hotline: 0927007791
    </div>
</div>
</body>
</html>