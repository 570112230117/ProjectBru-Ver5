<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <style>
            /* Always set the map height explicitly to define the size of the div
     * element that contains the map. */
            
            #map {
                height: 100%;
            }
            /* Optional: Makes the sample page fill the window. */
            
            html,
            body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
        </style>
    </head>

    <body>
        <div id="map"></div>

        <script>
            // Note: This example requires that you consent to location sharing when
            // prompted by your browser. If you see the error "The Geolocation service
            // failed.", it means you probably did not give permission for the browser to
            // locate you.
            var map, infoWindow;

            function initMap() {
                map = new google.maps.Map(document.getElementById('map'), {
                    center: {
                        lat: -34.397,
                        lng: 150.644
                    },
                    zoom: 6
                });
                infoWindow = new google.maps.InfoWindow;

                // Try HTML5 geolocation.
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(function(position) {
                        var pos = {
                            lat: position.coords.latitude,
                            lng: position.coords.longitude
                        };
                        console.log(position.coords.latitude)
                        console.log(position.coords.longitude)
                        infoWindow.setPosition(pos);
                        infoWindow.setContent('ตำแหน่งของคุณ');
                        infoWindow.open(map);
                        map.setCenter(pos);
                    }, function() {
                        handleLocationError(true, infoWindow, map.getCenter());
                    });
                } else {
                    // Browser doesn't support Geolocation
                    handleLocationError(false, infoWindow, map.getCenter());
                }
            }

            function handleLocationError(browserHasGeolocation, infoWindow, pos) {
                infoWindow.setPosition(pos);
                infoWindow.setContent(browserHasGeolocation ?
                    'Error: The Geolocation service failed.' :
                    'Error: Your browser doesn\'t support geolocation.');
                infoWindow.open(map);
            }
        </script>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQOlr7gKrbdrCPrzBuAMnmdCvmM3uZlrw&callback=initMap">
        </script>
    </body>

    </html>