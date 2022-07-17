<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    body {
        background-color: #f5f6fa;
        user-select: none;
    }

    center,
    .content {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

    .content {
        opacity: 0;
        visibility: hidden;
        width: 400px;
        height: 350px;
        background: white;
        border-radius: 3px;
        transition: .3s ease-in;
        box-shadow: 0 2px 12px 0 rgba(0, 0, 0, .4);
    }

    #click {
        display: none;
    }

    .click-me {
        display: block;
        width: 80px;

        background: #27ae60;

        color: white;
        text-align: center;

        border-radius: 3px;
        cursor: pointer;
        transition: .5s;
    }

    .click-me:hover {
        background: #219150;
    }


    #click:checked ~ .content {
        opacity: 1;
        visibility: visible;
    }

    .header {
        height: 68px;
        background: #27ae60;
        overflow: hidden;
        border-radius: 3px 3px 0 0;
        box-shadow: 0 2px 3px 0 rgba(0, 0, 0, .2);
    }

    .header h2 {
        color: white;
        padding-left: 32px;
        font-weight: normal;
    }

    .off-modal {
        position: absolute;
        right: 20px;
        top: 20px;
        color: #e8f7fc;
        font-size: 20px;
        font-weight: bold;
        cursor: pointer;
    }

    .off-close {
        font-size: 50px;
        color: #27ae60;
        font-weight: bold;
        height: 80px;
        width: 80px;
        border: 2px solid #27ae60;
        text-align: center;
        padding-top: 8px;
        padding-left: 16px;
        padding-right: 11px;
        border-radius: 50%;
        box-sizing: border-box;
        margin: 30px 0 0 160px;
    }

    p {
        padding-top: 10px;
        font-size: 19px;
        color: #1a1a1a;
        text-align: center;
    }

    .line {
        position: absolute;
        bottom: 60px;
        width: 100%;
        height: 1px;
        background: silver;
    }

    .close-btn {
        position: absolute;
        bottom: 8px;
        right: 18px;
        border: 1px solid #27ae60;
        border-radius: 3px;
        color: #27ae60;
        padding: 5px 12px;
        font-size: 18px;
        cursor: pointer;
    }

    .close-btn:hover {
        background: #27ae60;
        color: white;
        transition: .5s;
    }

    i.fas.fa-check {
        margin-top: 7px;
    }

    .main-container {
        width: 100%;
        min-height: 100vh;
    }

    .side-bar {
        background-color: #dcdde1;
    }

    .search-bar {
        padding: 1rem 0;
    }

    .product-shoe-info {
        background-color: white;
        margin-bottom: 20px;
        position: relative;
    }

    .product-shoe-info:hover {
        box-shadow: 4px 6px 3px 0px rgba(127, 143, 166, 0.75);
    }

    .discount-tag {
        position: absolute;
        top: 0;
        right: 0;
        margin: 20px;
        animation: big-big 1s ease-in-out 1s infinite alternate;
        /*transition: .2s ease-in-out;*/
    }

    .discount-tag span {
        font-size: 18px;
        color: red;
    }

    .fa-tags {
        color: red;
    }

    @keyframes big-big {
        from {
            transform: scale(1);
        }
        to {
            transform: scale(1.5);
        }
    }

    .linkInstall {
        border: 1px solid red;
        height: max-content;
        width: max-content;
        font-size: 32px;
        margin: auto;
    }

    u {
        color: #198754;
    }

    .signForm {
        margin-left: 50%;
        margin-top: 10%;
        width: 775px;
        padding: 40px;
        transform: translate(-50%, -50%);
        background: rgb(242 242 242);
        box-sizing: border-box;
        box-shadow: 0 15px 25px rgb(0 0 0 / 60%);
        border-radius: 10px;
    }

    button.btn.btn-success {
        height: fit-content;
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

<%--products--%>
<section class="ab-info-main py-md-5 py-4">
    <form class="signForm" action="SignController" method="post">
        <%=
        request.getAttribute("err") == null ? "" : request.getAttribute("err")
        %>
        <h2 style="text-align: center;color: green">Vui lòng nhập thông tin xác nhận tài khoản</h2>
        <div class="form-group row">
            <label for="staticEmail" class="col-sm-2 col-form-label">Dữ liệu ký : </label>
            <div class="col-sm-10">
                <input   type="text" readonly class="form-control-plaintext" id="staticEmail"
                       value="<%= request.getAttribute("key")%>">
                <button type="button" id="btnkey" style="float: right" onclick="copy"
                        class="right">Copy
                </button>
            </div>
        </div>
        <div class="form-group row">
            <label for="inputPassword" class="col-sm-2 col-form-label">Nhập chữ ký ở đây : </label>
            <div class="col-sm-10">
                <input type="password" name="signText" class="form-control" id="inputPassword" required
                       placeholder="Please enter sign">
            </div>
        </div>
        <div class="action" style="display: flex;
  justify-content: space-between">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModalLong">
                Hướng dẫn
            </button>
            <button type="submit" onclick="myFunction()" class="btn btn-success" style="height: fit-content;margin-left: 537px">
                Gửi
            </button>
            <div class="center">
                <input type="checkbox" id="click">
                <%--                <button type="submit" class="btn btn-success" style="background: #27ae60"></button>--%>

                <%--                <div class="submit">--%>
                <%--                    <button type="submit" class="btn btn-success">Gửi</button>--%>
                <%--                </div>--%>
                <div class="content">
                    <div class="header">


                    </div>
                    <label for="click" class="off-close"> <i class="fas fa-check"></i></label>
                    <p>Quá trình xác nhận mua hàng hoàn tất<br>
                        xin chân thành cảm ơn bạn đã đồng hành cùng shop

                    </p>
                    <div class="line"></div>
                    <label for="click" class="close-btn"><a href="/"> Close</a></label>
                </div>
            </div>
        </div>
    </form>
    <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Hướng dẫn xác nhận</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="text-align: left">
                    <u> Bước 1</u> : Để thực hiện bước xác nhận tài khoản để hoàn thành việc tạo đơn hàng cần tải và sử
                    dụng phần mềm
                    mã hoá đặt tại đây : <a href="/main/filedownload?filename=appSign.exe">Download</a> <br>
                    <u>Bước 2 </u>: Sau khi tải phần mềm, mở phần mềm vừa tải lên và chọn tab số 2 có tên Asysmetric<br>
                    <u> Bước 3 </u>: Nhấn chọn phương thức mã hoá (Encrypt) ở góc trái màn hình trong phần Mode<br>
                    <u> Bước 4</u> : Tiến hành nhập dãy ký tự đã được cung cấp khi người dùng tạo tài trên web vào phần
                    khoá riêng(primary Key)
                    tại góc trên bên phải màn hình<br>
                    <u> Bước 5</u>: Tiến hành nhập dãy dữ liệu ký(có thể coppy) hiển thị bên trong form ký vào phần nội
                    dung ký (Input) trong phần mềm<br>
                    <u> Bước 6</u> : Nhấn nút bắt đầu tạo chữ ký(Start) bên dưới góc phải màn hình để tiến hành tạo chữ
                    ký<br>
                    <u> Bước 7</u> : Sau khi hệ thống hoàn tất việc tạo chữ ký, nội dung chữ ký sẽ được hiển thị vào
                    phần nội dung xuất(Output) và
                    người dùng có thể chép lại nội dung ký và nhập lại vào ô nhập chữ ký trên trang web để xác minh
                    người dùng với web<br>
                    <u> Bước 8 </u>: Sau khi hoàn tất việc nhập chữ ký vào form, có thể nhấn nút gửi để gửi thông tin
                    chữ ký đến web
                    (nếu thành công hệ thống sẽ thông báo đến người dùng)<br>

                </div>
                <%--                <div class="modal-footer">--%>
                <%--                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
                <%--                    &lt;%&ndash;                    <button type="button" class="btn btn-primary">Save changes</button>&ndash;%&gt;--%>
                <%--                </div>--%>
            </div>
        </div>
    </div>

</section>


<jsp:include page="/main/footer.jsp"/>
<script type="text/javascript">
    var button = document.getElementById("staticEmail"),
        input = document.getElementById("btnKey");


    button.addEventListener("click", function(event) {
        event.preventDefault();
        input.select();
        document.execCommand("copy");
    });

</script>
<script>
    function myFunction() {
       var inputtf =  document.getElementById("inputPassword").value;
        if(inputtf.isEmpty()){
            alert("Vui lòng nhập chữ ký để xác nhận hoá đơn");
        }
        alert("Quá trình xác nhận mua hàng hoàn tất \nxin chân thành cảm ơn bạn đã đồng hành cùng shop");
    }
</script>
<script src="/main/script/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/js/bootstrap.bundle.min.js"></script>
</body>

</html>