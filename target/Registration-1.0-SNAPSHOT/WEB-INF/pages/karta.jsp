<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Test - Leaflet</title>

    <link rel="shortcut icon" type="image/x-icon" href="docs/images/favicon.ico" />

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css" integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ==" crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js" integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw==" crossorigin=""></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <style>
        #mapid{
            margin: auto;
        }
    </style>

</head>
<body>
${"asd"}



<div id="mapid" style="width: 900px; height: 500px;"></div>

<%--<div id="map" style="width: 900px; height: 500px;"></div>--%>
<div id="AllUser"></div>


<script>

    var mymap = L.map('mapid').setView([49.8442201, 24.0338814], 15);

    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(mymap);

    // L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
    //     maxZoom: 18,
    //     attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
    //     '<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
    //     'Imagery © <a href="http://mapbox.com">Mapbox</a>',
    //     id: 'mapbox.streets'
    // }).addTo(mymap); //another layer

    L.marker([49.84422, 24.03388])
        .addTo(mymap)
        .bindPopup("<b>Hello world!</b><br />I am a popup.");



    var popup = L.popup()
    //     .setLatLng([49.84, 24.03])
    //     .setContent("I am a standalone popup.")
    //     .openOn(mymap);

    // function onMapClick() {
    //     $.ajax({
    //         url: 'popup',
    //         type: 'GET',
    //         success: function (list) {
    //             for (let obj of list) {
    //                 let $p = $('<p/>', {text: obj.id + " | " + obj.name});
    //                 $('AllUser').append($p);
    //                 // popup
    //                 //     .setContent($p)
    //                 //     .openOn(mymap);
    //
    //             }
    //         },
    //         error: function () {
    //             alert("errroooorr!!!!");
    //         }
    //     })
    //
    //
    //
    // }
    // mymap.on('click', function(){
    //     $('#AllUser').empty();
    //     $.ajax({
    //         url: '/popup',
    //         type: 'GET',
    //         success: function (list) {
    //             var $p;
    //             for (let obj of list) {
    //                 $p = $('<p/>', {text: obj.id + " | " + obj.name});
    //
    //
    //             }
    //             popup.setContent($p).openOn(mymap);
    //         },
    //         error: function () {
    //             alert("errroooorr!!!!");
    //         }
    //     });
    // });

    // mymap.on('click',function (e) {
    //     if (crosshairs_enabled === true) {
    //         showMarker(e.latlng.lat,e.latlng.lng);
    //         crosshairBut(false);
    //         console.log("Coordinates -   "+e.latlng.lng, e.latlng.lat)
    //         // coordinate(e.latlng.lng, e.latlng.lat);
    //         // document.getElementById('lng').value = e.latlng.lng;
    //         // document.getElementById('lat').value = e.latlng.lat;
    //         popup
    //             .setContent('<p>Hello world!<br />This is a nice popup.</p>')
    //             .openOn(mymap);
    //
    //     }
    //
    // });
    var x;
    var y;
    mymap.on('click', function (e) {
        x = e.latlng.lat;
        y = e.latlng.lng;
        // popup
        //     .setLatLng([x, y])
        //     .setContent('<p>Coordinate x - '+x+'<br>'+'Coordinate y - '+ y+'</p>')
        //     .openOn(mymap);
        // console.log(x, y);
        $.ajax({
            url: '/popup',
            type: 'GET',
            success: function (list) {
                var $p;
                for (let obj of list) {
                    $p = $('<p/>', {text: obj.id + " | " + obj.name});
                }
                $('#AllUser').append($p);


            },
            error: function () {
                alert("errroooorr!!!!");
            }
        });
    });

    // mymap.on('click', function(){
    //     // $('#AllUser').empty();
    //     $.ajax({
    //         url: '/popup',
    //         type: 'GET',
    //         success: function (list) {
    //             var $p;
    //             for (let obj of list) {
    //                 $p = $('<p/>', {text: obj.id + " | " + obj.name});
    //
    //
    //             }
    //             popup
    //                 .setLatLng([x, y])
    //                 .setContent($p)
    //                 .openOn(mymap);
    //
    //         },
    //         error: function () {
    //             alert("errroooorr!!!!");
    //         }
    //     });
    // });






    // var greenIcon = L.icon({
    //     iconUrl: 'leaf-green.png',
    //     shadowUrl: 'leaf-shadow.png',
    //
    //     iconSize:     [38, 95], // size of the icon
    //     shadowSize:   [50, 64], // size of the shadow
    //     iconAnchor:   [22, 94], // point of the icon which will correspond to marker's location
    //     shadowAnchor: [4, 62],  // the same for the shadow
    //     popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
    // });

    // L.marker().addTo(mymap);


</script>



</body>
</html>








<%--<button id="getLatLon">getLatLon</button>--%>
<%----%>
<%--<script type="application/javascript">--%>
    <%--$("#getLatLon").click(function () {--%>
        <%--getLatLon();--%>
    <%--});--%>
<%--</script>--%>