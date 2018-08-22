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