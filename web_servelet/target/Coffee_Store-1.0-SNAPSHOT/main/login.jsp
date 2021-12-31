<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    />
    <title>Đăng nhập</title>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/css/bootstrap.min.css"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="assets/css/styles.min.css"/>
    <meta name="java-servlet-login" content="943711010190-tbtu1urd81cru4lb7qmnk2pg0ml0dafi.apps.googleusercontent.com">
</head>
<style>
    #login-box {
        max-width: 500px;
        margin: 0 auto;
        margin-top: 25px !important;
        border-radius: 12px;
        overflow: hidden;
        background: #fff;
        -webkit-box-shadow: 0 6px 30px rgba(0, 0, 0, 0.2);
        -moz-box-shadow: 0 6px 30px rgba(0, 0, 0, 0.2);
        box-shadow: 0 6px 30px rgba(0, 0, 0, 0.2);
    }

    .login-box-header {
        background-color: #fff;
        text-align: center;
        padding: 18px 25px 15px;
        border: none;
        border-bottom: 1px solid #e0e0e0;
    }

    .login-box-content {
        padding: 20px 20px 10px;
        background-color: #fff;
    }

    .social-login-link {
        text-decoration: none;
        color: #fff;
        margin-top: 10px;
    }

    .fb-login {
        background-color: #1a538a;
    }

    .gp-login {
        background-color: #db4437;
        margin-top: 10px;
    }

    .login-box-content i {
        padding: 11px 20px;
        color: #fff;
        font-size: 18px;
    }

    .box-shadow {
        box-shadow: 0 2px 2px 0 rgba(41, 48, 59, 0.24),
        0 0 2px 0 rgba(41, 48, 59, 0.12);
        border-radius: 5px;
    }

    .social-login-link:hover {
        text-decoration: none;
        color: #fff;
    }

    .login-box-seperator {
        flex: 1 0 auto;
        min-width: 1px;
        border-top: 1px solid #dedfe0;
        height: 1px;
    }

    .username {
        border-radius: 5px;
        color: #29303b;
        font-size: 18px;
        height: auto;
        padding: 11px 10px 12px 40px;
    }

    .form-control {
        box-shadow: none;
        font-size: 16px;
        padding: 10px 12px;
        transition: border-color 0.08s ease-in-out, box-shadow 0.08s ease-in-out;
    }

    .email-login {
        padding: 10px 20px;
    }

    #submit-id-submit {
        margin-top: 0;
        height: 46px;
        background-color: #1a8a6f;
        border: 0;
        color: #fff;
        margin-bottom: 8px;
        padding-top: 0;
        padding-bottom: 0;
    }

    .submit-row {
        padding: 10px 20px;
        text-align: center;
    }

    #login-box-footer p,
    .label-text {
        color: #8b8b8b;
    }

    #forgot-password-link {
        color: #2474c1;
        text-decoration: none;
    }

    #login-box-footer {
        text-align: center;
        border-top: 1px solid #dedfe0;
    }

    #register-link {
        color: #2474c1;
        padding: 0 10px;
        text-decoration: none;
    }

    #submit-id-submit:hover {
        background-color: #198269;
    }

    .login-clean {
        background: #f1f7fc;
        padding: 80px 0;
    }

    .login-clean form {
        max-width: 320px;
        width: 90%;
        margin: 0 auto;
        background-color: #fff;
        padding: 40px;
        border-radius: 4px;
        color: #505e6c;
        box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.1);
    }

    .login-clean .illustration {
        text-align: center;
        padding: 0 0 20px;
        font-size: 100px;
        color: #f4476b;
    }

    .login-clean form .form-control {
        background: #f7f9fc;
        border: none;
        border-bottom: 1px solid #dfe7f1;
        border-radius: 0;
        box-shadow: none;
        outline: 0;
        color: inherit;
        text-indent: 8px;
        height: 42px;
    }

    .login-clean form .btn-primary {
        background: #f4476b;
        border: none;
        border-radius: 4px;
        padding: 11px;
        box-shadow: none;
        margin-top: 26px;
        text-shadow: none;
        outline: 0 !important;
    }

    .login-clean form .btn-primary:active,
    .login-clean form .btn-primary:hover {
        background: #eb3b60;
    }

    .login-clean form .btn-primary:active,
    .login-dark form .btn-primary:active {
        transform: translateY(1px);
    }

    .login-clean form .forgot,
    .login-dark form .forgot {
        display: block;
        text-align: center;
        font-size: 12px;
        color: #6f7a85;
        opacity: 0.9;
        text-decoration: none;
    }

    .login-clean form .forgot:active,
    .login-clean form .forgot:hover,
    .login-dark form .forgot:active,
    .login-dark form .forgot:hover {
        opacity: 1;
        text-decoration: none;
    }

    .login-dark {
        height: 1000px;
        background: url(../../assets/img/star-sky.jpg) 0 0 / cover #475d62;
        position: relative;
    }

    .login-dark form {
        max-width: 320px;
        width: 90%;
        background-color: #1e2833;
        padding: 40px;
        border-radius: 4px;
        transform: translate(-50%, -50%);
        position: absolute;
        top: 50%;
        left: 50%;
        color: #fff;
        box-shadow: 3px 3px 4px rgba(0, 0, 0, 0.2);
    }

    .login-dark .illustration {
        text-align: center;
        padding: 15px 0 20px;
        font-size: 100px;
        color: #2980ef;
    }

    .login-dark form .form-control {
        background: 0 0;
        border: none;
        border-bottom: 1px solid #434a52;
        border-radius: 0;
        box-shadow: none;
        outline: 0;
        color: inherit;
    }

    .login-dark form .btn-primary {
        background: #214a80;
        border: none;
        border-radius: 4px;
        padding: 11px;
        box-shadow: none;
        margin-top: 26px;
        text-shadow: none;
        outline: 0;
    }

    .login-dark form .btn-primary:active,
    .login-dark form .btn-primary:hover {
        background: #214a80;
        outline: 0;
    }
</style>
<body
        style="
      height: 100vh;
      background: linear-gradient(var(--blue), var(--cyan)), var(--blue);
    "
>
<div class="container" style="margin-top: 40px; height: 510px">
    <!-- Start: Login Box [En] -->
    <form method="post" action="/login"
          class="d-flex flex-column justify-content-center"
          id="login-box"
          style="margin-top: 15px; height: 480px; border-style: none"
    >
        <div class="login-box-header">
            <h4
                    style="
              color: rgb(139, 139, 139);
              margin-bottom: 0px;
              font-weight: 400;
              font-size: 35px;
              height: 61px;
            "
            >
                Đăng nhập
            </h4>
        </div>
        <div class="container" style="height: 74px; padding-top: 10px">
            <div class="row" style="height: 44px">
                <div class="col" style="height: 44px">
                    <div class="fb-login box-shadow">
                        <a
                                class="d-flex flex-row align-items-center social-login-link"
                                href="#"
                                style="height: 50px; padding: 0px"
                        ><i
                                class="fa fa-facebook"
                                style="
                      margin-left: 0px;
                      padding-right: 20px;
                      padding-left: 22px;
                      width: 56px;
                    "
                        ></i
                        >Facebook</a
                        >
                    </div>
                </div>
                <div class="col">
                    <div class="gp-login box-shadow" style="height: 50px">
                        <a
                                class="d-flex flex-row align-items-center social-login-link"
                                style="
                    margin-bottom: 0px;
                    height: 40px;
                    padding-bottom: 0px;
                    padding-left: 10px;
                    padding-top: 10px;
                  "
                                href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/main/login-sucess.jsp&response_type=code
    &client_id=943711010190-tbtu1urd81cru4lb7qmnk2pg0ml0dafi.apps.googleusercontent.com&approval_prompt=force"><i
                                class="fa fa-google"
                                style="color: rgb(255, 255, 255); width: 56px"></i
                        >Google+</a>
                    </div>
                </div>
            </div>
        </div>
        <div
                class="d-flex flex-row align-items-center login-box-seperator-container"
        >
            <div class="login-box-seperator"></div>
            <div class="login-box-seperator-text">
                <p
                        style="
                margin-bottom: 0px;
                padding-left: 10px;
                padding-right: 10px;
                font-weight: 400;
                color: rgb(201, 201, 201);
              "
                >
                    or
                </p>
            </div>
            <div class="login-box-seperator"></div>
        </div>
        <div class="email-login" style="background-color: #ffffff">
            <input
                    style="height: 50px"
                    type="username"
                    name="username"
                    class="username-input form-control"
                    style="margin-top: 10px"
                    required=""
                    placeholder="Tên Đăng Nhập"

            /><input
                style="height: 50px; margin-top: 10px"
                type="password"
                name="password"
                class="password-input form-control"
                style="margin-top: 10px"
                placeholder="Mật khẩu"
        />
        </div>
        <div class="submit-row" style="margin-bottom: 8px; padding-top: 0px">
            <button
                    class="btn btn-primary btn-block box-shadow"
                    id="submit-id-submit"
                    type="submit"
            >
                Đăng nhập
            </button>
            <div class="d-flex justify-content-between">
                <div
                        class="form-check form-check-inline"
                        id="form-check-rememberMe"
                >
                    <input
                            class="form-check-input"
                            type="checkbox"
                            id="formCheck-1"
                            for="remember"
                            style="cursor: pointer"
                            name="check"
                    /><label class="form-check-label" for="formCheck-1"
                ><span class="label-text">Lưu mật khẩu</span></label
                >
                </div>
                <a id="forgot-password-link" href="#">Quên mật khẩu?</a>
            </div>
        </div>
        <div
                id="login-box-footer"
                style="padding: 10px 20px; padding-bottom: 23px; padding-top: 18px"
        >
            <p style="margin-bottom: 0px">
                Chưa có tài khoản?<a id="register-link" href="#">Đăng Kí!</a>
            </p>
        </div>
    </form>
    <!-- End: Login Box [En] -->
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>