<%@include file="head/head.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Додати новий гідрант</title>
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

    body {
        height: 100vh;
        width: 100vw;
        padding: 0;
        margin: 0;
    }
    #map {
        width: 70vw;
        height: 85vh;
    }
</style>
</head>
<body>

<div class="body1">
<%@include file="head/menu.jsp"%>

    <div class="parent">

        <div id='map'></div>
        <%--<button id="edit">Edit</button>--%>
        <button id="getLatLon">Coordinate</button>
        <%--<div class="regGidrant">--%>
        <div id="editForm">
            <form action="/saveGidrant" method="post">
                <%--String street_txt, int bud, String zrazok, int diametr, String typ, int spravnyi, int vkazivnyk, double x, double y--%>
                <input type="text" name="id" value="" id="idGidr" placeholder="id..." disabled><br>
                <input type="text" name="lng" value="" id="lng" placeholder="lng..." required><br>
                <input type="text" name="lat" value="" id="lat" placeholder="lat..." required><br>
                <input type="text" name="street_txt" placeholder="street_txt..." required><br>
                <input type="text" name="bud" placeholder="bud..." required><br>
                <input type="text" name="zrazok" placeholder="zrazok..." required><br>
                <input type="text" name="typ" placeholder="typ..." required><br>
                <input type="text" name="diametr" placeholder="diametr..." required><br>
                <input type="text" name="spravnyi" placeholder="spravnyi..." required><br>
                <input type="text" name="vkazivnyk" placeholder="vkazivnyk..." required><br>

                <input type="submit" id="addGidrant" value="Add gidrant">
                <input type="hidden"
                       name="${_csrf.parameterName}"
                       value="${_csrf.token}"/>
            </form>
            <%--</div>--%>
        </div>
    </div>
    <script src="js/var.js"></script>
    <script src="js/mapserver.js"></script>
    <script src="js/map.js"></script>

    <br>













<%@include file="head/footer.jsp"%>
