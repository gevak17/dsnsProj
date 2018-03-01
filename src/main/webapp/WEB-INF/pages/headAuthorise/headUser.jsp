<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/security/tags" %>


<html>
<head>
    <style>
        body {
            background: #ffffee;
            height: 100%;
            width: 55%;
            margin: auto;
            background: url("http://apclinic.co.uk/wp-content/uploads/2013/09/Grey-Wood-Background.jpg");
            background-position: center;
            /*background-repeat: no-repeat;*/
        }
        h1{
            text-align: center;
        }
        .menu li{
            display: inline-flex;
            list-style: none;
        }
        a {
            text-decoration: none;
            padding: 5px;
            border: 1px black solid;
            border-radius: 10px;
            background: darkgrey;
            color: black;
        }

        a:hover {
            background: #786b59;
            color: #ffe;
        }
        .delete{
            padding: 1px;
        }
        .body2{
            background: url("https://cdn.shopify.com/s/files/1/1723/9103/products/0101-Wood-2x2_1024x1024.jpg?v=1487714922");
            background-position: center;
            height: 1000px;
            padding: 20px;
        }



    </style>
</head>
<body>
<div class="body">
    <ul class="menu">
        <%--<li><a href="/allUser">Show All User</a></li>--%>
        <t:authorize access="hasRole('ROLE_USER')">
            <li><a href="/logout">Exit</a></li>
        </t:authorize>


    </ul>
