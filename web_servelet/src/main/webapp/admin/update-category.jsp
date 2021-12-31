<%@ page import="com.nlu.model.User" %>

<%
    User user =(User) session.getAttribute("auth");
    if (user == null || !user.getRole().equals("admin")){
        response.sendRedirect("/");
    }
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.nlu.service.CategoryService" %>
<%@ page import="com.nlu.model.Category" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 0025 01 25 02021
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>skdfhklsdfh</h1>
<h1>${category.name}</h1>
<h5>${category.dateModify}</h5>
</body>
</html>
