<%@ page contentType="text/html;charset=UTF-8"  language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">
<head>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <style>
        .body1 {
            background: #ffffee;
            /*height: 100%;*/
            /*width: 100%;*/
        }
        h1, h2{
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
        input{
            width: 150px;
            padding: 10px;
            margin: 2px;
            border-radius: 10px;
        }
        button {
            /*width: 15vw;*/
            /*padding: 10px;*/
            margin: 1px;
            border-radius: 5px;
        }
        input:focus{
            background: antiquewhite;
        }
        table {
            border: 1px black inset;
        }
        tr {
            border: 1px black solid;
        }
        a:hover {
            background: #786b59;
            color: #ffe;
        }
        .delete{
            padding: 1px;
        }
        #addGidrant:hover{
            background: lawngreen;
            font-size: larger;
            transition: 0.7s;
        }
        .parent {
            max-width: 1920px;
            background-color: cadetblue;
            margin: 0 auto;
            display: flex;
            flex-direction: row;
            /*justify-content: space-between; */
        }
        #editForm{
            background: dimgrey;
            border: azure 2px solid;
        }
        #saveForm {
            background: slategray;
            border: azure 2px solid;
        }
        #getLatLon:hover {
            background: darkorange;
            transition: 0.5s;
        }
        #edit:hover {
            background: yellow;
            transition: 0.5s;
            margin: auto;
        }
        #save:hover {
            background: limegreen;
            transition: 0.5s;
            margin: auto;
        }
        h2{
            text-shadow: 2px 2px cadetblue;
        }
        /*#editForm{*/
            /*width: 150px;*/
        /*}*/

    </style>

    <!--http://esri.github.io/esri-leaflet/examples/geocoding-control.html-->


    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%--<link rel="shortcut icon" type="image/x-icon" href="favicon-32x32.png" />--%>

    <link rel="stylesheet" href="http://10.114.10.48:8080/sodu2016/lib/leaflet/leaflet.css" />
    <script src="http://10.114.10.48:8080/sodu2016/lib/leaflet/leaflet.js"></script>

    <!-- Load Esri Leaflet from CDN -->
    <script src="http://10.114.10.48:8080/sodu2016/lib/esri-leaflet-geocoder/esri-leaflet.js"></script>
    <link rel="stylesheet" href="http://10.114.10.48:8080/sodu2016/lib/esri-leaflet-geocoder/esri-leaflet-geocoder.css">
    <script src="http://10.114.10.48:8080/sodu2016/lib/esri-leaflet-geocoder/esri-leaflet-geocoder.js"></script>
    <script src="http://10.114.10.48:8080/sodu2016/lib/leaflet.wms.js" data-main="app"></script>
    <link rel="stylesheet" href="http://10.114.10.48:8080/sodu2016/lib/routing-machine/leaflet-routing-machine.css" />
    <script src="http://10.114.10.48:8080/sodu2016/lib/routing-machine/leaflet-routing-machine.js"></script>
    <link rel="stylesheet" href="http://10.114.10.48:8080/sodu2016/lib/control-geocoder/Control.Geocoder.css" />
    <script src="http://10.114.10.48:8080/sodu2016/lib/control-geocoder/Control.Geocoder.js"></script>
    <link rel="stylesheet" href="http://10.114.10.48:8080/sodu2016/lib/markercluster/MarkerCluster.css" />
    <link rel="stylesheet" href="http://10.114.10.48:8080/sodu2016/lib/markercluster/MarkerCluster.Default.css" />
    <script src="http://10.114.10.48:8080/sodu2016/lib/markercluster/leaflet.markercluster-src.js"></script>
    <link rel="stylesheet" href="http://10.114.10.48:8080/sodu2016/lib/Leaflet.PolylineMeasure/Leaflet.PolylineMeasure.css" />
    <script src="http://10.114.10.48:8080/sodu2016/lib/Leaflet.PolylineMeasure/Leaflet.PolylineMeasure.js"></script>
    <script src="http://10.114.10.48:8080/sodu2016/lib/jquery-3.2.1.min.js"></script>
    <script src="http://10.114.10.48:8080/sodu2016/lib/L.TileLayer.BetterWMS.js"></script>
    <script src="http://10.114.10.48:8080/sodu2016/lib/purl.js"></script>

    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
    <style>

       /* body {
            height: 100vh;
            width: 100vw;
            padding: 0;
            margin: 0;
        }*/
        #map {
             width: 80%;
             /*height: 85vh;*/
        }
    </style>
<title>Карта Львівської області</title>

</head>
<body>


<div class="body1">
    <%@include file="head/menu.jsp"%>

<%--<h1>Сторінка користувача</h1>--%>
<%--<p>This is page for authentificated users</p>--%>


<div class="parent">

    <div id='map'></div>
    <button id="getLatLon">Знайти координати</button>
    <div id="editForm">
        <h2>Змінити</h2>
        <form action="/editGidrant" method="post">
            <input type="text" name="lng" value="" id="lng" placeholder="lng..." required><br>
            <input type="text" name="lat" value="" id="lat" placeholder="lat..." required><br>
            <input type="text" name="street_txt" id="street_txt" placeholder="street_txt..." required><br>
            <input type="text" name="bud" id="bud" placeholder="bud..." required><br>
            <input type="text" name="zrazok" id="zrazok" placeholder="zrazok..." required size="1"><br>
            <input type="text" name="typ" id="typ" placeholder="typ..." required size="1"><br>
            <input type="text" name="diametr" id="diametr" placeholder="diametr..." required><br>
            <input type="number" name="spravnyi" id="spravnyi" placeholder="spravnyi..." min="0" max="1" required><br>
            <input type="number" name="vkazivnyk" id="vkazivnyk" placeholder="vkazivnyk..." min="0" max="1" required><br>
            <input type="hidden" name="id" id="idGidr"><br>

            <input type="submit" id="edit" value="Змінити">
            <input type="hidden"
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}"/>
        </form>
        


        
    </div>
    <div id="saveForm">
        <h2>Додати новий</h2>
        <form action="/saveGidrant" method="post">
            <input type="text" id="lng1" name="lng" placeholder="lng..." required><br>
            <input type="text" id="lat1" name="lat" placeholder="lat..." required><br>
            <input type="text" name="street_txt"  placeholder="street_txt..." required><br>
            <input type="text" name="bud"  placeholder="bud..." required ><br>
            <input type="text" name="zrazok"  placeholder="zrazok..." required  size="1"><br>
            <input type="text" name="typ"  placeholder="typ..." required size="1"><br>
            <input type="text" name="diametr"  placeholder="diametr..." required><br>
            <input type="number" name="spravnyi"  placeholder="spravnyi..." min="0" max="1" required><br>
            <input type="number" name="vkazivnyk"  placeholder="vkazivnyk..." min="0" max="1" required><br>
            <br>
            <input type="submit" id="save" value="Зберегти">
            <input type="hidden"
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}"/>
        </form>
    </div>
</div>
        <h3 style="text-align: right">Тут необхідно заповнити всі поля</h3>
<script src="js/var.js"></script>
<script src="js/mapserver.js"></script>
<script src="js/map.js"></script>

<br>
        <div id="sss"></div>
<center>
    <button id="btn">Всі користувачі</button>
    <div class="users"></div>
</center>



<%--<h4>Оберіть тип гідранта</h4>--%>
<%--<select>--%>
<%--<option>Справний</option>--%>
<%--<option>Не справний</option>--%>
<%--</select>--%>
<%--<a href="edit">edit gidrant</a>--%>

<script type="application/javascript">
//----------------------------------------------------------------------
    $("#getLatLon").click(function(){
        getLatLon();
    });

//----------------------------------------------------------------------
    $("#btn").click(function(){
        $('.users').empty();
        $.ajax({
            url: '/getAllUsers',
            type: 'GET',
            success: function (list) {
                for (let obj of list) {
                    let $p = $('<p/>', {text: obj.id + " | " + obj.name});
                    $('.users').append($p);
                }
            },
            error: function () {
                alert("errroooorr!!!!");
            }
        });
    });
//----------------------------------------------------------------------


</script>
<%@include file="head/footer.jsp"%>
<%--spring form--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!--%>
        <%--<sf:form action="/editGidrant" method="post" modelAttribute="emptyUser">\--%>
        <%--<input type="hidden" name="idGidr" value="" id="idGidr" placeholder="id..." disabled><br>--%>
        <%--<sf:input type="text" path="lng" value="" id="lng" placeholder="lng..." /><br>--%>
        <%--<sf:input type="text" path="lat" value="" id="lat" placeholder="lat..." /><br>--%>
        <%--<sf:input type="text" path="street_txt" id="street_txt" placeholder="street_txt..." /><br>--%>
        <%--<sf:input type="text" path="bud" id="bud" placeholder="bud..." /><br>--%>
        <%--<sf:input type="text" path="zrazok" id="zrazok" placeholder="zrazok..." size="1"/><br>--%>
        <%--<sf:input type="text" path="typ" id="typ" placeholder="typ..."  size="1"/><br>--%>
        <%--<sf:input type="text" path="diametr" id="diametr" placeholder="diametr..." /><br>--%>
        <%--<sf:input type="number" path="spravnyi" id="spravnyi" placeholder="spravnyi..." min="0" max="1"/><br>--%>
        <%--<sf:input type="number" path="vkazivnyk" id="vkazivnyk" placeholder="vkazivnyk..." min="0" max="1" /><br>--%>

        <%--<input type="submit" id="edit" value="Змінити">--%>
        <%--<input type="hidden"--%>
        <%--name="${_csrf.parameterName}"--%>
        <%--value="${_csrf.token}"/>--%>
        <%--</sf:form>--%>

<%--<div class="body1" style="float: left">--%>
    <%--<center>--%>
        <%--&lt;%&ndash;<iframe src="http://10.114.10.48:8080/sodu2016"&ndash;%&gt;--%>
        <%--&lt;%&ndash;width="70%" height="600px" frameborder="0" style="border:0" allowfullscreen></iframe>&ndash;%&gt;--%>

        <%--<table>--%>
            <%--<tr>--%>
                <%--<th>Gidrants</th>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<th><p> id | </p></th>--%>
                <%--<th><p>address | </p></th>--%>
                <%--<th><p>house</p></th>--%>
            <%--</tr>--%>
            <%--<c:forEach items="${AllGidrants}" var="gidrant">--%>
                <%--<tr>--%>
                    <%--<th>${gidrant.id}</th>--%>
                    <%--<th>${gidrant.address}</th>--%>
                    <%--<th>${gidrant.house}</th>--%>
                <%--</tr>--%>
            <%--</c:forEach>--%>
        <%--</table>--%>
    <%--</center>--%>
<%--</div>--%>


<!--        <form  onsubmit="return false">
            <button onclick="map.locate({setView: true, maxZoom: 18});">Click me</button>
            <button onclick="map.setView([49.8423, 24.02], 18);">Click me2</button>
        </form>-->
<%--</body>--%>
<%--</html>--%>
<%--<title>User page</title>--%>
<%--<h1>User page</h1>--%>
<%--<p>This is page for authentificated users</p>--%>
<%--${user}--%>
<%--<br>--%>
<%--<br>--%>
<%--<br>--%>
<%--private String address;
    private int house;
    private String zrazok;
    private String type;
    private int diametr;
    private String spravnist;
    private String vkazivnik;--%>
<%--<div style="text-align: center">--%>
    <%--<form action="/saveGidrant" method="post">--%>
        <%--<input type="text" name="address" placeholder="address...">--%>
        <%--<input type="number" name="house" placeholder="house..."><br>--%>
        <%--<input type="text" name="zrazok" placeholder="zrazok...">--%>
        <%--<input type="text" name="type" placeholder="type..."><br>--%>
        <%--<input type="number" name="diametr" placeholder="diametr...">--%>
        <%--<input type="text" name="spravnist" placeholder="spravnist..."><br>--%>
        <%--<input type="text" name="vkazivnik" placeholder="vkazivnik...">--%>
        <%--<input type="submit">--%>
        <%--<input type="hidden"--%>
                   <%--name="${_csrf.parameterName}"--%>
                   <%--value="${_csrf.token}"/>--%>
    <%--</form>--%>
<%--</div>--%>
<%--<center>--%>
<%--<div class="regGidrant">--%>
    <%--<form action="/saveGidrant" method="post">--%>
        <%--<input type="text" name="address" placeholder="address...">--%>
        <%--<input type="number" name="house" placeholder="house...">--%>
        <%--<input type="text" name="zrazok" placeholder="zrazok...">--%>
        <%--<input type="text" name="type" placeholder="type..."><br>--%>
        <%--<input type="number" name="diametr" placeholder="diametr...">--%>
        <%--<input type="text" name="spravnist" placeholder="spravnist...">--%>
        <%--<input type="text" name="vkazivnik" placeholder="vkazivnik..."><br>--%>
        <%--<input type="submit" value="Add gidrant">--%>
        <%--<input type="hidden"--%>
               <%--name="${_csrf.parameterName}"--%>
               <%--value="${_csrf.token}"/>--%>
    <%--</form>--%>
<%--</div>--%>
<%--</center>--%>
<%--<div class="body1" style="float: left">--%>
    <%--<center>--%>
    <%--&lt;%&ndash;<iframe src="http://10.114.10.48:8080/sodu2016"&ndash;%&gt;--%>
            <%--&lt;%&ndash;width="70%" height="600px" frameborder="0" style="border:0" allowfullscreen></iframe>&ndash;%&gt;--%>

    <%--<table>--%>
        <%--<tr>--%>
            <%--<th>Gidrants</th>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<th><p> id | </p></th>--%>
            <%--<th><p>address | </p></th>--%>
            <%--<th><p>house</p></th>--%>
        <%--</tr>--%>
        <%--<c:forEach items="${AllGidrants}" var="gidrant">--%>
            <%--<tr>--%>
                <%--<th>${gidrant.id}</th>--%>
                <%--<th>${gidrant.address}</th>--%>
                <%--<th>${gidrant.house}</th>--%>
            <%--</tr>--%>
        <%--</c:forEach>--%>
    <%--</table>--%>
    <%--</center>--%>
<%--</div>--%>




