<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>OrderDetail</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        .register {
            background: #3e5569;
            margin-top: 3%;
            padding: 3%;
        }

        .register-left {
            text-align: center;
            color: #fff;
            margin-top: 4%;
        }

        .register-left input {
            border: none;
            border-radius: 1.5rem;
            padding: 2%;
            width: 60%;
            background: #f8f9fa;
            font-weight: bold;
            color: #383d41;
            margin-top: 30%;
            margin-bottom: 3%;
            cursor: pointer;
        }

        .register-right {
            background: #f8f9fa;
            border-top-left-radius: 10% 50%;
            border-bottom-left-radius: 10% 50%;
        }

        .register-left img {
            margin-top: 15%;
            margin-bottom: 5%;
            width: 25%;
            -webkit-animation: mover 2s infinite alternate;
            animation: mover 1s infinite alternate;
        }

        @-webkit-keyframes mover {
            0% {
                transform: translateY(0);
            }
            100% {
                transform: translateY(-20px);
            }
        }

        @keyframes mover {
            0% {
                transform: translateY(0);
            }
            100% {
                transform: translateY(-20px);
            }
        }

        .register-left p {
            font-weight: lighter;
            padding: 12%;
            margin-top: -9%;
        }

        .register .register-form {
            padding: 10%;
            margin-top: 10%;
        }

        .btnRegister {
            float: right;
            margin-top: 10%;
            border: none;
            border-radius: 1.5rem;
            padding: 2%;
            background: #3e5569;
            color: #fff;
            font-weight: 600;
            width: 50%;
            cursor: pointer;
        }

        .register .nav-tabs {
            margin-top: 3%;
            border: none;
            background: #0062cc;
            border-radius: 1.5rem;
            width: 28%;
            float: right;
        }

        .register .nav-tabs .nav-link {
            padding: 2%;
            height: 34px;
            font-weight: 600;
            color: #fff;
            border-top-right-radius: 1.5rem;
            border-bottom-right-radius: 1.5rem;
        }

        .register .nav-tabs .nav-link:hover {
            border: none;
        }

        .register .nav-tabs .nav-link.active {
            width: 100px;
            color: #0062cc;
            border: 2px solid #0062cc;
            border-top-left-radius: 1.5rem;
            border-bottom-left-radius: 1.5rem;
        }

        .register-heading {
            text-align: center;
            margin-top: 8%;
            margin-bottom: -15%;
            color: #495057;
        }

        .form-group {
            display: flex;
        }

        .form-group label {
            margin: 8px;
        }
    </style>
</head>
<body>
<div class="container register">
    <div class="row" style="width: 125%">
        <div class="col-md-9 register-right" style="">
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <h3 class="register-heading">Order - Detail</h3>

                    <form action="/admin/orders/update" method="post">
                        <div class="row register-form">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>orderId </label>
                                    <input name="orderId" type="text" class="form-control" value="${orderDetail.orderId}"
                                           readonly/>
                                </div>
                                <div class="form-group">
                                    <label>Address </label>
                                    <input name="address" type="text" class="form-control" value="${orderDetail.address}"/>
                                </div>
                                <div class="form-group">
                                    <label>Date </label>
                                    <input type="text" name="date" class="form-control" value="${orderDetail.date}"/>
                                </div>
                                <div class="form-group">
                                    <label>Status </label>
                                    <input type="text" name="status" class="form-control" value="${orderDetail.status}"/>
                                </div>
                                <div class="form-group">
                                    <label>Note </label>
                                    <textarea class="form-control" style="height: fit-content" name="note"
                                    >${orderDetail.note}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>UserId </label>
                                    <input name="user_id" type="text" class="form-control" value="${orderDetail.user_id}"/>
                                </div>
                            </div>
                            <div class="col-md-6">

                                <div class="form-group">
                                    <label>Email </label>
                                    <input type="text" name="email" class="form-control" value="${orderDetail.email}"/>
                                </div>
                                <div class="form-group">
                                    <label>City </label>
                                    <input type="text" name="city"
                                           class="form-control" value="${orderDetail.city}"/>
                                </div>
                                <div class="form-group">
                                    <label>Phone </label>
                                    <input type="text" name="phone"
                                           class="form-control" value="${orderDetail.phone}"/>
                                </div>
                                <div class="form-group">
                                    <label>Sign </label>
                                    <div class="divPublic" style="width: 334px">
                                <textarea type="text" id="sign" style="word-wrap:break-word;height: fit-content" name="sign"
                                          class="form-control">${orderDetail.sign}
                                </textarea>

                                        <button type="button" id="btnSign" style="float: right;margin-top: 5px"
                                                onclick="copy"
                                                class="right btn btn-primary">Copy
                                        </button>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Data Sign </label>
                                    <div class="divPublic" style="width: 300px">
                                <textarea type="text" id="data" style="word-wrap:break-word;height: fit-content" name="dataSign"
                                          class="form-control">${orderDetail.dataSign}</textarea>
                                        <button type="button" id="btnData" style="float: right;margin-top: 5px"
                                                onclick="copy"
                                                class="right btn btn-primary">Copy
                                        </button>
                                    </div>
                                </div>

                                <button type="submit" class="btn btn-success">Save</button>
                                <button class="btnRegister"><a style="color: #fff"
                                                               href="/admin/orders">Back</a></button>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
</div>
</div>
</div>
<script type="text/javascript">
    var buttonSign = document.getElementById("btnSign"),
        inputSign = document.getElementById("sign");

    var buttonData = document.getElementById("btnData"),
        inputData = document.getElementById("data");
    buttonSign.addEventListener("click", function (event) {
        event.preventDefault();
        inputSign.select();
        document.execCommand("copy");
    });
    buttonData.addEventListener("click", function (event) {
        event.preventDefault();
        inputData.select();
        document.execCommand("copy");
    });
</script>

</body>
</html>
