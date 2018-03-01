<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ul class="menu">
    <li><a href="/">Головна</a></li>
    <t:authorize access="!hasRole('ROLE_USER')">
        <li><a href="/registration">Реєстрація</a></li>
    </t:authorize>
    <%--<li><a href="/allUser">Show All User</a></li>--%>
    <%--<li><a href="/user">User page</a></li>--%>
    <%--<li><a href="/admin">Admin page</a></li>--%>
    <t:authorize access="hasRole('ROLE_USER')">
        <li><a href="/user">Карта</a></li>
    </t:authorize>
    <%--<t:authorize access="hasRole('ROLE_USER')">--%>
        <%--<li><a href="/addGidrant">Додати новий гідрант</a></li>--%>
    <%--</t:authorize>--%>
    <%--<t:authorize access="hasRole('ROLE_USER')">--%>
    <li><a href="/allUser">Всі користувачі</a></li>
    <%--</t:authorize>--%>
    <t:authorize access="!hasRole('ROLE_USER')">
        <li><a href="/login">Увійти</a></li>
    </t:authorize>
    <t:authorize access="hasRole('ROLE_USER')">
        <li><a href="/logout">Вийти</a></li>
    </t:authorize>
    <%--<t:authorize access="hasRole('ROLE_ADMIN')">--%>
    <%--<li><a href="/admin">Admin page</a></li>--%>
    <%--</t:authorize>--%>
</ul>



