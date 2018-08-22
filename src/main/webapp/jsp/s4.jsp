<%@page import="com.bru.model.RepairBean"%>
    <%@page import="com.bru.model.LoginBean"%>
        <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
            <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
            <jsp:include page="../layout/menurepairmen.jsp"></jsp:include>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Hello World</title>
            </head>
            <%
    LoginBean bean = null;
    RepairBean beanRe = null;
    RepairBean bean1 = null;
    RepairBean bean2 = null;
    RepairBean bean3 = null;
    RepairBean bean4 = null;
    RepairBean bean5 = null;
    RepairBean bean6 = null;
  
%>

                <%
    bean = (LoginBean) request.getSession().getAttribute("LoginUser");
    beanRe = (RepairBean) request.getSession().getAttribute("beanRe");
    bean1 = (RepairBean) request.getSession().getAttribute("bean1");
    bean2 = (RepairBean) request.getSession().getAttribute("bean2");
    bean3 = (RepairBean) request.getSession().getAttribute("bean3");
    bean4 = (RepairBean) request.getSession().getAttribute("bean4");
    bean5 = (RepairBean) request.getSession().getAttribute("bean5");
    bean6 = (RepairBean) request.getSession().getAttribute("bean6");
  %>

                    <body>
                        <div class="container-fluid">
                            <div class="box box-default">
                                <div>
                                    <h3>รายการแจ้งซ่อมทั้งหมด <small>รวมรายการแจ้งซ่อมทั้งหมด <span class="label label-danger"><%=beanRe.getRepairId() %></span> รายการ</small>
                                        <a href="#">
                                            <span class="btn btn-default pull-right">
								<span class="glyphicon glyphicon-plus"></span>เพิ่มข้อมูล</span>
                                        </a>
                                    </h3>
                                    <br>
                                    <div>
                                        <table id="employeesTable" class="table table-striped table-bordered" style="width:100%">

                                            <!-- Header Table -->
                                            <thead>
                                                <tr>
                                                    <th>วันที่แจ้งซ่อม</th>
                                                    <th>ชื่อ - นามสกุล</th>
                                                    <th>ประเภทสินค้า</th>
                                                    <th>หัวข้อเรื่องการแจ้งซ่อม</th>
                                                    <th>นัดวันซ่อม</th>
                                                    <th>สถานะ</th>
                                                    <th>ตอบกลับ</th>
                                                    <th>รายการเมนู</th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>วันที่แจ้งซ่อม</th>
                                                    <th>ชื่อ - นามสกุล</th>
                                                    <th>ประเภทสินค้า</th>
                                                    <th>หัวข้อเรื่องการแจ้งซ่อม</th>
                                                    <th>นัดวันซ่อม</th>
                                                    <th>สถานะ</th>
                                                    <th>ตอบกลับ</th>
                                                    <th>รายการเมนู</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal -->
                        <div class="modal fade" id="myModal" role="dialog">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">รายละเอียด</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div id="content">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <p><b>ข้อมูลปัญหา</b></p>
                                                    <table id="w0" class="table table-striped table-bordered detail-view">
                                                        <tbody>
                                                            <tr>
                                                                <th width="15%">วันที่เวลาแจ้ง</th>
                                                                <td id="date"></td>
                                                            </tr>
                                                            <tr>
                                                                <th width="15%">ชื่อ - นามสกุล</th>
                                                                <td id="name"></td>
                                                            </tr>
                                                            <tr>
                                                                <th width="15%">ที่อยู่</th>
                                                                <td id="repairAddress"></td>
                                                            </tr>
                                                            <tr>
                                                                <th width="15%">เบอร์โทรศัพท์</th>
                                                                <td id="repairPhone"></td>
                                                            </tr>
                                                            <tr>
                                                                <th width="15%">อีเมล</th>
                                                                <td id="repairEmail"></td>
                                                            </tr>
                                                            <tr>
                                                                <th width="15%">หมวดสินค้า</th>
                                                                <td id="repairAppliances"></td>
                                                            </tr>
                                                            <tr>
                                                                <th width="15%">ประเภทสินค้า</th>
                                                                <td id="repairProduct"></td>
                                                            </tr>
                                                            <tr>
                                                                <th width="15%">ยี่ห้อ</th>
                                                                <td id="repairBrand"></td>
                                                            </tr>
                                                            <tr>
                                                                <th width="15%">ปัญหา</th>
                                                                <td id="repairWaste"></td>
                                                            </tr>
                                                            <tr>
                                                                <th width="15%">รายละเอียดเพิ่มเติม</th>
                                                                <td id="repairDetail"></td>
                                                            </tr>
                                                            <tr>
                                                                <th width="15%">วันที่นัดซ่อม</th>
                                                                <td id="repairAppointment"></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <p><b>สาเหตุ / วิธีแก้ไข</b></p>
                                                    <table id="w1" class="table table-striped table-bordered detail-view">
                                                        <tbody>
                                                            <tr>
                                                                <th width="15%">ช่วงวันที่ซ่อม</th>
                                                                <td id="repairmenDate"></td>
                                                            </tr>
                                                            <tr>
                                                                <th width="15%">ช่างที่รับผิดชอบ</th>
                                                                <td id="repairmenId"></td>
                                                            </tr>
                                                            <tr>
                                                                <th width="15%">วันที่เสร็จ</th>
                                                                <td id="repairmenCompletion"></td>
                                                            </tr>
                                                            <tr>
                                                                <th width="15%">สาเหตุ / วิธีแก้ไข</th>
                                                                <td id="repairmenCause"></td>
                                                            </tr>
                                                            <tr>
                                                                <th width="15%">ค่าใช้จ่าย</th>
                                                                <td id="repairmenExpenses"></td>
                                                            </tr>
                                                            <tr>
                                                                <th width="15%">สถานะ</th>
                                                                <td id="repairmenStatus"></td>

                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="glyphicon glyphicon-off"></i> ปิด</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <input id="a" type="hidden">
                    </body>
                    <script>
                        $(document).ready(function() {
                            var table = $('#employeesTable').DataTable({
                                "sAjaxSource": "/status44",
                                "iDisplayLength": 25,
                                "sAjaxDataProp": "",
                                "order": [
                                    [0, "DESC"]
                                ],
                                "aoColumns": [{
                                        "mData": "repairDateStr",
                                        "sWidth": "100px"
                                    }, {
                                        "mData": "repairname",
                                        "sWidth": "100px",
                                    }, {
                                        "mData": "repairProduct",
                                        "sWidth": "100px",
                                    }, {
                                        "mData": "repairWaste",
                                        "sWidth": "300px",
                                    }, {
                                        "mData": "repairAppointment",
                                        "sWidth": "70px",
                                    }, {
                                        "mData": "",
                                        "sWidth": "70px",
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
                                        "sWidth": "70px",
                                    }, {
                                        "mData": "",
                                        "sWidth": "50px",
                                        "mRender": function(data, type, full) {
                                            return '<center><a href="/repairmen/' + full.repairId + '" ' + 'class="btn btn-warning btn-sm"><span class="glyphicon glyphicon-edit"></span>' + '</a> <a onclick="gotoUpdate(' + full.repairId + ')" class="btn btn-info btn-sm view_detail" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-file"></i>  ' + '</a></center>';
                                        }
                                    },

                                ]
                            })
                        });

                        function gotoUpdate(repairId) {
                            document.getElementById("a").value = repairId;
                            var beant = {
                                "test": $('#a').val()
                            };
                            $.ajax({
                                type: "POST",
                                url: "/model",
                                data: JSON.stringify(beant),
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function(msg) {
                                    console.log('ทำงานแล้ว')
                                    $('#date').text(msg.repairDateStr);
                                    $('#name').text(msg.repairname);
                                    $('#repairAddress').text(msg.repairAddress);
                                    $('#repairPhone').text(msg.repairPhone);
                                    $('#repairEmail').text(msg.repairEmail);
                                    $('#repairAppliances').text(msg.repairAppliances);
                                    $('#repairProduct').text(msg.repairProduct);
                                    $('#repairBrand').text(msg.repairBrand);
                                    $('#repairWaste').text(msg.repairWaste);
                                    $('#repairDetail').text(msg.repairDetail);
                                    $('#repairAppointment').text(msg.repairAppointment);
                                    $('#repairmenDate').text(msg.repairmenDate);
                                    $('#repairmenCompletion').text(msg.repairmenCompletion);
                                    $('#repairmenCause').text(msg.repairmenCause);
                                    $('#repairmenExpenses').text(msg.repairmenExpenses);
                                    $('#repairmenStatus').text(msg.repairmenStatus);
                                    $('#repairmenId').text(msg.repairmenId);
                                }
                            });

                        };
                    </script>

            </html>