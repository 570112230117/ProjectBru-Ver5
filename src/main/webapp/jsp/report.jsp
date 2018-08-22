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
        <div class="container">
            <div class="box box-default">
                <div class="form-group">
                    <h3>รายงานข้อมูลการทำงาน</h3>
                    <br>
                    <button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-tasks"></i> ข้อมูลการทำงาน</button>
                    <button type="button" class="btn btn-secondary"><i class="glyphicon glyphicon-list-alt"></i> ทำเบียนอุปกรณ์</button>
                    <button type="button" class="btn btn-success"><i class="glyphicon glyphicon-usd"></i> สรุปงานซ่อม / ค่าซ่อมบำรุง</button>
                    <button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-stats"></i> จำนวนอุปกรณ์</button>
                    <button type="button" class="btn btn-warning"><i class="glyphicon glyphicon-file"></i> สถิติการซ่อมบำรุง</button>
                </div>
                <br>
                <table id="report" class="table table-striped table-bordered" style="width:100%">

                    <!-- Header Table -->
                    <thead>
                        <tr>
                            <th>วันที่แจ้ง</th>
                            <th>ชื่ออุปกรณ์</th>
                            <th>ชื่อผู้แจ้ง</th>
                            <th>ปัญหา</th>
                            <th>สาเหตุ / วิธีแก้ไข</th>
                            <th>ผู้ดำเนินการ</th>
                            <th>ค่าใช้จ่าย</th>
                            <th>สถานะ</th>
                        </tr>
                    </thead>
                    <!-- Footer Table -->
                    <tfoot>
                        <tr>
                            <th>วันที่แจ้ง</th>
                            <th>ชื่ออุปกรณ์</th>
                            <th>ชื่อผู้แจ้ง</th>
                            <th>ปัญหา</th>
                            <th>สาเหตุ / วิธีแก้ไข</th>
                            <th>ผู้ดำเนินการ</th>
                            <th>ค่าใช้จ่าย</th>
                            <th>สถานะ</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </body>

    <script>
        $(document).ready(function () {
            var table = $('#report').DataTable({
                "sAjaxSource": "/testtabelrepairmen",                
                "sAjaxDataProp": "",
                "order": [[0, "DESC"]],
                "aoColumns": [
                    { "mData": "repairDate" },
                    { "mData": "" },
                    { "mData": "repairName" },
                    { "mData": "repairWaste" },
                    { "mData": "" },
                    { "mData": "name" },
                    { "mData": "" },
                    { "mData": "" },
                ]
            })
        });
    </script>

    </html>