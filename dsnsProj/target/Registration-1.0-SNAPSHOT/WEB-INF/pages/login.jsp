<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@include file="head/head.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Авторизація</title>
</head>
<body>

<div class="body1">
    <%@include file="head/menu.jsp"%>
<h1>Аторизуватись</h1>
<center>
<c:url var="loginUrl" value="/login"/>
<form action="${loginUrl}" method="post">
    <input type="text" name="username" placeholder="username">
    <input type="password" name="password" placeholder="password">
    <input type="submit" value="login">
    <input type="hidden"
           name="${_csrf.parameterName}"
           value="${_csrf.token}"/>
    <c:if test="${param.error!=null}">
        <h2>Ваш логін або пароль хибний</h2>
    </c:if>
    <c:if test="${param.logout!=null}">
        <h2>Ви закінчили сесію</h2>
    </c:if>


</form>
</center>

<%@include file="head/footer.jsp"%>