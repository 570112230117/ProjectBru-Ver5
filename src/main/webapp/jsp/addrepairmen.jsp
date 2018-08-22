<%@page import="com.bru.model.LoginBean"%>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <jsp:include page="../layout/menu.jsp"></jsp:include>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Insert title here</title>
            <link href="/css/repair.css" rel="stylesheet">
            <%
	LoginBean bean = null;
	bean = (LoginBean) request.getAttribute("repairmenBean");
%>
        </head>

        <body>
            <form name="updaterepairmen1" id="updaterepairmen1" action="/updaterepairmen1" method="post">
                <div class="container" style="margin-top: 1cm; margin-bottom: 11cm">
                    <input type="hidden" name="Id" value="<%=bean.getId()%>">
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
                                        <label>ชื่อช่างซ่อม</label>
                                        <input type="text" class="form-control" id="name" name="name" placeholder="ชื่อ - สกุล" value="<%=bean.getName()%>">
                                    </div>
                                    <div class="form-group">
                                        <label>ที่อยู่<span style="color: red;">*</span></label>
                                        <textarea class="form-control" id="address" rows="3" name="address"><%=bean.getAddress()%></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>เบอร์โทร</label>
                                        <input type="text" class="form-control" id="phone" name="phone" placeholder="เบอร์โทร" value="<%=bean.getPhone()%>">
                                    </div>
                                    <div class="form-group">
                                        <label>เพศ</label>
                                        <div class="radio">
                                            <label><input type="radio" name="gender" id="male" value="ชาย" <%if (bean.getGender().equals( "ชาย")) { out.print("checked ='checked'"); }%> > ชาย</label>
                                        </div>
                                        <div class="radio">
                                            <label><input type="radio" name="gender" id="female" value="หญิง" <%if (bean.getGender().equals( "หญิง")){ out.print( "checked ='checked'"); }%> > หญิง</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>วันเกิด</label>
                                        <input type="date" class="form-control" id="birthday" name="birthday" placeholder="วันเกิด" value="<%=bean.getBirthday()%>">
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
                                        <fieldset disabled>
                                            <label>วันที่เข้างาน</label>
                                            <input type="date" class="form-control" id="work" name="work" placeholder="วันที่เข้างาน" value="<%=bean.getWork()%>">
                                    </div>
                                    <div class="form-group">
                                        <label>ตำแหน่ง</label>
                                        <select class="form-control" id="position" disabled="disabled">
                                          <option value="1"><%=bean.getRole()%></option></select>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Username</label>
                                        <input type="text" class="form-control" id="username" name="username" placeholder="Enter email" value="<%=bean.getUsername()%>">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" value="<%=bean.getPassword()%>">
                                    </div>
                                    <div class="form-group">
                                        <label>สถานะการทำงาน</label>
                                        <div class="radio">
                                            <label><input type="radio" name="status" id="working" value="1" <%if (bean.getStatus().equals( "1")) { out.print("checked ='checked'"); }%> />ใช้งาน </label>
                                        </div>
                                        <div class="radio">
                                            <label><input type="radio" name="status" id="resign" value="2" <%if (bean.getStatus().equals( "2")) { out.print("checked ='checked'"); }%> />ออก</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="pull-right">
                        <button type="submit" class="btn btn-primary">บันทึกข้อมูล</button>
                        <button type="submit" class="btn btn-default" onclick="window.location.href='/add'">ยกเลิก</button>
                    </div>
                </div>
            </form>
        </body>
        <jsp:include page="../layout/footer.jsp"></jsp:include>

        </html>