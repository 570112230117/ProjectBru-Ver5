<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <style>
            #map {
                height: 100%;
            }
            
            html,
            body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
            
            #floating-panel {
                position: absolute;
                top: 10px;
                left: 25%;
                z-index: 5;
                background-color: #fff;
                padding: 5px;
                border: 1px solid #999;
                text-align: center;
                font-family: 'Roboto', 'sans-serif';
                line-height: 30px;
                padding-left: 10px;
            }
        </style>
    </head>

    <body>
        <div id="floating-panel">
            <input onclick="clearMarkers();" type=button value="Hide Markers">
            <input onclick="showMarkers();" type=button value="Show All Markers">
            <input onclick="deleteMarkers();" type=button value="Delete Markers">
        </div>
        <div id="map"></div>
        <p>Click on the map to add markers.</p>


        <script>
            // In the following example, markers appear when the user clicks on the map.
            // The markers are stored in an array.
            // The user can then click an option to hide, show or delete the markers.
            var map;
            var markers = [];

            function initMap() {
                var haightAshbury = {
                    lat: 13.72917,
                    lng: 100.52389
                };

                map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 7,
                    center: haightAshbury,
                    mapTypeId: 'terrain'
                });


                // This event listener will call addMarker() when the map is clicked.
                map.addListener('click', function(event) {
                    addMarker(event.latLng);
                });

                // Adds a marker at the center of the map.
                addMarker(haightAshbury);
            }

            // Adds a marker to the map and push to the array.
            function addMarker(location) {
                deleteMarkers();
                var marker = new google.maps.Marker({
                    position: location,
                    map: map,

                });
                markers.push(marker);
                console.log(marker.getPosition().lat());
                console.log(marker.getPosition().lng());

            }


            // Sets the map on all markers in the array.
            function setMapOnAll(map) {
                for (var i = 0; i < markers.length; i++) {
                    markers[i].setMap(map);
                }
            }

            // Removes the markers from the map, but keeps them in the array.
            function clearMarkers() {
                setMapOnAll(null);
            }

            // Shows any markers currently in the array.
            function showMarkers() {
                setMapOnAll(map);
            }

            // Deletes all markers in the array by removing references to them.
            function deleteMarkers() {
                clearMarkers();
                markers = [];
            }
        </script>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjUZj4cPYNcYb2MX45hFhdQyA5YBnFfc8&callback=initMap">
        </script>
    </body>

    </html>