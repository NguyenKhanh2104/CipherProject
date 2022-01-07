<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar">
    <div class="row" style="width: 250PX;padding: 10px;color: var(--light);border-color: var(--white);">
        <div class="col">
            <div>
                <a class="btn btn-primary"
                   data-toggle="collapse"
                   aria-expanded="true"
                   aria-controls="collapse-1"
                   href="#collapse-1"
                   role="button"
                   style="color: var(--white);font-weight: 600;font-style: normal;width: 100%;padding: 0;padding-bottom: 5px;padding-top: 10px;border-color: var(--white);border-bottom-color: var(--white);background: #172a74;margin-right: 0px;padding-right: 60px;text-align: center;">
                    GIÁ SẢN PHẨM
                </a>
                <div class="collapse show" id="collapse-1">
                    <c:forEach items="${categories}" var="category">
                        <c:if test="${category.status == 1}">
                            <div class="form-check"
                                 style="width: 100%;background: var(--white);padding-left: 30px;color: var(--gray);">
                                <input class="form-check-input" type="radio" id="formCheck-1">
                                <label class="form-check-label" for="formCheck-1"
                                       style="color: var(--gray);">${category.name}</label>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
