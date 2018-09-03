<%@page import="com.bru.model.RepairBean"%>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
        <%
    RepairBean beanRe = null;
    RepairBean bean1 = null;
    RepairBean bean2 = null;
    RepairBean bean3 = null;
    RepairBean bean4 = null;
    RepairBean bean5 = null;
    RepairBean bean6 = null;
%>

            <%
    beanRe = (RepairBean) request.getAttribute("beanRe");
    bean1 = (RepairBean) request.getAttribute("bean1");
    bean2 = (RepairBean) request.getAttribute("bean2");
    bean3 = (RepairBean) request.getAttribute("bean3");
    bean4 = (RepairBean) request.getAttribute("bean4");
    bean5 = (RepairBean) request.getAttribute("bean5");
    bean6 = (RepairBean) request.getAttribute("bean6");
%>
                <jsp:include page="../commons/head.jsp"></jsp:include>

                <nav class="navbar navbar-inverse">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
                            <a href="#"><img src="/img/setting-spanner.png" width="42" height="42"></a>
                        </div>
                        <div class="collapse navbar-collapse" id="myNavbar">
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="/repair">บันทึกการแจ้งซ่อม</a></li>
                                <li><a href="/">รายการแจ้งซ่อมทั้งหมด</a></li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">ตรวจสอบสถานะ <span class="label label-danger"><%=beanRe.getRepairId() %></span><span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="/status1">รายการรอตรวจสอบข้อมูล <span class="label bg-aqua"><%=bean1.getRepairId()%></span></a></li>
                                        <li><a href="/status2">ส่งซ่อม <span class="label bg-black"><%=bean2.getRepairId()%></span></a></li>
                                        <li><a href="/status3">นำกลับมาซ่อม <span class="label bg-yellow"><%=bean3.getRepairId()%></span></a></li>
                                        <li><a href="/status4">ซ่อมเสร็จแล้ว <span class="label bg-green"><%=bean4.getRepairId()%></span></a></li>
                                        <li><a href="/status5">ซ่อมไม่ได้ <span class="label bg-red"><%=bean5.getRepairId()%></span></a></li>
                                        <li><a href="/status6">ยกเลิก <span class="label bg-red"><%=bean6.getRepairId()%></span></a></li>
                                    </ul>
                                </li>
                                <li><a href="/warranty">ตรวจสอบอายุประกัน</a></li>
                                <li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> เข้าสู่ระบบ</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>