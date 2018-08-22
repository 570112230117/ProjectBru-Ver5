<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*"%>
        <%@ page import="javax.servlet.*,java.text.*"%>
            <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
            <jsp:include page="../layout/menurepairmen.jsp"></jsp:include>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Parts</title>
            </head>

            <body>
                <div class="container">
                    <h3>ทะเบียนอุปกรณ์ : <small class="text-red ">*** กรุณากรอกข้อมูลรายละเอียดอุปกรณ์ หากไม่มีขีดเครื่องหมาย (-)</small></h3><br>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                </div>
                                <div class="box-body">
                                    <div class="form-group">
                                        <label>วันที่รับเข้าระบบ :</label>
                                        <input type="text" class="form-control" id="dateReceipt" disabled value="<%Date dNow = new Date(); SimpleDateFormat ft = new SimpleDateFormat(" dd-MM-yyyy HH:mm:ss ");out.print(ft.format(dNow));%>">
                                    </div>
                                    <div class="form-group">
                                        <label>รหัสอุปกรณ์ :</label>
                                        <input type="text" class="form-control" id="deviceId" placeholder="รหัสอุปกรณ์">
                                    </div>
                                    <div class="form-group">
                                        <label>ชื่ออุปกรณ์ :</label>
                                        <input type="text" class="form-control" id="deviceName" placeholder="ชื่ออุปกรณ์">
                                    </div>
                                    <div class="form-group">
                                        <label>หมายเลขซีเรียล :</label>
                                        <input type="text" class="form-control" id="serialNumber" placeholder="หมายเลขซีเรียล">
                                    </div>
                                    <div class="form-group">
                                        <label>อุปกรณ์ / ยี่ห้อ :</label>
                                        <input type="text" class="form-control" id="brand" placeholder="อุปกรณ์ / ยี่ห้อ">
                                    </div>

                                </div>
                                <!-- /.box-body -->
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="box box-danger">
                                <div class="box-header with-border">
                                </div>
                                <div class="box-body">
                                    <div class="form-group">
                                        <label>การรับประกัน :</label>
                                        <input type="text" class="form-control" id="warranty" placeholder="การรับประกัน">
                                    </div>
                                    <div class="form-group">
                                        <label>ราคา :</label>
                                        <input type="text" class="form-control" id="price" placeholder="0">
                                    </div>
                                    <div class="form-group">
                                        <label>ผู้ใช้งานอุปกรณ์ :</label>
                                        <select class="form-control" name="repairmen" id="repairmen">
                                            <option value="">== กรุณาเลือก ==</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>ชื่อลูกค้า :</label>
                                        <select class="form-control" name="customer" id="customer">
                                            <option value="">== กรุณาเลือก ==</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>หมายเหตุ</label>
                                        <textarea class="form-control" id="note" rows="3" name=""></textarea>
                                    </div>
                                </div>
                                <!-- /.box-body -->
                            </div>
                        </div>

                    </div>
                    <div align="center">
                        <button type="submit " class="btn btn-success " onclick="insertConfirm() ">บันทึก</button>
                        <button type="button " class="btn btn-secondary " onclick="window.location.href='/part' ">ยกเลิก</button>
                    </div>
                </div>
            </body>

            <script>
                $(document).ready(function() {

                    $.ajax({
                        type: "GET",
                        url: "/all",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function(msg) {
                            for (var i = 0; i < msg.length; i++) {
                                $('#customer').append('<option value="' + msg[i].repairId + '">' + msg[i].repairname + '</option>');
                            }
                        }
                    });

                    $.ajax({
                        type: "GET",
                        url: "/tabelrepairmen",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function(msg) {
                            for (var i = 1; i < msg.length; i++) {
                                $('#repairmen').append('<option value="' + msg[i].id + '">' + msg[i].name + '</option>');
                            }
                        }
                    });

                });
                //
                function insertConfirm() {
                    var partsBean = {
                        dateReceipt: $('#dateReceipt').val(),
                        deviceId: $('#deviceId').val(),
                        deviceName: $('#deviceName').val(),
                        serialNumber: $('#serialNumber').val(),
                        brand: $('#brand').val(),
                        warranty: $('#warranty').val(),
                        price: $('#price').val(),
                        deviceUser: $('#repairmen').val(),
                        customerName: $('#customer').val(),
                        note: $('#note').val(),
                    }

                    $.ajax({
                        type: "POST",
                        url: "/insertparts",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify(partsBean),
                        dataType: "json",
                        success: function(msg) {
                            console.log(msg)
                            window.location.href = msg.page;
                        },
                        error: function() {
                            window.location.href = "/part";

                        }
                    });

                }
            </script>

            </html>