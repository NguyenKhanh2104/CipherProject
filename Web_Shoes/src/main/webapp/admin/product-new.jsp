
<%@ page import="com.nlu.model.User" %>

<%
    User user =(User) session.getAttribute("auth");
    if (user == null || !user.getRole().equals("admin")){
        response.sendRedirect("/");
    }
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.nlu.service.CategoryService" %>
<%@ page import="com.nlu.model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="com.nlu.service.TagService" %>
<%@ page import="com.nlu.model.Tag" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Sản phẩm - Thêm mới</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style/main.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style/product-new.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/libraries/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/libraries/ckfinder/ckfinder.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="body_container">
    <!-- ===***LEFT***=== -->
    <jsp:include page="./sidebar.jsp"/>
    <!-- ===***END OF LEFT***=== -->

    <!-- ===***RIGHT***=== -->
    <div class="right_wrapper">
        <div class="right">
            <jsp:include page="top-bar.jsp"/>
            <!-- end of right topbar -->
            <div class="right_content">
                <form action="/new-product" method="post" class="new_product"  enctype="multipart/form-data" accept-charset="UTF-8"  >
                    <div class="form">
                        <div class="form_group">
                            <label for="product_name">Tên Sản Phẩm</label><br/>
                            <input

                                    name="product_name"
                                    required
                                    type="text"
                                    class="form_control"
                                    id="product_name"
                            />
                        </div>
                        <div class="form_group">
                            <label for="product_price">Giá (VND)</label><br/>
                            <input
                                    name="product_price"
                                    required
                                    type="number"
                                    class="form_control"
                                    id="product_price"
                            />
                        </div>
                        <div class="form_group" style="display: flex;align-items: center">
                            <div>
                                <label for="size">Size</label>
                                <input type="number" name="size" id="size">
                            </div>
                            <div>
                                <label for="quality">Số lượng</label>
                                <input type="number" name="quality" id="quality">
                            </div>
                            <div>
                                <label for="color">Nhóm màu</label>
                                <input type="text" name="color" id="color">
                            </div>
                        </div>
                        <div class="form_group">
                            <label>Miêu Tả Sản Phẩm</label>
                            <br/>
                            <textarea rows="20" cols="20" id="ckeditor"
                                      name="product_description">              </textarea>
                        </div>

                    </div>
                    <div class="section">
                        <div class="select_group">
                            <%
                                List<Category> categories = new CategoryService().findAll();
                                request.setAttribute("categories", categories);
                                List<Tag> tags = new TagService().findAll();
                                request.setAttribute("tags", tags);

                            %>

                            <div class="category">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingOne">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                data-bs-target="#collapseOne" aria-expanded="true"
                                                aria-controls="collapseOne">
                                            Doanh Mục
                                        </button>
                                    </h2>
                                    <div id="collapseOne" class="accordion-collapse collapse show"
                                         aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <c:forEach items="${categories}" var="item">
                                                <c:if test="${item.status == 1}">
                                                    <div class="category_control">
                                                        <input value="${item.id}" id="${item.name}" type="checkbox"
                                                               name="category"/>
                                                        <label for="${item.name}">${item.name}</label>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <button class="add_new-category">
                                    <a href="category.jsp">Thêm Mới</a>
                                </button>
                            </div>


                            <div style="margin: 1rem 0" class="tags category">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingTwo">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                                data-bs-target="#collapseTwo" aria-expanded="false"
                                                aria-controls="collapseTwo">
                                            Thẻ
                                        </button>
                                    </h2>
                                    <div style="transition: .3s ease-in all" id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                                         data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <c:forEach items="${tags}" var="item">
                                                <c:if test="${item.status == 1}">
                                                    <div class="category_control">
                                                        <input value="${item.id}" id="${item.name}" type="checkbox"
                                                               name="tag"/>
                                                        <label for="${item.name}">${item.name}</label>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="add_new-category">
                                    <input
                                            type="text"
                                            name=""
                                            id=""
                                            placeholder="Nhập tên thẻ mới"
                                    />
                                    <button
                                            style="
                        padding: 0.25rem;
                        color: white;
                        border: 1px solid transparent;
                        background-color: rgb(2, 131, 45);
                      "
                                    >
                                        Thêm
                                    </button>
                                </div>
                            </div>


                            <div class="img">
                                <input
                                        class="product_img"
                                        required
                                        type="file"
                                        name="product_img"
                                        id="product_img"
                                />
                            </div>
                            <div class="display_img">
                                <img alt="review img" id="review_product-img"/>
                            </div>
                            <div class="save_post">
                                <div>
                                    <input type="checkbox" value="saveAsCraft" name="craft" id="craft"/>
                                    <label for="craft">Lưu bản nháp</label>
                                </div>
                                <div>
                                    <input type="checkbox" value="saveAsPost" name="post" id="post"/>
                                    <label for="post">Đăng</label>
                                </div>

                                <div style="margin-top: 1rem">
                                    <button>Thực Hiện</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="add_size hidden">
                <form action="">
                    <div>
                        <label for="">Size</label>
                        <input type="number"/>
                    </div>
                    <div>
                        <label for="">Số Lượng</label>
                        <input type="number"/>
                    </div>
                    <div>
                        <button>Lưu</button>
                        <button class="btn_cancel">Hủy</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- ===***END OF RIGHT***=== -->
</div>
<script>
    const editor = CKEDITOR.replace('ckeditor');
    CKFinder.setupCKEditor(editor, 'libraries/ckfinder/');
</script>
<script>
    const btnEdit = document.getElementsByClassName("btn_edit");
    const productEditWrapper = document.querySelector(".edit_wrapper");
    const handleEdit = () => {
        productEditWrapper.style.display = "block";
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
    };
    for (let i = 0; i < btnEdit.length; i++) {
        btnEdit[i].addEventListener("click", () => handleEdit());
    }

    const btnCancel = document.querySelector(".btn_cancel");
    const btnAddSize = document.querySelector(".btn_add-size");

    btnCancel.addEventListener("click", () => {
        document.querySelector(".add_size").classList.add("hidden");
    });
    btnAddSize.addEventListener("click", () => {
        document.querySelector(".add_size").classList.remove("hidden");
    });


    const productImg = document.getElementById("product_img");
    const previewProductImg = document.getElementById("review_product-img");
    productImg.addEventListener("change", (e) => {
        previewProductImg.src = URL.createObjectURL(e.target.files[0]);
    });
</script>
</body>

<script src="./js/main.js"></script>
</html>
