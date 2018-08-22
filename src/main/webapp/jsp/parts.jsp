<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <jsp:include page="../layout/menurepairmen.jsp"></jsp:include>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <link href="/css/repair.css" rel="stylesheet">

    </head>

    <body>
        <div class="container-fluid">
            <div class="box box-default">
                <div class="form-group">
                    <h3>
                        <div class="glyphicon glyphicon-list-alt"> ทะเบียนอุปกรณ์ </div>
                        <div align="center">
                            <a href="/addparts" type="button" class="btn btn btn-warning ">
                                <span class="glyphicon glyphicon-plus"></span>ทะเบียนอุปกรณ์</a>
                        </div>
                    </h3>
                </div>
                <br>
                <div class="form-group">
                    <table id="parts" class="table table-striped table-bordered" style="width:100%">

                        <!-- Header Table -->
                        <thead>
                            <tr>
                                <th>วันที่รับเข้าระบบ</th>
                                <th>รหัสอุปกรณ์</th>
                                <th>ชื่ออุปกรณ์</th>
                                <th>หมายเลขซีเรียล</th>
                                <th>อุปกรณ์ / ยี่ห้อ</th>
                                <th>การรับประกัน</th>
                                <th>ราคา</th>
                                <th>ผู้ใช้งานอุปกรณ์</th>
                                <th>ชื่อลูกค้า</th>
                                <th>รายละเอียด</th>
                            </tr>
                        </thead>
                        <!-- Footer Table -->
                        <tfoot>
                            <tr>
                                <th>วันที่รับเข้าระบบ</th>
                                <th>รหัสอุปกรณ์</th>
                                <th>ชื่ออุปกรณ์</th>
                                <th>หมายเลขซีเรียล</th>
                                <th>อุปกรณ์ / ยี่ห้อ</th>
                                <th>การรับประกัน</th>
                                <th>ราคา</th>
                                <th>ผู้ใช้งานอุปกรณ์</th>
                                <th>ชื่อลูกค้า</th>
                                <th>รายละเอียด</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>

    </body>

    <script>
        $(document).ready(function() {
            var table = $('#parts').DataTable({
                "sAjaxSource": "/partsjson",
                "sAjaxDataProp": "",
                "order": [
                    [0, "DESC"]
                ],
                "aoColumns": [{
                    "mData": "dateReceipt"
                }, {
                    "mData": "deviceId"
                }, {
                    "mData": "deviceName"
                }, {
                    "mData": "serialNumber"
                }, {
                    "mData": "brand"
                }, {
                    "mData": "warranty"
                }, {
                    "mData": "",
                    "mRender": function(data, type, full) {
                        return '<center><span class="label label-primary">' + full.price + '</span></center>';
                    }
                }, {
                    "mData": "deviceUser"
                }, {
                    "mData": "customerName"
                }, {
                    "mData": "note"
                }, ]
            })
        });
    </script>

    </html>