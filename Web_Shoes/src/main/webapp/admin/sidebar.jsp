<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.nlu.model.User" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/logo-icon.jpg">
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="../assets/extra-libs/multicheck/multicheck.css">
    <link href="../assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
    <link href="../dist/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../styleAdmin/style.css">
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style/dashboard.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
<!-- ============================================================== -->
<!-- Preloader - style you can find in spinners.css -->
<!-- ============================================================== -->
<div class="preloader">
    <div class="lds-ripple">
        <div class="lds-pos"></div>
        <div class="lds-pos"></div>
    </div>
</div>
<!-- ============================================================== -->
<!-- Main wrapper - style you can find in pages.scss -->
<!-- ============================================================== -->
<div id="main-wrapper">
    <%--    <jsp:include page="top-bar.jsp"/>--%>
    <%--    <jsp:include page="sidebar.jsp"/>--%>
    <aside class="left-sidebar" data-sidebarbg="skin5">
        <!-- Sidebar scroll-->
        <div class="scroll-sidebar">
            <!-- Sidebar navigation-->
            <nav class="sidebar-nav">
                <ul id="sidebarnav" class="p-t-30">

                    </li>

                    <li class="sidebar-item"><a class="sidebar-link waves-effect waves-dark sidebar-link" href="#"
                                                aria-expanded="false"><i class="fas fa-home"></i><span
                            class="hide-menu">Trang chủ</span></a></li>
                    <li class="sidebar-item"><a class="sidebar-link has-arrow waves-effect waves-dark"
                                                href="javascript:void(0)" aria-expanded="false"><i
                            class="fas fa-shopping-cart"></i><span class="hide-menu">Quản lý sản phẩm </span></a>
                        <ul aria-expanded="false" class="collapse  first-level">
                            <li class="sidebar-item"><a href="tongquan.html" class="sidebar-link"><span
                                    class="hide-menu"> Tổng quan sản phẩm </span></a></li>
                            <li class="sidebar-item"><a href="themSanPham.html" class="sidebar-link"><span
                                    class="hide-menu">Thêm sản phẩm </span></a></li>
                        </ul>
                    </li>
                    <li class="sidebar-item"><a class="sidebar-link has-arrow waves-effect waves-dark"
                                                href="javascript:void(0)" aria-expanded="false"> <i
                            class="fas fa-address-book"></i><span class="hide-menu">Quản lí tài khoản</span></a>
                        <ul aria-expanded="false" class="collapse  first-level">
                            <li class="sidebar-item"><a href="/admin/users" class="sidebar-link"><span
                                    class="hide-menu">Tổng quan </span></a></li>
                            <li class="sidebar-item"><a href="/store/signUp.jsp" class="sidebar-link"><span
                                    class="hide-menu"> Thêm tài khoản  </span></a></li>


                        </ul>
                    </li>
                    <li class="sidebar-item"><a class="sidebar-link has-arrow waves-effect waves-dark"
                                                href="javascript:void(0)" aria-expanded="false"> <i
                            class="fas fa-address-book"></i><span class="hide-menu">Quản lí hoá đơn </span></a>
                        <ul aria-expanded="false" class="collapse  first-level">
                            <li class="sidebar-item"><a href="/admin/orders" class="sidebar-link"><span
                                    class="hide-menu">Tổng quan </span></a></li>
                            <li class="sidebar-item"><a href="/store/signUp.jsp" class="sidebar-link"><span
                                    class="hide-menu"> Chỉnh sửa  </span></a></li>


                        </ul>
                    </li>
                    <li class="sidebar-item"><a class="sidebar-link waves-effect waves-dark sidebar-link"
                                                href="login.html" aria-expanded="false"><i
                            class="fas fa-sign-out-alt"></i><span class="hide-menu">Đăng xuất</span></a></li>


                </ul>
            </nav>
            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
    </aside>
    <%--    <div class="right_wrapper" style="flex: 8;margin-left: 14%">--%>
    <%--        <div class="right">--%>
    <%--            <div class="right_content">--%>
    <%--                <div class="view_option">--%>
    <%--                    <div class="option_details">--%>
    <%--                        <div>--%>
    <%--                            <input--%>
    <%--                                    checked--%>
    <%--                                    class="cb_user-access"--%>
    <%--                                    type="checkbox"--%>
    <%--                                    name=""--%>
    <%--                            />--%>
    <%--                            <label>User truy cập</label>--%>
    <%--                        </div>--%>
    <%--                        <div>--%>
    <%--                            <input--%>
    <%--                                    checked--%>
    <%--                                    class="cb_total-price"--%>
    <%--                                    type="checkbox"--%>
    <%--                                    name=""--%>
    <%--                            />--%>
    <%--                            <label>Tổng tiền</label>--%>
    <%--                        </div>--%>
    <%--                        <div>--%>
    <%--                            <input checked class="cb_total-order" type="checkbox" />--%>
    <%--                            <label>Số order</label>--%>
    <%--                        </div>--%>
    <%--                        <div>--%>
    <%--                            <input--%>
    <%--                                    checked--%>
    <%--                                    class="cb_table-details"--%>
    <%--                                    type="checkbox"--%>
    <%--                                    name=""--%>
    <%--                            />--%>
    <%--                            <label>Bảng chi tiết</label>--%>
    <%--                        </div>--%>
    <%--                        <div>--%>
    <%--                            <input checked class="cb_bar-chart" type="checkbox" name="" />--%>
    <%--                            <label>Biều đồ doanh thu</label>--%>
    <%--                        </div>--%>
    <%--                        <div>--%>
    <%--                            <input checked class="cb_pie-chart" type="checkbox" name="" />--%>
    <%--                            <label>Biều đồ sản phẩm bán chạy</label>--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                    <button class="show_setting">Tùy Chọn Hiển Thị</button>--%>
    <%--                </div>--%>
    <%--                <div>--%>
    <%--                    <h2--%>
    <%--                            class="shop_analyis-title"--%>
    <%--                            style="text-align: center; margin: 2rem auto"--%>
    <%--                    >--%>
    <%--                <span--%>
    <%--                ><img src="./images/statistics.svg" class="img-icon" alt=""--%>
    <%--                /></span>--%>
    <%--                        Thống Kê Cửa Hàng--%>
    <%--                    </h2>--%>
    <%--                </div>--%>

    <%--                <!--  -->--%>
    <%--                <div class="option_container">--%>
    <%--                    <select name="" >--%>
    <%--                        <option value="">Thống kê theo</option>--%>
    <%--                        <option value="">Theo Tuần</option>--%>
    <%--                        <option value="">Theo Tháng</option>--%>
    <%--                        <option value="">Theo Năm</option>--%>
    <%--                    </select>--%>
    <%--                    <select name="" >--%>
    <%--                        <option value="">Đơn vị</option>--%>
    <%--                        <option value="">VND</option>--%>
    <%--                        <option value="">USD</option>--%>
    <%--                    </select>--%>
    <%--                </div>--%>

    <%--                <div class="card_container">--%>
    <%--                    <div class="users_access card bg_green color_light">--%>
    <%--                        <strong>--%>
    <%--                            <img src="./images/customer.svg" alt="" class="img-icon" />--%>
    <%--                            Số Lượng Truy Cập--%>
    <%--                        </strong>--%>
    <%--                        <div style="text-align: center">--%>
    <%--                            <span class="value">100</span><br />--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                    <div class="sales_progress card bg_bluegray color_light">--%>
    <%--                        <strong>--%>
    <%--                            <img src="./images/money.svg" class="img-icon" alt="" />--%>
    <%--                            Số Tiền Bán Được--%>
    <%--                        </strong>--%>
    <%--                        <div style="text-align: center">--%>
    <%--                            <span class="value">8,323,2332</span><br />--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                    <div class="order_count card bg_blue color_light">--%>
    <%--                        <strong>--%>
    <%--                            <img src="./images/order.svg" alt="" class="img-icon" />--%>
    <%--                            Số Order--%>
    <%--                        </strong>--%>
    <%--                        <div style="text-align: center">--%>
    <%--                            <span class="value">123</span><br />--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--                <!--  -->--%>
    <%--                <div class="card_details-container">--%>
    <%--                    <div class="box shop_activities">--%>
    <%--                        <h2 class="">Hoạt Động</h2>--%>
    <%--                        <div class="">--%>
    <%--                            <a>--%>
    <%--                                <span>Tổng tiền </span>--%>
    <%--                                <span>3.000.000VND</span>--%>
    <%--                            </a>--%>
    <%--                            <a>--%>
    <%--                                <span>Số đơn hàng</span>--%>
    <%--                                <span>23</span>--%>
    <%--                            </a>--%>
    <%--                            <a>--%>
    <%--                                <span>Số sản phẩm</span>--%>
    <%--                                <span>5</span>--%>
    <%--                            </a>--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                    <div class="box warehouse_info">--%>
    <%--                        <h2>Thông tin kho</h2>--%>
    <%--                        <a>--%>
    <%--                            <span>Tồn kho</span>--%>
    <%--                            <span>12</span>--%>
    <%--                        </a>--%>
    <%--                        <a>--%>
    <%--                            <span>Hết hàng</span>--%>
    <%--                            <span>0</span>--%>
    <%--                        </a>--%>
    <%--                        <a>--%>
    <%--                            <span>Sắp hết hàng</span>--%>
    <%--                            <span>0</span>--%>
    <%--                        </a>--%>
    <%--                    </div>--%>
    <%--                    <div class="box products_info">--%>
    <%--                        <h2>Thông tin sản phẩm</h2>--%>
    <%--                        <a>--%>
    <%--                            <span>Sản phẩm</span>--%>
    <%--                            <span>49</span>--%>
    <%--                        </a>--%>
    <%--                        <a>--%>
    <%--                            <span>Chưa phân loại</span>--%>
    <%--                            <span>0</span>--%>
    <%--                        </a>--%>
    <%--                        <a>--%>
    <%--                            <span>Đã đăng</span>--%>
    <%--                            <span>0</span>--%>
    <%--                        </a>--%>
    <%--                        <a>--%>
    <%--                            <span>Chưa đăng</span>--%>
    <%--                            <span>0</span>--%>
    <%--                        </a>--%>
    <%--                    </div>--%>
    <%--                    <div class="box top_products">--%>
    <%--                        <h2>Sản phẩm bán chạy</h2>--%>
    <%--                        <a>--%>
    <%--                            <span>Jordan 1 Mid</span>--%>
    <%--                            <span>12</span>--%>
    <%--                        </a>--%>
    <%--                        <a>--%>
    <%--                            <span>Air Force One</span>--%>
    <%--                            <span>4</span>--%>
    <%--                        </a>--%>
    <%--                        <a>--%>
    <%--                            <span>New balance MSX90GED</span>--%>
    <%--                            <span>4</span>--%>
    <%--                        </a>--%>
    <%--                    </div>--%>
    <%--                </div>--%>

    <%--                <!----%>
    <%--                 -->--%>
    <%--                <div--%>
    <%--                        class="barchart-container"--%>
    <%--                        style="width: 40vw; margin: 3rem auto"--%>
    <%--                >--%>
    <%--                    <canvas id="myChart" height="150px"></canvas>--%>
    <%--                </div>--%>
    <%--                <div--%>
    <%--                        class="piechart-container"--%>
    <%--                        style="width: 40vw; margin: 3rem auto"--%>
    <%--                >--%>
    <%--                    <canvas id="pie-chart" height="200"></canvas>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>
    <script src="./js/main.js"></script>

    <script src="js/dasboard.js"></script>
    <script>
        var ctx = document.getElementById("myChart").getContext("2d");
        var myChart = new Chart(ctx, {
            type: "bar",
            data: {
                labels: [
                    "Tháng 1",
                    "Tháng 2",
                    "Tháng 3",
                    "Tháng 4",
                    "Tháng 5",
                    "Tháng 6",
                ],
                datasets: [
                    {
                        label: "Ẩn",
                        data: [12, 19, 3, 5, 2, 3],
                        backgroundColor: [
                            "rgba(255, 99, 132, 0.2)",
                            "rgba(54, 162, 235, 0.2)",
                            "rgba(255, 206, 86, 0.2)",
                            "rgba(75, 192, 192, 0.2)",
                            "rgba(153, 102, 255, 0.2)",
                            "rgba(255, 159, 64, 0.2)",
                        ],
                        borderColor: [
                            "rgba(255, 99, 132, 1)",
                            "rgba(54, 162, 235, 1)",
                            "rgba(255, 206, 86, 1)",
                            "rgba(75, 192, 192, 1)",
                            "rgba(153, 102, 255, 1)",
                            "rgba(255, 159, 64, 1)",
                        ],
                        borderWidth: 1,
                    },
                ],
            },
            options: {
                title: {
                    display: true,
                    text: "Biểu đồ thể hiện doanh thu trong 6 tháng",
                    position: "bottom",
                },
                scales: {
                    yAxes: [
                        {
                            ticks: {
                                beginAtZero: true,
                            },
                        },
                    ],
                },
            },
        });

        new Chart(document.getElementById("pie-chart"), {
            type: "pie",
            data: {
                labels: [
                    "Jordan 1 Low",
                    "Chuck 70s",
                    "AirForce 1",
                    "Jordan1 Mid Chicago",
                    "Adidas Human v3",
                ],
                datasets: [
                    {
                        label: "",
                        backgroundColor: [
                            "#3e95cd",
                            "#8e5ea2",
                            "#3cba9f",
                            "#e8c3b9",
                            "#c45850",
                        ],
                        data: [2478, 5267, 734, 784, 433],
                    },
                ],
            },
            options: {
                title: {
                    display: true,
                    text: "Các Sản Phẩm Bán Chạy trong tháng",
                    position: "bottom",
                },
            },
        });
    </script>
    <script>
        const showSettingView = document.querySelector(".show_setting");
        let isShow = false;
        showSettingView.addEventListener("click", (e) => {
            switch (isShow) {
                case false:
                    document
                        .querySelector(".option_details")
                        .classList.add("show_setting-info");
                    isShow = true;
                    break;

                default:
                    document
                        .querySelector(".option_details")
                        .classList.remove("show_setting-info");
                    isShow = false;
                    break;
            }
        });

        $(".cb_user-access").on("click", (e) => {
            if (!e.target.checked) {
                $(".users_access").addClass("hidden");
            } else {
                $(".users_access").removeClass("hidden");
            }
        });

        $(".cb_total-price").on("click", (e) => {
            if (!e.target.checked) {
                $(".sales_progress").addClass("hidden");
            } else {
                $(".sales_progress").removeClass("hidden");
            }
        });

        $(".cb_total-order").on("click", (e) => {
            if (!e.target.checked) {
                $(".order_count").addClass("hidden");
            } else {
                $(".order_count").removeClass("hidden");
            }
        });
        $(".cb_table-details").on("click", (e) => {
            if (!e.target.checked) {
                $(".card_details-container").addClass("hidden");
            } else {
                $(".card_details-container").removeClass("hidden");
            }
        });

        $(".cb_bar-chart").on("click", (e) => {
            if (!e.target.checked) {
                $(".barchart-container").addClass("hidden");
            } else {
                $(".barchart-container").removeClass("hidden");
            }
        });
        $(".cb_pie-chart").on("click", (e) => {
            if (!e.target.checked) {
                $(".piechart-container").addClass("hidden");
            } else {
                $(".piechart-container").removeClass("hidden");
            }
        });
        $("#sellect_all").on("click", (e) => {
            const checkboxs = document.querySelectorAll(".cb_item");
            for (let i = 0; i < checkboxs.length; i++) {
                checkboxs[i].checked = e.target.checked;
            }
        });
    </script>
</div>
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="../assets/libs/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="../assets/libs/popper.js/dist/umd/popper.min.js"></script>
<script src="../assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="../assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="../assets/extra-libs/sparkline/sparkline.js"></script>
<!--Wave Effects -->
<script src="../dist/js/waves.js"></script>
<!--Menu sidebar -->
<script src="../dist/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="../dist/js/custom.min.js"></script>
<!-- this page js -->
<script src="../assets/extra-libs/multicheck/datatable-checkbox-init.js"></script>
<script src="../assets/extra-libs/multicheck/jquery.multicheck.js"></script>
<script src="../assets/extra-libs/DataTables/datatables.min.js"></script>
<script>
    /****************************************
     *       Basic Table                   *
     ****************************************/
    $('#zero_config').DataTable();
</script>
</body>
</html>
