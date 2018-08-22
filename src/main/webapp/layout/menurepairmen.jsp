<%@page import="com.bru.model.LoginBean"%>
    <%@page import="com.bru.model.RepairBean"%>
        <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
            <jsp:include page="../commons/head.jsp"></jsp:include>
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

                    <nav class="navbar navbar-inverse">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
                                <a class="navbar-brand" href="/">Logo</a>
                            </div>
                            <div class="collapse navbar-collapse" id="myNavbar">
                                <ul class="nav navbar-nav navbar-right">
                                    <li><a href="#">บันทึกการแจ้งซ่อม</a></li>
                                    <li><a href="/table">รายการแจ้งซ่อมทั้งหมด</a></li>
                                    <li class="dropdown">
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">ตรวจสอบสถานะ <span class="label label-danger"><%=beanRe.getRepairId() %></span>
                        <span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="/s1">รายการรอตรวจสอบข้อมูล <span class="label bg-aqua"><%=bean1.getRepairId()%></span></a></li>
                                            <li><a href="/s2">ส่งซ่อม <span class="label bg-black"><%=bean2.getRepairId()%></span></a></li>
                                            <li><a href="/s3">นำกลับมาซ่อม <span class="label bg-yellow"><%=bean3.getRepairId()%></span></a></li>
                                            <li><a href="/s4">ซ่อมเสร็จแล้ว <span class="label bg-green"><%=bean4.getRepairId()%></span></a></li>
                                            <li><a href="/s5">ซ่อมไม่ได้ <span class="label bg-red"><%=bean5.getRepairId()%></span></a></li>
                                            <li><a href="/s6">ยกเลิก <span class="label bg-red"><%=bean6.getRepairId()%></span></a></li>
                                        </ul>
                                    </li>
                                    <li><a href="/warrantyrepairmen">ตรวจสอบอายุประกัน</a></li>
                                    <li><a href="/part">ทะเบียนอุปกรณ์</a></li>
                                    <li><a href="/report">รายงาน</a></li>

                                    <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i> (<%=bean.getName() %>) <span class="caret"></span></a>
                                        <ul id="w6" class="dropdown-menu">
                                            <li><a href="personal"><i class="glyphicon glyphicon-pencil"></i> ข้อมูลส่วนตัว</a></li>
                                            <li><a href="javascript: document.logoutForm.submit()"><i class="glyphicon glyphicon-off"></i> ออกจากระบบ</a></li>
                                        </ul>
                                    </li>
                                    <form name="logoutForm" action="logout" method="post" th:hidden="true"></form>
                                </ul>
                            </div>
                        </div>
                    </nav>