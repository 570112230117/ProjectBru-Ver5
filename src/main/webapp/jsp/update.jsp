<%@page import="com.bru.model.RepairBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../layout/menu.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/css/repair.css" rel="stylesheet">
<script src="/js/repair.js"></script>
<script src="/js/ajax.js"></script>

<%
	RepairBean bean = null;
	bean = (RepairBean) request.getAttribute("repairBean");
%>
</head>
<body>
	<form name="updateRepair" id="updateRepair" action="/updateRepair" method="GET">
		<div class="container" style="margin-top: 1cm; margin-bottom: 2cm">
			<input type="hidden" name="repairId" value="<%=bean.getRepairId()%>">
			<div class="form-group">
				<label for="exampleFormControlInput1">ชื่อลูกค้า <span
					style="color: red;">*</span>
				</label> <input type="text" name="repairname" class="form-control" id="repairname"
					placeholder="ชื่อลูกค้า" value="<%=bean.getRepairname()%>">
			</div>
			<div class="form-group">
				<label for="exampleFormControlTextarea1">ที่อยู่ <span
					style="color: red;">*</span> <a href="/map" type="button"
					class="btn btn-info btn-xs">GPS</a> <small class="text-primary">**
						มาร์คพิกัด เพื่อความสะดวกในการหาที่อยู่</small>
				</label>
				<textarea class="form-control" id="repairAddress" rows="3" name="repairAddress" >
				<%=bean.getRepairAddress()%>
				</textarea>
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">เบอร์โทรศัพท์ <span
					style="color: red;">*</span>
				</label> <input type="text" name="repairPhone" class="form-control" id="repairPhone"
					 value="<%=bean.getRepairPhone()%>">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">อีเมล</label> <input
					name="repairEmail" type="text" class="form-control" id="repairEmail"
					 value="<%=bean.getRepairEmail()%>">
			</div>

			<div class="pull-right">
				<button type="submit" class="btn btn-success">อัพเดพ</button>
				<button onclick="window.location.href='/table'" type="button" class="btn btn-secondary">ย้อนกลับ</button>
			</div>
		</div>
	</form>
</body>
</html>