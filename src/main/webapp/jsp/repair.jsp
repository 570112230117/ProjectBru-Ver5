<%@page import="com.bru.model.RepairBean"%>
    <%@page import="com.bru.model.WarrantyBean"%>
        <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ page import="java.io.*,java.util.*"%>
                <%@ page import="javax.servlet.*,java.text.*"%>
                    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
                    <jsp:include page="../layout/menuuser.jsp"></jsp:include>
                    <html>

                    <head>
                        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        <title>Welcome to Repair</title>
                        <link href="/css/repair.css" rel="stylesheet">
                        <script src="/js/dropdown.js"></script>
                        <%
	WarrantyBean bean = null;
    RepairBean beanRe = null;
	
%>

                            <%
    bean = (WarrantyBean) request.getAttribute("a");
	beanRe = (RepairBean) request.getAttribute("beanRe");
%>
                    </head>

                    <body>
                        <div class="container" style="margin-top: 1cm; margin-bottom: 2cm">
                            <h3 align="center">แจ้งซ่อมเครื่องใช้ไฟฟ้า</h3>
                            <br>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="box box-primary">
                                        <div class="box-header with-border">
                                            <h3 class="box-title">ข้อมูลลูกค้า</h3>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlInput1">วันเวลาที่แจ้ง</label>
                                            <input type="text" id="repairDate" class="form-control" name="repairDate" disabled value="<%Date dNow = new Date(); SimpleDateFormat ft = new SimpleDateFormat(" dd-MM-yyyy HH:mm:ss ");out.print(ft.format(dNow));%>">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlInput1">ชื่อ-นามสกุล
											<span style="color: red;">*</span>
										</label>
                                            <input type="text" name="name" class="form-control" id="name" placeholder="ชื่อ-นามสกุล">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlTextarea1">ที่อยู่<span style="color: red;">*</span></label>
                                            <textarea class="form-control" id="address" rows="3" name="address"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlInput1">เบอร์โทรศัพท์
											<span style="color: red;">*</span>
										</label>
                                            <input type="number" name="phone" class="form-control" id="phone" placeholder="เบอร์โทรศัพท์">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleFormControlInput1">อีเมล</label>
                                            <input name="email" type="email" class="form-control" id="email" placeholder="อีเมล">
                                        </div>
                                        <div class="box box-success">
                                            <div class="box-header with-border">
                                                <h3 class="box-title">ข้อมูลสินค้า</h3>
                                            </div>
                                            <div class="form-group">
                                                <label>หมวดสินค้า</label>
                                                <select class="form-control" name="appliances" id="appliances">
                                                    <option value="">== กรุณาเลือก ==</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>ประเภทสินค้า</label>
                                                <select class="form-control" name="product" id="product">
                                                    <option value="">== กรุณาเลือก ==</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>ยี่ห้อ</label>
                                                <select class="form-control" name="brand" id="brand">
                                                    <option value="">== กรุณาเลือก ==</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">

                                    <div class="box box-info">
                                        <div class="box-header with-border">
                                            <h3 class="box-title">ปัญหา</h3>
                                        </div>
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label for="exampleFormControlTextarea1">หัวข้อเรื่องการแจ้งซ่อม
												<span style="color: red;">*</span>
											</label>
                                                <textarea class="form-control" id="Waste" rows="3" name="waste"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlTextarea1">รายละเอียดเพิ่มเติม</label>
                                                <textarea class="form-control" id="detail" rows="3" name="detail"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box box-warning ">
                                        <div class="box-header with-border ">
                                            <h3 class="box-title ">นัดวันซ่อม</h3>
                                        </div>
                                        <div class="box-body ">
                                            <div class="form-group ">
                                                <label for="exampleFormControlInput1 ">วันที่นัดซ่อม
												<span style="color: red; ">*</span>
											</label>
                                                <input type="date" name="appointment" class="form-control" id="appointment" placeholder="">
                                            </div>
                                            <div class=" form-group ">
                                                <small class="text-red ">*** รบกวนแจ้งวันนัดซ่อมในวันถัดไปของการแจ้งซ่อม</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div align="center">
                                <button type="submit " class="btn btn-success " onclick="insertConfirm() ">ยืนยัน</button>
                                <button type="button " class="btn btn-secondary " onclick="window.location.href='/' ">ยกเลิก</button>
                            </div>
                        </div>
                        <input id="map" type="hidden">
                    </body>

                    <jsp:include page="../layout/footer.jsp "></jsp:include>


                    <script>
                        //insert
                        function insertConfirm() {
                            var repairBean = {
                                repairDateStr: $('#repairDate').val(),
                                repairname: $('#name').val(),
                                repairAddress: $('#address').val(),
                                repairPhone: $('#phone').val(),
                                repairEmail: $('#email').val(),
                                repairAppliances: $('#appliances').val(),
                                repairProduct: $('#product').val(),
                                repairBrand: $('#brand').val(),
                                repairWaste: $('#Waste').val(),
                                repairDetail: $('#detail').val(),
                                repairAppointment: $('#appointment').val(),
                                latitude: lat,
                                longitude: long,
                            }
                            $.ajax({
                                type: "POST",
                                url: "/insertRepair",
                                contentType: "application/json; charset=utf-8",
                                data: JSON.stringify(repairBean),
                                dataType: "json",
                                success: function(msg) {
                                    console.log(msg)
                                    window.location.href = msg.page;
                                },
                                error: function() {
                                    window.location.href = "/";

                                }
                            });

                        }
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
                                    lat = position.coords.latitude;
                                    long = position.coords.longitude;
                                    console.log(lat)
                                    console.log(long)
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


                    </html>