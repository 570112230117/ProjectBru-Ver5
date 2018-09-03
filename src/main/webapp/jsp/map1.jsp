<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Marker Labels</title>
    <style>
        /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
        
        #map {
            height: 80%;
        }
        /* Optional: Makes the sample page fill the window. */
        
        html,
        body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQOlr7gKrbdrCPrzBuAMnmdCvmM3uZlrw&callback=initialize" type="text/javascript"></script>
    <script>
        var map;
        var markers = [];

        function initialize() {
            var haightAshbury = {
                lat: 13.72917,
                lng: 100.52389
            };

            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 10,
                center: haightAshbury,
            });

            map.addListener('click', function(event) {
                addMarker(event.latLng);
            });
            addMarker(haightAshbury);
        }

        function addMarker(location) {
            deleteMarkers();
            var marker = new google.maps.Marker({
                position: location,
                map: map,

            });
            markers.push(marker);
            console.log(marker.getPosition().lat());
            console.log(marker.getPosition().lng());
            var a = marker.getPosition().lat();
            console.log(a)
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
</head>

<body>
    <input id="pac-input" class="controls" type="text" placeholder="Search Box">
    <div id="map"></div>

</body>

</html>