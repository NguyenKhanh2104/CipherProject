<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.nlu.model.User" %>

<%
  User user =(User) session.getAttribute("auth");
  if (user == null || !user.getRole().equals("admin")){
    response.sendRedirect("/");
  }
%>

<html>
  <head>
    <title>Dashboard</title>
    <meta charset="UTF-8" />
    <link rel="shortcut icon" href="/admin/images/webpage.svg" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style/dashboard.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
  </head>
  <body>
    <div class="body_container">
      <!-- ===***LEFT***=== -->
<%--    <jsp:include page="sidebar.jsp"/>--%>
      <div class="left_wrapper">
        <div class="left">
          <div class="dashboard_title">
            <img src="/admin/images/webpage.svg" class="img-icon" alt=""/>
            <h2><a href="dashboard.jsp">DASH BOARD</a></h2>
            <img
                    src="/admin/images/close.svg"
                    id="close-btn"
                    alt=""
                    class="img-icon"
            />
          </div>
          <div class="left_menu">
            <div class="menu">
              <div class="menu_title">
                <img src="/admin/images/received.svg" class="img-icon" alt=""/>
                <h4 class="active">Sản Phẩm</h4>
              </div>
              <div class="sub_menu">
                <a href="/admin/products.jsp">Tất Cả</a>
                <a href="/admin/product-new.jsp" class="active">Thêm Sản Phẩm</a>
                <a href="/admin/category.jsp">Doanh Mục</a>
              </div>
            </div>
            <div class="menu">
              <div class="menu_title">
                <img src="/admin/images/profile.svg" class="img-icon" alt=""/>
                <h4>Người Dùng</h4>
              </div>
              <div class="sub_menu">
                <a href="/admin/users.jsp">Quản Trị</a>
                <a href="/admin/new-admin">Thêm Người Dùng</a>
                <%--                    <a href="/admin/user-setting.jsp">Cài Đặt</a>--%>
                <%--                    <a href="/admin/customers.jsp">Khách Hàng</a>--%>
              </div>
            </div>
            <div class="menu">
              <div class="menu_title">
                <img src="/admin/images/box.svg" class="img-icon" alt=""/>
                <h4>Đơn Hàng</h4>
              </div>
              <div class="sub_menu">
                <a href="/admin/order.jsp">Tất Cả Đơn Hàng</a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- ===***END OF LEFT***=== -->

      <!-- ===***RIGHT***=== -->
      <div class="right_wrapper">
        <div class="right">
         <jsp:include page="top-bar.jsp"/>
          <!-- end of right topbar -->
          <div class="right_content">
            <div class="view_option">
              <div class="option_details">
                <div>
                  <input
                    checked
                    class="cb_user-access"
                    type="checkbox"
                    name=""
                  />
                  <label>User truy cập</label>
                </div>
                <div>
                  <input
                    checked
                    class="cb_total-price"
                    type="checkbox"
                    name=""
                  />
                  <label>Tổng tiền</label>
                </div>
                <div>
                  <input checked class="cb_total-order" type="checkbox" />
                  <label>Số order</label>
                </div>
                <div>
                  <input
                    checked
                    class="cb_table-details"
                    type="checkbox"
                    name=""
                  />
                  <label>Bảng chi tiết</label>
                </div>
                <div>
                  <input checked class="cb_bar-chart" type="checkbox" name="" />
                  <label>Biều đồ doanh thu</label>
                </div>
                <div>
                  <input checked class="cb_pie-chart" type="checkbox" name="" />
                  <label>Biều đồ sản phẩm bán chạy</label>
                </div>
              </div>
              <button class="show_setting">Tùy Chọn Hiển Thị</button>
            </div>
            <div>
              <h2
                class="shop_analyis-title"
                style="text-align: center; margin: 2rem auto"
              >
                <span
                  ><img src="./images/statistics.svg" class="img-icon" alt=""
                /></span>
                Thống Kê Cửa Hàng
              </h2>
            </div>

            <!--  -->
            <div class="option_container">
              <select name="" >
                <option value="">Thống kê theo</option>
                <option value="">Theo Tuần</option>
                <option value="">Theo Tháng</option>
                <option value="">Theo Năm</option>
              </select>
              <select name="" >
                <option value="">Đơn vị</option>
                <option value="">VND</option>
                <option value="">USD</option>
              </select>
            </div>

            <div class="card_container">
              <div class="users_access card bg_green color_light">
                <strong>
                  <img src="./images/customer.svg" alt="" class="img-icon" />
                  Số Lượng Truy Cập
                </strong>
                <div style="text-align: center">
                  <span class="value">100</span><br />
                </div>
              </div>
              <div class="sales_progress card bg_bluegray color_light">
                <strong>
                  <img src="./images/money.svg" class="img-icon" alt="" />
                  Số Tiền Bán Được
                </strong>
                <div style="text-align: center">
                  <span class="value">8,323,2332</span><br />
                </div>
              </div>
              <div class="order_count card bg_blue color_light">
                <strong>
                  <img src="./images/order.svg" alt="" class="img-icon" />
                  Số Order
                </strong>
                <div style="text-align: center">
                  <span class="value">123</span><br />
                </div>
              </div>
            </div>
            <!--  -->
            <div class="card_details-container">
              <div class="box shop_activities">
                <h2 class="">Hoạt Động</h2>
                <div class="">
                  <a>
                    <span>Tổng tiền </span>
                    <span>3.000.000VND</span>
                  </a>
                  <a>
                    <span>Số đơn hàng</span>
                    <span>23</span>
                  </a>
                  <a>
                    <span>Số sản phẩm</span>
                    <span>5</span>
                  </a>
                </div>
              </div>
              <div class="box warehouse_info">
                <h2>Thông tin kho</h2>
                <a>
                  <span>Tồn kho</span>
                  <span>12</span>
                </a>
                <a>
                  <span>Hết hàng</span>
                  <span>0</span>
                </a>
                <a>
                  <span>Sắp hết hàng</span>
                  <span>0</span>
                </a>
              </div>
              <div class="box products_info">
                <h2>Thông tin sản phẩm</h2>
                <a>
                  <span>Sản phẩm</span>
                  <span>49</span>
                </a>
                <a>
                  <span>Chưa phân loại</span>
                  <span>0</span>
                </a>
                <a>
                  <span>Đã đăng</span>
                  <span>0</span>
                </a>
                <a>
                  <span>Chưa đăng</span>
                  <span>0</span>
                </a>
              </div>
              <div class="box top_products">
                <h2>Sản phẩm bán chạy</h2>
                <a>
                  <span>Jordan 1 Mid</span>
                  <span>12</span>
                </a>
                <a>
                  <span>Air Force One</span>
                  <span>4</span>
                </a>
                <a>
                  <span>New balance MSX90GED</span>
                  <span>4</span>
                </a>
              </div>
            </div>

            <!--
             -->
            <div
              class="barchart-container"
              style="width: 40vw; margin: 3rem auto"
            >
              <canvas id="myChart" height="150px"></canvas>
            </div>
            <div
              class="piechart-container"
              style="width: 40vw; margin: 3rem auto"
            >
              <canvas id="pie-chart" height="200"></canvas>
            </div>
          </div>
        </div>
      </div>
      <!-- ===***END OF RIGHT***=== -->
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
  </body>
</html>
