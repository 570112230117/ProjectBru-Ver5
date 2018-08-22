<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <jsp:include page="../layout/menu.jsp"></jsp:include>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <link href="/css/repair.css" rel="stylesheet">
    </head>

    <body>
        <div class="container" style="margin-top: 1cm; margin-bottom: 11cm">
            <h3 align="center">ฟอร์มกรอกข้อมูลช่างซ่อม</h3>
            <br>
            <div class="row">
                <div class="col-md-6">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">ข้อมูลส่วนตัว</h3>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <label>ชื่อ - สกุล</label>
                                <input type="text" class="form-control" id="name" placeholder="ชื่อ - สกุล">
                            </div>
                            <div class="form-group">
                                <label>ที่อยู่<span style="color: red;">*</span></label>
                                <textarea class="form-control" id="address" rows="3" name="address"></textarea>
                            </div>
                            <div class="form-group">
                                <label>เบอร์โทร</label>
                                <input type="text" class="form-control" id="phone" placeholder="เบอร์โทร">
                            </div>
                            <div class="form-group">
                                <label>เพศ</label>
                                <div class="radio">
                                    <label><input type="radio" name="optionsRadios" id="male" value="male">ชาย</label>
                                </div>
                                <div class="radio">
                                    <label><input type="radio" name="optionsRadios" id="female" value="female">หญิง</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>วันเกิด</label>
                                <input type="date" class="form-control" id="birthday" placeholder="วันเกิด">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="box box-danger">
                        <div class="box-header with-border">
                            <h3 class="box-title">การทำงาน</h3>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <label>วันที่เข้างาน</label>
                                <input type="date" class="form-control" id="work" placeholder="วันที่เข้างาน">
                            </div>
                            <div class="form-group">
                                <label>ตำแหน่ง</label>
                                <select class="form-control" id="position"><option value="">== กรุณาเลือกตำแหน่ง ==</option></select>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Username</label>
                                <input type="email" class="form-control" id="username" placeholder="Username">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" class="form-control" id="password" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <label>สถานะการทำงาน</label>
                                <div class="radio">
                                    <label><input type="radio" name="status" id="working" value="1" />ใช้งาน</label>
                                </div>
                                <div class="radio">
                                    <label><input type="radio" name="status" id="resign" value="2" />ออก</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="pull-right">
                <button type="submit" class="btn btn-primary" onclick="insertConfirm()">บันทึกข้อมูล</button>
                <button type="submit" class="btn btn-default" onclick="window.location.href='/add'">ยกเลิก</button>
            </div>
        </div>

    </body>


    <script>
        //radio
        var gender = "";
        $(document).ready(function() {
            $("#male").change(function() {
                gender = "ชาย";
            });
            $("#female").change(function() {
                gender = "หญิง";
            });
        });

        var status = "";
        $(document).ready(function() {
            $("#working").change(function() {
                status = "1";
            });
            $("#resign").change(function() {
                status = "2";
            });
        });

        //insert
        function insertConfirm() {
            var repairmenBean = {
                name: $('#name').val(),
                address: $('#address').val(),
                phone: $('#phone').val(),
                gender: gender,
                birthday: $('#birthday').val(),
                work: $('#work').val(),
                role: $('#position').val(),
                username: $('#username').val(),
                password: $('#password').val(),
                status: status,
            }

            $.ajax({
                type: "POST",
                url: "/insertrepairmen",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(repairmenBean),
                dataType: "json",
                success: function(msg) {
                    console.log(msg)
                    window.location.href = msg.page;
                },
                error: function() {
                    window.location.href = "add";
                }
            });

        }
    </script>

    <script>
        $(document).ready(function() {

            $.ajax({
                type: "GET",
                url: "/position",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(msg) {
                    for (var i = 0; i < msg.length; i++) {
                        $('#position').append('<option value="' + msg[i].id + '">' + msg[i].name + '</option>');
                    }
                }
            });
        });
    </script>

    <jsp:include page="../layout/footer.jsp"></jsp:include>

    </html>