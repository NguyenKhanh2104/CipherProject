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
            vertical-align: top;
            border-top: 1px solid #dee2e6;
            max-width: 400px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        /* Fix table head */
        .tableFixHead {
            overflow: auto;
            height: 450px;
        }

        .tableFixHead th {
            position: sticky;
            top: 0;
        }

        /* Just common table stuff. */
        table {
            border-collapse: collapse;
            width: 100%;
        }

        /*th, td { padding: 2px 4px; }*/
        th {
            background: #eee;
        }

        .open-button {
            background-color: #555;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            opacity: 0.8;
            position: fixed;
            bottom: 23px;
            right: 28px;
            width: 280px;
        }

        /* The popup form - hidden by default */
        .formPop {
            display: none;
            position: fixed;
            width: 870px;
            bottom: 21%;
            right: 17%;
            border: 3px solid #c4d4ee;
            border-radius: 10px;
            z-index: 9;
        }

        /* Add styles to the form container */
        .form-container {
            max-width: 870px;
            padding: 10px;
            background-color: white;
        }

        /* Set a style for the submit/login button */
        .form-container .btn {
            background-color: #04AA6D;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            width: 100%;
            margin-bottom: 10px;
            opacity: 0.8;
        }

        /* Add a red background color to the cancel button */
        .form-container .cancel {
            background-color: red;
        }

        .input-group-text {
            width: 110px;
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

                        <div class="formPop" id="myForm">
                            <form action="/admin/users/update" method="get" class="form-container">
                                <h3>Login</h3>
                                <div class="container">
                                    <div class="row">
                                        <div class="col">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">UserID</span>
                                                </div>
                                                <input type="text" value="${o.id}" class="form-control" placeholder=""
                                                       aria-label="Username" aria-describedby="basic-addon1">
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon2">UserKey</span>
                                                </div>
                                                <input type="text" value=${o.key} class="form-control" placeholder=""
                                                       aria-label="Username" aria-describedby="basic-addon1">
                                            </div>
                                        </div>
                                        <div class="w-100"></div>
                                        <div class="col">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon3">UserName</span>
                                                </div>
                                                <input type="text" value="" class="form-control" placeholder=""
                                                       aria-label="Username" aria-describedby="basic-addon1">
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon4">Password</span>
                                                </div>
                                                <input type="text" class="form-control" placeholder=""
                                                       aria-label="Username" aria-describedby="basic-addon1">
                                            </div>
                                        </div>
                                        <div class="w-100"></div>
                                        <div class="col">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon5">Email</span>
                                                </div>
                                                <input type="text" class="form-control" placeholder=""
                                                       aria-label="Username" aria-describedby="basic-addon1">
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon6">Phone</span>
                                                </div>
                                                <input type="text" class="form-control" placeholder=""
                                                       aria-label="Username" aria-describedby="basic-addon1">
                                            </div>
                                        </div>
                                        <div class="w-100"></div>
                                        <div class="col">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon7">City</span>
                                                </div>
                                                <input type="text" class="form-control" placeholder=""
                                                       aria-label="Username" aria-describedby="basic-addon1">
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon8">Distric</span>
                                                </div>
                                                <input type="text" class="form-control" placeholder=""
                                                       aria-label="Username" aria-describedby="basic-addon1">
                                            </div>
                                        </div>
                                        <div class="w-100"></div>
                                        <div class="col">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"
                                                          id="basic-addon9">AddressDetails</span>
                                                </div>
                                                <input type="text" class="form-control" placeholder=""
                                                       aria-label="Username" aria-describedby="basic-addon1">
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon10">Role</span>
                                                </div>
                                                <input type="text" class="form-control" placeholder=""
                                                       aria-label="Username" aria-describedby="basic-addon1">
                                            </div>
                                        </div>
                                        <div class="w-100"></div>
                                        <div class="col col6">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text label6" id="basic-addon111"
                                                          style="height: 36px">PublicKey</span>
                                                </div>
                                                <input style="height: 135px" readonly type="text"
                                                       class="form-control inputOrder" placeholder=""
                                                       aria-label="Username" aria-describedby="basic-addon1">
                                            </div>
                                        </div>
                                        <div class="col col7" style="display: flex;height: 60px">
                                            <button type="submit" class="btn" style="border-radius: 30px">Save</button>
                                            <button type="button" class="btn cancel" onclick="closeForm()"
                                                    style="border-radius: 30px">Close
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
                <!--  -->
            </div>
        </div>
    </div>
    <script src="./js/main.js"></script>

    <script src="js/dasboard.js"></script>
    <script>
        // function openForm() {
        //     document.getElementById("myForm").style.display = "block";
        // }
        //
        // function closeForm() {
        //     document.getElementById("myForm").style.display = "none";
        // }
    </script>
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