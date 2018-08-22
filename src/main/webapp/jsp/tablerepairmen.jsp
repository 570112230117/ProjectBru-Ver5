<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <jsp:include page="../layout/menu.jsp"></jsp:include>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
    </head>

    <body>
        <div class="container">
            <div class="box box-default">
                <div class="form-group">
                    <h3>รายการข้อมูลช่างซ่อม
                        <a href="/repairmen1" type="button" class="btn btn btn-primary pull-right">
                            <span class="glyphicon glyphicon-plus"></span> เพิ่มช่างซ่อมใหม่</a>
                    </h3>
                </div>
                <br>
                <div class="form-group">
                    <table id="tabelrepairmen" class="table table-striped table-bordered" style="width:100%">

                        <!-- Header Table -->
                        <thead>
                            <tr>
                                <th>รหัส</th>
                                <th>ชื่อช่าง</th>
                                <th>Address</th>
                                <th>Username</th>
                                <th>Phone</th>
                                <th>Status</th>
                                <th>วันที่เข้างาน</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <!-- Footer Table -->
                        <tfoot>
                            <tr>
                                <th>รหัส</th>
                                <th>ชื่อช่าง</th>
                                <th>Address</th>
                                <th>Username</th>
                                <th>Phone</th>
                                <th>Status</th>
                                <th>วันที่เข้างาน</th>
                                <th>Action</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </body>


    <script>
        $(document).ready(function() {
            var table = $('#tabelrepairmen').DataTable({
                "sAjaxSource": "/tabelrepairmen",
                "sAjaxDataProp": "",
                "order": [
                    [0, "asc"]
                ],
                "aoColumns": [{
                        "mData": "id",
                        "sWidth": "1px"
                    }, {
                        "mData": "name",
                        "sWidth": "100px"
                    }, {
                        "mData": "address",
                        "sWidth": "100px"
                    }, {
                        "mData": "username",
                        "sWidth": "50px"
                    }, {
                        "mData": "phone",
                        "sWidth": "30px"
                    }, {
                        "mData": "",
                        "sWidth": "20px",
                        "mRender": function(data, type, full) {
                            if (full.status == 'ใช้งาน') {
                                return '<center><span class="label label-success">' + full.status + '</span></center>';
                            } else {
                                return '<center><span class="label label-danger">' + full.status + '</span></center>';
                            }
                        }
                    }, {
                        "mData": "work",
                        "sWidth": "50px"
                    }, {
                        "mData": "",
                        "sWidth": "10px",
                        "mRender": function(data, type, full) {
                            return '<center><a href="/updaterepairmen/' + full.id + '" ' + 'class="btn btn-warning btn-sm"><span class="glyphicon glyphicon-edit"></span></a></center>';

                        }
                    },

                ]
            })
        });
    </script>

    </html>