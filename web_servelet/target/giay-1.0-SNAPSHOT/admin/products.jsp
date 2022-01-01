
<%@ page import="com.nlu.model.User" %>

<%
    User user =(User) session.getAttribute("auth");
    if (user == null || !user.getRole().equals("admin")){
        response.sendRedirect("/");
    }
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.nlu.service.ProductService" %>
<%@ page import="com.nlu.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Tất cả sản phẩm</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/admin/images/webpage.svg" type="image/x-icon"/>
    <%--        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style/main.css"/>--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/js/zoom/css/zoom.css"/>
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style/products.css" />--%>


    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.23/js/dataTables.bootstrap.min.js"></script>
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

    <script>
        $(document).ready(function () {
            $('#example').DataTable();
        });
    </script>
    <style>
        .dataTables_length {
            font-size: 1rem;

        }

        .dataTables_length .example_length {
            width: 100px;
            font-size: 2rem;
        }

        .pagination {
            color: white;
            display: flex;
            flex-direction: row;
            justify-content: flex-end;
        }

        .paginate_button {
            background-color: #273c75;
            color: white;
            margin: 5px;
            border: 1px solid #273c75;
            padding: 10px;
        }

        .paginate_button a {
            color: white;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 5px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }

        /* ****GLOBAL DEFINE****** */
        :root {
            --gray: #6c757d;
            --indigo: #6610f2;
            --teal: #2a9d8f;
            --gray-dark: #343a40;
            --success: #28a745;
            --info: #17a2b8;
            --warning: #ffc107;
            --danger: #dc3545;
            --cyan: #17a2b8;
            --light: #f5f5f5;
        }

        .hidden {
            display: none;
        }

        .text_center {
            text-align: center;
        }

        .color_light {
            color: #f5f5f5;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            list-style: none;
            text-decoration: none;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
            Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
        }

        button:hover {
            opacity: 0.6 !important;
        }

        button {
            outline: none;
        }

        a:hover {
            text-decoration: underline;
            text-decoration-color: var(--teal);
            transition: text-decoration 0.2s ease-in;
            opacity: 1 !important;
        }

        input:focus {
            box-shadow: 0 0 5px 1px #ced4da;
            transition: transform 0.3s ease-in-out;
        }

        select {
            outline: none;
        }

        input,
        textarea {
            border-radius: 0.25rem;
            border: 1px solid #ced4da;
            outline: none;
            color: #495057 !important;
            padding: 5px;
        }

        a {
            font-weight: 100;
            color: white;
        }

        .img-icon {
            width: 1.25rem;
            margin: 0 10px;
        }

        .img-small {
            width: 2rem;
        }

        .mt-1 {
            margin-top: 1rem;
        }

        .mb-1 {
            margin-bottom: 1rem;
        }

        body {
            height: 100vh;
        }

        .body_container {
            display: flex;
            height: 100%;
        }

        #left_menu-toggle {
            display: none;
        }

        #close-btn {
            position: fixed;
            top: 3%;
            right: 5%;
            width: 1.25rem;
            display: none;
            border-radius: 10px;
        }

        .left_menu-active {
            display: flex;
            position: fixed;
            width: 100%;
            transition: all 0.5s ease-in;
        }

        .tranform0 {
            transform: translate(0) !important;
            transition: 0.5s ease-in-out !important;
        }

        /* **** END OF GLOBAL DEFINE****** */

        /* ******LEFT********* */
        .left_wrapper {
            background-color: var(--gray-dark);
            margin: auto;
            flex: 2;
            height: 100vh;
        }

        .left_wrapper .left {
            width: 70%;
            margin: auto;
        }

        .left_wrapper .left .dashboard_title {
            margin-bottom: 2rem !important;
            margin-top: 1rem !important;
            display: flex !important;
            justify-content: space-between;
            align-items: center;
        }

        .left_wrapper .left .dashboard_title h2 {
            color: white !important;
            margin-left: 0.5rem !important;
            font-size: 1.2rem !important;
        }

        .left_wrapper .left .left_menu .menu {
            position: relative;
        }

        .menu_title {
            margin-top: 1rem;
            display: flex;
            align-items: center;
            border-bottom: 1px solid var(--gray);
            font-size: 0.98rem !important;
        }

        .menu_title h4 {
            color: white;
            opacity: 0.5;
        }

        .sub_menu {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            font-size: 0.8rem !important;
        }

        .sub_menu a {
            display: inline-block;
            padding: 0.25rem !important;
            color: white;
            opacity: 0.5;
        }

        .active {
            opacity: 1 !important;
            color: #fff !important;
        }

        /* ******END OF LEFT******* */

        /* *****RIGHT************* */
        .right_wrapper {
            flex: 8;
        }

        .right_wrapper_content {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .right_wrapper .topbar {
            height: 10vh;
            background-color: #2a9d8f;
            display: flex;
            align-items: center;
        }

        .right_wrapper .topbar .topbar_content {
            width: 90%;
            margin: auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
            color: white;
            min-width: 300px;
        }

        .right_wrapper .current_user {
            display: flex;
            position: relative;
        }

        .right_wrapper .current_user .current_user-name {
            margin-right: 0.5rem;
            font-weight: 100;
            color: var(--light);
        }

        .right_wrapper .current_user:hover .current_user-sub-menu {
            display: block;
        }

        .right_wrapper .current_user .current_user-sub-menu {
            display: none;
            position: absolute;
            z-index: 888;
            top: 100%;
            min-width: 160px;
        }

        .right_wrapper .current_user .current_user-sub-menu a:hover {
            background-color: var(--teal);
        }

        .right_wrapper .current_user .current_user-sub-menu a {
            border-radius: 0.2rem;
            font-size: 0.72rem;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0.7rem 0rem !important;
            background-color: var(--gray-dark);
            cursor: pointer;
            border-bottom: 1px solid white;
        }

        .right_wrapper .current_user .current_user-sub-menu a img {
            width: 1rem;
            margin-right: 10px;
        }

        .right_wrapper .logo {
            display: flex;
            align-items: center;
        }

        .right_wrapper .logo h3 {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
            Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
            /* font-weight: 100; */
        }

        .right_wrapper .btn_action {
            padding: 0.5rem;
            border: none;
            border-radius: 5px;
            color: white;
        }

        .right_wrapper .btn_delete {
            background-color: var(--danger);
        }

        .right_wrapper .btn_quick-edit {
            background-color: var(--warning);
        }

        .right_wrapper .btn_publish {
            background-color: var(--success);
        }

        /* *****END OF RIGHT************* */

        /* EDIT PRODUCT */
        .edit_wrapper {
            background-color: #f2f2f2;
            padding: 0.5rem;
            width: 95%;
            margin: auto;
            display: none;
        }

        .edit_wrapper h3 {
            color: var(--indigo);
        }

        .edit_product-container {
            width: 90%;
            margin: auto;
        }

        .edit_product-container #editor {
            height: 100%;
        }

        .edit_product-container input {
            width: 100%;
            height: 40px;
            border: 1px solid #f2f2f2;
            border-radius: 10px;
            outline: none;
        }

        .edit_product-container select {
            width: 100%;
            height: 2rem;
            border-radius: 10px;
            outline: none;
            border: 1px solid #f2f2f2;
        }

        .edit_product-container .btn_save-change {
            background-color: coral;
        }

        .edit_product-container .btn_cancel-change {
            background-color: green;
        }

        #add_stock {
            width: 1rem;
        }

        #minus_stock {
            width: 1rem;
        }


        @media screen and (max-width: 1255px) {
            /*table {*/
            /*  border: 0;*/
            /*}*/
            .caption {
                font-size: 1.3em;
            }


            .menu_title {
                min-width: 100% !important;
            }
        }

        @media screen and (min-width: 361px) and (max-width: 1300px) {
            .btn_action {
                padding: 0.3rem !important;
            }

            .find_item {
                min-width: 300px !important;
            }
        }

        @media screen and (max-width: 780px) {
            .left_wrapper {
                z-index: 999 !important;
                position: fixed;
                top: 0;
                width: 100%;
                transform: translateX(-100%);
                transition: 0.4s ease-in;
            }

            .menu_title {
                min-width: 100% !important;
            }

            .dashboard_title {
                width: 80% !important;
                padding-top: 3rem;
                margin-left: auto;
                margin-right: auto;
            }

            .left_menu {
                display: inline;
            }

            .menu {
                width: 70%;
                margin: auto;
            }

            .sub_menu {
                display: flex;
                flex-direction: column;
                align-items: flex-start !important;
            }

            .sub_menu a {
                display: inline-block;
                margin-left: 5rem;
            }

            #left_menu-toggle {
                display: block;
                width: 1rem;
                margin-right: 1rem;
            }

            #close-btn {
                display: inline;
                animation: roate360 1s linear infinite;
            }

            @keyframes roate360 {
                from {
                    transform: rotate(0deg);
                }
                to {
                    transform: rotate(360deg);
                }
            }
            .caption {
                padding-bottom: 6rem !important;
                color: var(--indigo);
            }

            .find_item::placeholder {
                padding-left: 5px;
                font-size: 0.75rem;
            }
        }

        .action_bar {
            display: flex;
            align-items: center;
            justify-content: flex-start;
        }

        .action_bar .select {
            margin-right: 1rem;
        }

        .action_bar select,
        button {
            color: #495057;
            cursor: pointer;
            padding: 0.1rem 1rem;
            border: 1px solid #ced4da;
        }

        /*  */
        .show_setting {
            position: absolute;
            font-size: 0.75rem;
            right: 0;
            margin-right: 1rem;
            padding: 0.5rem 1.75rem;
            border-radius: 0.1rem !important;
            background-color: #495057;
            color: white;
            cursor: pointer !important;
            z-index: 444;
        }

        .view_option {
            box-shadow: 0px 1px 2px 0 #c9c9c9;
            width: 100%;
            border: none;
            position: relative;
            margin-bottom: 3rem;
        }

        .option_details {
            height: 0;
            background-color: #f2f2f2;
            transition: all 0.4s ease-out;
            position: relative;
        }

        .option_details > div {
            display: inline-block;
            padding: 1rem;
        }

        .option_details {
            border: none;
            overflow: hidden;
        }

        .active {
            display: block;
        }

        .show_setting-info {
            height: 20vh;
        }

        @media screen and (max-width: 614px) {
            .view_option {
                margin-bottom: 2rem !important;
            }

            .show_setting-info {
                /*height: 100%;*/
                transition: all 0.5s ease-in-out;
            }

            .option_details > div {
                display: inline-block;
                background-color: aquamarine;
                margin-left: 1rem !important;
                padding: 0.25rem !important;
            }
        }

    </style>
</head>
<body>
<div class="body_container">
    <!-- ===***LEFT***=== -->
    <jsp:include page="./sidebar.jsp"/>

    <!-- ===***END OF LEFT***=== -->

    <!-- ===***RIGHT***=== -->
    <div class="right_wrapper">
        <div class="right">
            <div class="topbar">
                <div class="topbar_content">
                    <div class="logo">
                        <img
                                src="./images/bars-solid.svg"
                                alt=""
                                class="img-icon"
                                id="left_menu-toggle"
                        />
                        <h3>SKED</h3>
                    </div>
                    <div class="current_user">
                        <h5 class="current_user-name">Duy Nguyen</h5>
                        <img
                                class="img-small"
                                src="./images//wallpaperflare.com_wallpaper (1).jpg"
                                alt=""
                        />
                        <div class="current_user-sub-menu">
                            <a href=""
                            ><img src="./images/settings.svg" alt=""/>Cài Đặt</a
                            >
                            <a href="login.jsp"
                            ><img src="./images/logout.svg" alt=""/> Đăng Xuất
                            </a>
                            <a href="../index.jsp"> THOÁT </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end of right topbar -->
            <div class="right_content">
                <div class="view_option">
                    <div class="option_details">
                        <div>
                            <input checked class="cb_no" type="checkbox" name=""/>
                            <label>STT</label>
                        </div>
                        <div>
                            <input checked class="cb_id" type="checkbox" name=""/>
                            <label>ID</label>
                        </div>
                        <div>
                            <input checked class="cb_img" type="checkbox"/>
                            <label>Ảnh</label>
                        </div>
                        <div>
                            <input checked class="cb_name" type="checkbox" name=""/>
                            <label>Tên</label>
                        </div>
                        <div>
                            <input checked class="cb_price" type="checkbox" name=""/>
                            <label>Giá</label>
                        </div>
                        <div>
                            <input checked class="cb_sales" type="checkbox" name=""/>
                            <label>Khuyến mại</label>
                        </div>
                        <div>
                            <input checked class="cb_category" type="checkbox" name=""/>
                            <label>Doanh Mục</label>
                        </div>
                        <div>
                            <input checked class="cb_stock" type="checkbox" name=""/>
                            <label>Số lượng</label>
                        </div>
                        <div>
                            <input checked class="cb_size" type="checkbox" name=""/>
                            <label>Kích cõ</label>
                        </div>
                        <div>
                            <input
                                    checked
                                    class="cb_date-created"
                                    type="checkbox"
                                    name=""
                            />
                            <label>Ngày tạo</label>
                        </div>
                        <div>
                            <input checked class="cb_action" type="checkbox" name=""/>
                            <label>Thao tác</label>
                        </div>
                    </div>
                    <button class="show_setting">Tùy chọn hiển thị</button>
                </div>


                <div class="caption">
                    <div>
                        <h4 style="text-align: center;font-size: 2rem">Tất Cả Sản Phẩm</h4>
                    </div>
                </div>
                <div style="margin-left: 10px;color: #0f74a8;font-style: italic">

                    <span>
                        <%=
                        request.getAttribute("mess") == null ? "" : request.getAttribute("mess")
                        %>

                        <%=
                        request.getAttribute("message") == null ? "" : request.getAttribute("message")
                        %>


                        <a href="/products/post?productId=<%=request.getAttribute("productId") == null ? "" :request.getAttribute("productId") %>"
                           style="color: #0f74a8">
                           <%=
                           request.getAttribute("mess") == null ? "" : "Hoàn Tác"
                           %>
                        </a>

                   </span>

                </div>
                <%
                    List<Product> products = new ProductService().findAll();
                    request.setAttribute("products", products);
                %>

                <div style="width: 98%; margin: auto">
                    <table id="example" class="table table-striped table-bordered" style="width:100%">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên</th>
                            <th>Ảnh</th>
                            <th>Giá</th>
                            <th>Giảm Giá</th>
                            <th>Size : Số Lượng</th>
                            <th>Trạng Thái</th>
                            <th>Ngày Tạo</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${products}" var="product">

                            <tr>
                                <td>${product.productId}</td>
                                <td>${product.name}</td>
                                <td>
                                    <img
                                            data-action="zoom"
                                            src="${product.img}"
                                            style="width: 1.25rem"
                                            alt=""
                                    />
                                </td>
                                <td>
                                    <fmt:formatNumber>
                                        ${product.price}
                                    </fmt:formatNumber>
                                    vnd
                                </td>
                                <td>${product.discount}%</td>
                                <td>
                                    <c:forEach items="${product.productDetails}" var="details">
                                        <span> ${details.size}</span> : ${details.quality} <i style="color: yellow"
                                                                                              class="fas fa-star"></i>
                                    </c:forEach>
                                </td>
                                <td>
                                    <c:if test="${product.status == 1}">
                                        Đã Đăng
                                    </c:if>
                                    <c:if test="${product.status == 2}">
                                        Chưa Đăng
                                    </c:if>
                                    <c:if test="${product.status == 3}">
                                        Thùng Rác
                                    </c:if>
                                </td>
                                <td>${product.modifyDate}</td>
                                <td>

                                    <button class="btn_action btn_delete"><a
                                            href="/products/update-status?status=3&productId=${product.productId}&productName=${product.name}">Xóa</a>
                                    </button>
                                    <button class="btn_action btn_quick-edit">
                                        <a href="/products/update?productId=${product.productId}">Sửa</a>
                                    </button>
                                    <button class="btn_action btn_publish">
                                        <a href="/products/update-status?status=1&productId=${product.productId}&productName=${product.name}">Đăng</a>
                                    </button>

                                </td>
                            </tr>

                        </c:forEach>
                        </tbody>
                        <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Tên</th>
                            <th>Ảnh</th>
                            <th>Giá</th>
                            <th>Giảm Giá</th>
                            <th>Size : Số Lượng</th>
                            <th>Trạng Thái</th>
                            <th>Ngày Tạo</th>
                            <th>Action</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- ===***END OF RIGHT***=== -->
</div>
<script src="${pageContext.request.contextPath}/admin/js/zoom/dist/zoom.min.js"></script>
</body>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
<%--<script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/admin/js/zoom/dist/zoom.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/admin/js/products.js"></script>--%>

</html>


<%--<div class="action_bar mb-1">--%>
<%--  <div class="select">--%>
<%--    <select name="action">--%>
<%--      <option value="recyle">Chuyển vào thùng rác</option>--%>
<%--      <option value="processing">Chỉnh sửa chi tiết</option>--%>
<%--      <option value="complete">Gỡ khỏi trang</option>--%>
<%--    </select>--%>
<%--    <button class="btn_apply">Thực Hiện</button>--%>
<%--  </div>--%>
<%--  <div class="select">--%>
<%--    <h6><%=request.getAttribute("notify") != null ? request.getAttribute("notify"): ""%></h6>--%>
<%--  </div>--%>
<%--  <div class="select-search__field">--%>
<%--    <select name="action">--%>
<%--      <option value="day">Trong Ngày</option>--%>
<%--      <option value="month">Tháng</option>--%>
<%--      <option value="year">Năm</option>--%>
<%--    </select>--%>
<%--    <button class="btn_apply">Thực Hiện</button>--%>
<%--  </div>--%>
<%--</div>--%>
<%--<table id="product_table">--%>
<%--  <thead>--%>
<%--  <tr>--%>
<%--    <th><input type="checkbox" name="" id="sellect_all" /></th>--%>
<%--    <th class="th_no">STT</th>--%>
<%--    <th class="th_id">ID</th>--%>
<%--    <th class="th_img">--%>
<%--      <img--%>
<%--              data-action="zoom"--%>
<%--              src="./images/image-gallery.svg"--%>
<%--              style="width: 1.25rem"--%>
<%--              alt=""--%>
<%--      />--%>
<%--    </th>--%>
<%--    <th class="th_name">Tên</th>--%>
<%--    <th class="th_price">Giá</th>--%>
<%--    <th class="th_sales">Giảm Giá</th>--%>
<%--    <th class="th_category">Doanh Mục</th>--%>
<%--    <th class="th_stock">Số Lượng</th>--%>
<%--    <th class="th_size">Kích Cỡ</th>--%>
<%--    <th class="th_date-created">Ngày Tạo</th>--%>
<%--    <th colspan="3" class="th_action">Thao Tác</th>--%>
<%--  </tr>--%>
<%--  </thead>--%>
<%--  <tbody id="table">--%>
<%--  <tr>--%>
<%--    <td>--%>
<%--      <input--%>
<%--              type="checkbox"--%>
<%--              name=""--%>
<%--              class="cb_item cb_product"--%>
<%--      />--%>
<%--    </td>--%>
<%--    <td class="product_no td_no">0</td>--%>
<%--    <td class="product_id td_id">#32424242424234</td>--%>
<%--    <td class="td_img">--%>
<%--      <img--%>
<%--              data-action="zoom"--%>
<%--              src="./images/img01.jpg"--%>
<%--              class="img-small product_img"--%>
<%--              alt=""--%>
<%--      />--%>
<%--    </td>--%>
<%--    <td class="product_name td_name">Jordan1 Mid Chicago</td>--%>
<%--    <td class="product_price td_price">1000$</td>--%>
<%--    <td class="product_discount td_sales">10%</td>--%>
<%--    <td class="product_category td_category">Jordan</td>--%>
<%--    <td class="product_stock td_sock">12</td>--%>
<%--    <td class="product_size td_size">--%>
<%--      <span>42</span>--%>
<%--      <span>40</span>--%>
<%--      <span>39</span>--%>
<%--    </td>--%>
<%--    <td class="product_dcreate td_date-created">22/12/1200</td>--%>
<%--    <td class="button_action-container td_action">--%>
<%--      <button class="btn_action btn_delete">Xóa</button>--%>
<%--      <button class="btn_action btn_quick-edit">--%>
<%--        Sửa Nhanh--%>
<%--      </button>--%>
<%--      <button class="btn_action btn_publish">Đăng</button>--%>
<%--    </td>--%>
<%--  </tr>--%>
<%--  <tr>--%>
<%--    <td>--%>
<%--      <input--%>
<%--              type="checkbox"--%>
<%--              name=""--%>
<%--              class="cb_item cb_product"--%>
<%--      />--%>
<%--    </td>--%>
<%--    <td class="product_no td_no">0</td>--%>
<%--    <td class="product_id td_id">#32424242424234</td>--%>
<%--    <td class="td_img">--%>
<%--      <img--%>
<%--              data-action="zoom"--%>
<%--              src="./images/img01.jpg"--%>
<%--              class="img-small product_img"--%>
<%--              alt=""--%>
<%--      />--%>
<%--    </td>--%>
<%--    <td class="product_name td_name">Jordan1 Mid Chicago</td>--%>
<%--    <td class="product_price td_price">1000$</td>--%>
<%--    <td class="product_discount td_sales">10%</td>--%>
<%--    <td class="product_category td_category">Jordan</td>--%>
<%--    <td class="product_stock td_sock">12</td>--%>
<%--    <td class="product_size td_size">--%>
<%--      <span>42</span>--%>
<%--      <span>40</span>--%>
<%--      <span>39</span>--%>
<%--    </td>--%>
<%--    <td class="product_dcreate td_date-created">22/12/1200</td>--%>
<%--    <td class="button_action-container td_action">--%>
<%--      <button class="btn_action btn_delete">Xóa</button>--%>
<%--      <button class="btn_action btn_quick-edit">--%>
<%--        Sửa Nhanh--%>
<%--      </button>--%>
<%--      <button class="btn_action btn_publish">Đăng</button>--%>
<%--    </td>--%>
<%--  </tr>--%>
<%--  <tr>--%>
<%--    <td>--%>
<%--      <input--%>
<%--              type="checkbox"--%>
<%--              name=""--%>
<%--              class="cb_item cb_product"--%>
<%--      />--%>
<%--    </td>--%>
<%--    <td class="product_no td_no">0</td>--%>
<%--    <td class="product_id td_id">#32424242424234</td>--%>
<%--    <td class="td_img">--%>
<%--      <img--%>
<%--              data-action="zoom"--%>
<%--              src="./images/img01.jpg"--%>
<%--              class="img-small product_img"--%>
<%--              alt=""--%>
<%--      />--%>
<%--    </td>--%>
<%--    <td class="product_name td_name">Jordan1 Mid Chicago</td>--%>
<%--    <td class="product_price td_price">1000$</td>--%>
<%--    <td class="product_discount td_sales">10%</td>--%>
<%--    <td class="product_category td_category">Jordan</td>--%>
<%--    <td class="product_stock td_sock">12</td>--%>
<%--    <td class="product_size td_size">--%>
<%--      <span>42</span>--%>
<%--      <span>40</span>--%>
<%--      <span>39</span>--%>
<%--    </td>--%>
<%--    <td class="product_dcreate td_date-created">22/12/1200</td>--%>
<%--    <td class="button_action-container td_action">--%>
<%--      <button class="btn_action btn_delete">Xóa</button>--%>
<%--      <button class="btn_action btn_quick-edit">--%>
<%--        Sửa Nhanh--%>
<%--      </button>--%>
<%--      <button class="btn_action btn_publish">Đăng</button>--%>
<%--    </td>--%>
<%--  </tr>--%>
<%--  </tbody>--%>
<%--</table>--%>
<%--<div class="action_bar mt-1">--%>
<%--  <div class="select">--%>
<%--    <select name="action">--%>
<%--      <option value="recyle">Chuyển vào thùng rác</option>--%>
<%--      <option value="processing">Chỉnh sửa chi tiết</option>--%>
<%--      <option value="complete">Gỡ khỏi trang</option>--%>
<%--    </select>--%>
<%--    <button class="btn_apply">Thực Hiện</button>--%>
<%--  </div>--%>
<%--  <div class="select-search__field">--%>
<%--    <select name="action">--%>
<%--      <option value="day">Trong Ngày</option>--%>
<%--      <option value="month">Tháng</option>--%>
<%--      <option value="year">Năm</option>--%>
<%--    </select>--%>
<%--    <button class="btn_apply">Thực Hiện</button>--%>
<%--  </div>--%>
<%--</div>--%>