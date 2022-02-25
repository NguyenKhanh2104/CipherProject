<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản lý</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/logo-icon.jpg">
    <link rel="stylesheet" type="text/css" href="../assets/extra-libs/multicheck/multicheck.css">
    <link href="../assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
    <link href="../dist/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../styleAdmin/style.css">
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <style>
        input#find_item {
            width: 187px;
        }
        .table td, .table th {
            padding: 0.6rem;
            vertical-align: top;
            /* margin-top: -14px; */
            border-top: 1px solid #dee2e6;
        }
    </style>
</head>
<body>
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
    <jsp:include page="sidebar.jsp"/>
    <jsp:include page="top-bar.jsp"/>

    <div class="right_wrapper" style="flex: 8;margin-left: 17%">
        <div class="right">
            <div class="right_content">
                <div class="view_option">
                    <div class="option_details">
                        <div>
                            <input checked class="cb_no" type="checkbox" name=""/>
                            <label>STT</label>
                        </div>
                        <div>
                            <input checked class="cb_img" type="checkbox" name=""/>
                            <label>Ảnh</label>
                        </div>
                        <div>
                            <input checked class="cb_name" type="checkbox"/>
                            <label>Tên</label>
                        </div>
                        <div>
                            <input checked class="cb_usergroup" type="checkbox" name=""/>
                            <label>Nhóm Người Dùng</label>
                        </div>
                        <div>
                            <input checked class="cb_email" type="checkbox" name=""/>
                            <label>Email</label>
                        </div>
                        <div>
                            <input
                                    checked
                                    class="cb_date-created"
                                    type="checkbox"
                                    name=""
                            />
                            <label>Ngày Tạo</label>
                        </div>
                        <div>
                            <input checked class="cb_action" type="checkbox" name=""/>
                            <label>Thao Tác</label>
                        </div>
                        <div>
                            <input
                                    checked
                                    class="cb_user-status"
                                    type="checkbox"
                                    name=""
                            />
                            <label>Trạng Thái</label>
                        </div>
                    </div>
                    <button class="show_setting">Tùy Chọn Hiển Thị</button>
                </div>
                <!--  -->

                <!--  -->
                <div class="caption">
                    <div>
                        <h4>Tất Cả Người Dùng</h4>
                    </div>
                    <div id="seachUser" style="margin : 10px 10px">
                        <input
                                placeholder="Nhập thông tin user cần tìm"
                                class="find_item"
                                id="find_item"
                                type="text"
                        />
                    </div>
                </div>
                <!--  -->
                <div class="table_wrapper">
                    <div class="action_bar mb-1">
                        <div class="select">
                            <select name="action">
                                <option value="">Tác Vụ</option>
                                <option value="recyle">Xóa</option>
                                <option value="active">Kích hoạt</option>
                                <option value="inactive">Hủy kích hoạt</option>
                            </select>
                            <button class="btn_apply">Thực Hiện</button>
                        </div>
                        <div class="select-search__field">
                            <select name="action">
                                <option value="Lọc">Lọc</option>
                                <option value="day">Ngày</option>
                                <option value="month">Tháng</option>
                                <option value="year">Năm</option>
                            </select>
                            <button class="btn_apply">Thực Hiện</button>
                        </div>
                    </div>
                    <table class="table table-hover">
                        <thead class="check" style="margin: 0px 5px 0px 5px">
                        <tr>
                            <th><input type="checkbox" name="" id="sellect_all"/></th>
                            <th class="thead">UserID</th>
                            <th class="thead" style="margin-left: 100px">UserKey</th>
                            <th class="thead">UserName</th>
                            <th class="thead" style="margin-left: 100px">Password</th>
                            <th class="thead">Email</th>
                            <th class="thead">Phone</th>
                            <th class="thead">Role</th>
                            <th class="thead">Public Key</th>
                            <th colspan="3" class="th_action">Option</th>
                        </tr>
                        </thead>
                        <tbody id="table">
                        <c:forEach items="${listU}" var="o">
                            <tr>
                                <td><input type="checkbox" class="cb_item"/></td>
                                <td>${o.id}</td>
                                <td>${o.key}</td>
                                <td>${o.username}</td>
                                <td>${o.password}</td>
                                <td>${o.email}</td>
                                <td>${o.phone}</td>
                                <td>${o.role}</td>
                                <td>${o.password}</td>
                                <td class="button_action-container td_action">
                                    <button class="btn_action btn_quick-edit">
                                        <a href="user-setting.jsp">Cài Đặt</a>
                                    </button>
                                    <button class="btn_action btn_user-delete">
                                        <a href="">Xóa</a>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <div class="action_bar mt-1">
                        <div class="select">
                            <select name="action">
                                <option value="recyle">Tác Vụ</option>
                                <option value="recyle">Xóa</option>
                                <option value="active">Kích hoạt</option>
                                <option value="inactive">Hủy kích hoạt</option>
                            </select>
                            <button class="btn_apply">Thực Hiện</button>
                        </div>
                        <div class="select-search__field">
                            <select name="action">
                                <option value="">Lọc</option>
                                <option value="day">Ngày</option>
                                <option value="month">Tháng</option>
                                <option value="year">Năm</option>
                            </select>
                            <button class="btn_apply">Thực Hiện</button>
                        </div>
                    </div>
                    <!--  -->
                </div>
                <!--  -->
            </div>
        </div>
    </div>
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
