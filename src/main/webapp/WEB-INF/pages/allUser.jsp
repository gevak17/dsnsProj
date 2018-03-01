<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@include file="head/head.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Всі користувачі</title>
</head>
<body>

<div class="body1">
    <%@include file="head/menu.jsp"%>
<br><br>

<table>
    <tr>
        <%--username, password, pidrozdil_id, k_pidrozdil_id, sluzba_id, id_del--%>
        <th>id</th>
        <th>username</th>
        <%--<th>password</th>--%>
        <th>email</th>
        <th>name</th>
        <th>surname</th>
        <th>age</th>
        <th>pidrozdil_id</th>
    </tr>
    <c:forEach items="${allUser}"  var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <%--<td>${user.password}</td>--%>
            <td>${user.email}</td>
            <td>${user.name}</td>
            <td>${user.surname}</td>
            <td>${user.age}</td>
            <td>${user.pidrozdil_id}</td>

            <t:authorize access="hasRole('ROLE_USER')">
                <td><a class="delete" href="/delete-${user.id}">delete</a></td>
            </t:authorize>
        </tr>
    </c:forEach>
</table>
<%@include file="head/footer.jsp"%>