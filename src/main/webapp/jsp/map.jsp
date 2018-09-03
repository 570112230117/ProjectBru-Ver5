<%@page import="com.bru.model.RepairBean"%>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <jsp:include page="../layout/menurepairmen.jsp"></jsp:include>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Map</title>
            <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
        </head>
        <%
    RepairBean bean = null;
    bean = (RepairBean) request.getAttribute("repairBean");
    %>
            <style>
                html,
                body {
                    height: 100%;
                    margin: 0;
                    padding: 0;
                }
                
                #map-canvas {
                    height: 70%;
                    width: 80%;
                    margin-left: auto;
                    margin-right: auto;
                }
            </style>

            <body>
                <h3 align="center">Google Maps</h3>
                <a href="/table" type="button" class="btn btn-warning" style="margin-left: 10%;">กลับ</a>
                <div class="form-group" style="margin-left: 10%;">
                    <h4>A : <small class="text-red ">ตำแหน่งลูกค้า</small></h4>
                    <h4>B : <small class="text-red ">ตำแหน่งร้านซ่อม</small></h4>
                </div>
                <div id="map-canvas">
                </div>

            </body>
            <script>
                function initMap() {

                    var lat = '<%=bean.getLatitude()%>';
                    var lng = '<%=bean.getLongitude()%>';
                    var a = 14.942534;
                    var b = 103.335546;

                    var pointA = new google.maps.LatLng(lat, lng),
                        pointB = new google.maps.LatLng(a, b),
                        myOptions = {
                            zoom: 7,
                            center: pointA
                        },
                        map = new google.maps.Map(document.getElementById('map-canvas'), myOptions),
                        // Instantiate a directions service.
                        directionsService = new google.maps.DirectionsService,
                        directionsDisplay = new google.maps.DirectionsRenderer({
                            map: map
                        }),
                        markerA = new google.maps.Marker({
                            position: pointA,
                        }),
                        markerB = new google.maps.Marker({
                            position: pointB,
                        });

                    // get route from A to B
                    calculateAndDisplayRoute(directionsService, directionsDisplay, pointA, pointB);
                }

                function calculateAndDisplayRoute(directionsService, directionsDisplay, pointA, pointB) {
                    directionsService.route({
                        origin: pointA,
                        destination: pointB,
                        travelMode: google.maps.TravelMode.DRIVING
                    }, function(response, status) {
                        if (status == google.maps.DirectionsStatus.OK) {
                            directionsDisplay.setDirections(response);
                        } else {
                            window.alert('ไม่มีข้อมูล');
                        }
                    });
                }

                initMap();
            </script>
            <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQOlr7gKrbdrCPrzBuAMnmdCvmM3uZlrw&callback=initMap" type="text/javascript"></script>

        </html>