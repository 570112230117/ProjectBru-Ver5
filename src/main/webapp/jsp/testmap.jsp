<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
      #map {
        height: 20cm;
        width: 40cm;
        margin: 0;
        padding: 0;
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
    <div class="container">
      <h2>Map</h2>
      <!-- Trigger the modal with a button -->
      <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

      <!-- Modal -->
      <div class="modal fade" id="myModal" style="max-width: 50cm;">

        <div style="margin-left:22%; margin-top: 3%">

          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Modal Header</h4>

            </div>
            <div id="map" class="modal-body">


            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>

  <script>
    var map;
    var markers = [];

    function initMap() {
      var haightAshbury = { lat: 13.72917, lng: 100.52389 };

      map = new google.maps.Map(document.getElementById('map'), {
        zoom: 7,
        center: haightAshbury,
        mapTypeId: 'terrain'
      });

      map.addListener('click', function (event) {
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

  </html>