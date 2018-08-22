<%@page import="com.bru.model.RepairBean"%>
    <%@page import="java.util.List"%>
        <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
            <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
            <jsp:include page="../layout/menurepairmen.jsp"></jsp:include>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Repairmen</title>
                <link href="/css/repair.css" rel="stylesheet">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/autonumeric/4.1.0/autoNumeric.js"></script>

                <%
	RepairBean bean = null;
	bean = (RepairBean) request.getAttribute("repairBean");

%>
            </head>

            <body>
                <form name="updaterepairmen" id="updaterepairmen" action="/updaterepairmen" method="GET">

                    <div class="container" style="margin-top: 1cm; margin-bottom: 5cm">
                        <input type="hidden" name="repairId" value="<%=bean.getRepairId()%>">
                        <h3>
                            <font style="vertical-align: inherit;">
                                <font style="vertical-align: inherit;">
                                    ใบแจ้งซ่อม
                                </font>
                            </font>
                            <small>
							<font style="vertical-align: inherit;">
								<font style="vertical-align: inherit;">#
									<%=bean.getRepairId()%>
								</font>
							</font>
						</small>
                        </h3>
                        <div class="col-xs-12">
                            <h2 class="page-header">
                                <i class="fa fa-globe"></i>คุณ
                                <%=bean.getRepairname()%>
                                    <small class="pull-right">วันที่แจ้งซ่อม:
									<%=bean.getRepairDateStr()%>
								</small>
                            </h2>
                        </div>
                        <div class="row invoice-info">
                            <div class="col-sm-4 invoice-col">
                                <h4>
                                    <b>
									<font style="vertical-align: inherit;">
										<font style="vertical-align: inherit;">
											จาก
										</font>
									</font>
								</b>
                                </h4>
                                <address>
								<strong>
									<font style="vertical-align: inherit;">
										<font style="vertical-align: inherit;">
											คุณ:
											<%=bean.getRepairname()%>
										</font>
									</font>
								</strong>
								<br>
								<font style="vertical-align: inherit;">
									<font style="vertical-align: inherit;">
										ที่อยู่:
										<%=bean.getRepairAddress()%>
									</font>
								</font>
								<br>
								<font style="vertical-align: inherit;">
									<font style="vertical-align: inherit;">
										โทรศัพท์:
										<%=bean.getRepairPhone()%>
									</font>
								</font>
								<br>
								<font style="vertical-align: inherit;">
									<font style="vertical-align: inherit;">
										อีเมล:
										<%=bean.getRepairEmail()%>
									</font>
								</font>
							</address>
                            </div>
                            <!-- /.col -->

                            <div class="col-sm-4 invoice-col">
                                <h4>
                                    <b>
									<font style="vertical-align: inherit;">
										<font style="vertical-align: inherit;">ใบแจ้งซ่อม #
											<%=bean.getRepairId()%>
										</font>
									</font>
								</b>
                                </h4>
                                <b>
								<font style="vertical-align: inherit;">
									<font style="vertical-align: inherit;">หมวดสินค้า:</font>
								</font>
							</b>
                                <font style="vertical-align: inherit;">
                                    <font style="vertical-align: inherit;">
                                        <%=bean.getRepairAppliances()%>
                                    </font>
                                </font>
                                <br>
                                <b>
								<font style="vertical-align: inherit;">
									<font style="vertical-align: inherit;">ประเภทสินค้า:</font>
								</font>
							</b>
                                <font style="vertical-align: inherit;">
                                    <font style="vertical-align: inherit;">
                                        <%=bean.getRepairProduct()%>
                                    </font>
                                </font>
                                <br>
                                <b>
								<font style="vertical-align: inherit;">
									<font style="vertical-align: inherit;">ยี่ห้อ:</font>
								</font>
							</b>
                                <font style="vertical-align: inherit;">
                                    <font style="vertical-align: inherit;">
                                        <%=bean.getRepairBrand()%>
                                    </font>
                                </font>
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-4 invoice-col">
                                <h4>
                                    <b>
									<font style="vertical-align: inherit;">
										<font style="vertical-align: inherit;">
											ปัญหา
										</font>
									</font>
								</b>
                                </h4>
                                <address>
								<strong>
									<font style="vertical-align: inherit;">
										<font style="vertical-align: inherit;">หัวข้อเรื่องการแจ้งซ่อม </font>
									</font>
								</strong>
								<br>
								<font style="vertical-align: inherit;">
									<font style="vertical-align: inherit;">
										<%=bean.getRepairWaste()%>
									</font>
								</font>
								<br>

								<strong>
									<font style="vertical-align: inherit;">
										<font style="vertical-align: inherit;">รายละเอียดเพิ่มเติม </font>
									</font>
								</strong>
								<br>
								<font style="vertical-align: inherit;">
									<font style="vertical-align: inherit;">
										<%=bean.getRepairDetail()%>
									</font>
								</font>
								<br>
							</address>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">

                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="glyphicon glyphicon-calendar">
                                            <font style="vertical-align: inherit;">
                                                <font style="vertical-align: inherit;">เลือกวันที่ซ่อม</font>
                                            </font>
                                        </h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>
											<font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;">วันที่นัดซ่อม:</font>
											</font>
										</label>
                                            <input type="date" disabled="disabled" class="form-control" value="<%=bean.getRepairAppointment()%>">
                                        </div>
                                        <div class="form-group">
                                            <label>
											<font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;">ช่วงวันที่ซ่อม:</font>
											</font>
										</label>
                                            <input type="date" class="form-control" id="repairmenDate" name="repairmenDate" value="<%=bean.getRepairmenDate()%>">
                                        </div>
                                    </div>
                                </div>
                                <div class="box box-info">
                                    <div class="box-header">
                                        <h3 class="glyphicon glyphicon-user">
                                            <font style="vertical-align: inherit;">
                                                <font style="vertical-align: inherit;">ผู้ดำเนินการ</font>
                                            </font>
                                        </h3>
                                    </div>
                                    <div class="box-body">
                                        <!-- Color Picker -->
                                        <div class="form-group">
                                            <label>
											<font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;">ช่างที่รับผิดชอบ:</font>
											</font>
										</label>
                                            <input type="text" class="form-control my-colorpicker1 colorpicker-element" disabled="disabled" value="<%=bean.getRepairmenId()%>">
                                        </div>
                                    </div>
                                    <!-- /.box-body -->
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="box box-danger">
                                    <div class="box-header">
                                        <h3 class="glyphicon glyphicon-ok">
                                            <font style="vertical-align: inherit;">
                                                <font style="vertical-align: inherit;">ผลการแก้ไข </font>
                                            </font>
                                        </h3>
                                    </div>
                                    <div class="box-body">
                                        <!-- Date dd/mm/yyyy -->
                                        <div class="form-group">
                                            <label>
											<font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;">วันที่เสร็จ:</font>
											</font>
										</label>
                                            <input type="date" class="form-control my-colorpicker1 colorpicker-element" value="<%=bean.getRepairmenCompletion()%>" id="repairmenCompletion" name="repairmenCompletion">
                                        </div>
                                        <!-- /.form group -->
                                        <div class="form-group">
                                            <label>
											<font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;">สาเหตุ / วิธีแก้:</font>
											</font>
										</label>
                                            <textarea class="form-control" id="repairmenCause" name="repairmenCause" rows="5"><%=bean.getRepairmenCause()%></textarea>
                                        </div>
                                        <!-- /.form group -->
                                        <div class="form-group">
                                            <label>
											<font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;" >ค่าใช้จ่าย:</font>
											</font>
										</label>
                                            <input type="text" class="form-control" id="eee" value="<%=bean.getRepairmenExpenses()%>" id="repairmenExpenses" name="repairmenExpenses">
                                        </div>
                                        <!-- /.form group -->
                                        <div class="form-group">
                                            <label>
											<font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;">ไฟล์แนบ:</font>
											</font>
										</label>
                                            <input type="file" class="form-control-file" id="exampleFormControlFile1">
                                        </div>
                                        <!-- /.form group -->
                                        <div class="form-group">
                                            <label>
											<font style="vertical-align: inherit;">
												<font style="vertical-align: inherit;">สถานะ:</font>
											</font>
										</label>
                                            <select class="form-control" id="repair" name="repairmenStatus">
											
											<option value=""><%=bean.getRepairmenStatus()%></option>											
										</select>
                                        </div>
                                    </div>
                                    <!-- /.box-body -->
                                </div>
                            </div>
                        </div>
                        <!-- <a href="#" target="_blank" class="btn btn-default">
						<i class="fa fa-print"></i>
						<font style="vertical-align: inherit;">
							<font style="vertical-align: inherit;"> พิมพ์</font>
						</font>
					</a> -->
                        <div class="pull-right">
                            <button type="submit" class="btn btn-primary">บันทึกการเปลี่ยนแปลง</button>
                            <button type="button" class="btn btn-success" onclick="window.location.href='/table' ">ยกเลิก</button>
                        </div>

                    </div>
                </form>
            </body>

            <script>
                $(document).ready(function() {

                    $.ajax({
                        type: "GET",
                        url: "/repairstatus",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function(msg) {
                            for (var i = 0; i < msg.length; i++) {
                                $('#repair').append('<option value="' + msg[i].id + '">' + msg[i].name + '</option>');
                            }
                        }
                    });
                });
            </script>
            <script>
                $(document).ready(function() {
                    anElement = new AutoNumeric("#eee");
                });
            </script>
            <jsp:include page="../layout/footer.jsp"></jsp:include>

            </html>