<%@page import="com.bru.model.RepairBean"%>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <jsp:include page="../layout/menuuser.jsp"></jsp:include>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>status4</title>
            <%
	RepairBean beanRe = null;
%>
                <%
	beanRe = (RepairBean) request.getAttribute("bean4");

%>
        </head>

        <body>
            <div class="container-fluid">
                <div class="box box-default">
                    <h3>
                        ตารางซ่อมเสร็จแล้ว <small>รวมทั้งหมด <span
					class="label bg-green"><%=beanRe.getRepairId()%></span> รายการ
				</small>
                    </h3>
                    <br>
                    <br>
                    <table id="employeesTable" class="table table-striped table-bordered" style="width: 100%">

                        <!-- Header Table -->
                        <thead>
                            <tr>
                                <th>วันเวลาที่แจ้ง</th>
                                <th>ชื่อ - นามสกุล</th>
                                <th>หัวข้อเรื่องการแจ้งซ่อม</th>
                                <th>สาเหตุ / วิธีแก้ไข</th>
                                <th>สถานะ</th>
                                <th>ตอบกลับ</th>

                            </tr>
                        </thead>
                        <!-- Footer Table -->
                        <tfoot>
                            <tr>
                                <th>วันเวลาที่แจ้ง</th>
                                <th>ชื่อ - นามสกุล</th>
                                <th>หัวข้อเรื่องการแจ้งซ่อม</th>
                                <th>สาเหตุ / วิธีแก้ไข</th>
                                <th>สถานะ</th>
                                <th>ตอบกลับ</th>

                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>



        </body>
        <script>
            $(document).ready(function() {
                var table = $('#employeesTable').DataTable({
                    "sAjaxSource": "/status44",
                    "sAjaxDataProp": "",
                    "order": [
                        [0, "DESC"]
                    ],
                    "aoColumns": [{
                        "mData": "repairDateStr"
                    }, {
                        "mData": "repairname"
                    }, {
                        "mData": "repairWaste"
                    }, {
                        "mData": "repairmenCause"

                    }, {
                        "mData": "",
                        "mRender": function(data, type, full) {
                            if (full.repairmenStatus == '0') {
                                return '<center><span class="label label-primary">' + 'แจ้งซ่อม' + '</span></center>';
                            } else if (full.repairmenStatus == '1') {
                                return '<center><span class="label label-info">' + 'รอตรวจสอบ' + '</span></center>';
                            } else if (full.repairmenStatus == '2') {
                                return '<center><span class="label label-default">' + 'ส่งซ่อม' + '</span></center>';
                            } else if (full.repairmenStatus == '3') {
                                return '<center><span class="label label-warning">' + 'นำกลับมาซ่อม' + '</span></center>';
                            } else if (full.repairmenStatus == '4') {
                                return '<center><span class="label label-success">' + 'ซ่อมเสร็จแล้ว' + '</span></center>';
                            } else if (full.repairmenStatus == '5') {
                                return '<center><span class="label label-danger">' + 'ซ่อมไม่ได้' + '</span></center>';
                            } else if (full.repairmenStatus == '6') {
                                return '<center><span class="label label-danger">' + 'ยกเลิก' + '</span></center>';
                            }
                        }
                    }, {
                        "mData": "repairmenId",

                    }, ]
                })
            });
        </script>

        </html>