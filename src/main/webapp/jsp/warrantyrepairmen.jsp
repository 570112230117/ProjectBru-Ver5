<%@page import="com.bru.model.WarrantyBean"%>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <jsp:include page="../layout/menurepairmen.jsp"></jsp:include>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Welcome to Warranty</title>
            <script src="/js/warranty.js"></script>
            <%
        WarrantyBean bean = null;        
    %>
                <%
        bean = (WarrantyBean) request.getAttribute("a");
    %>
        </head>

        <body>
            <div class="container">
                <div class="box box-danger">
                    <div class="box-header with-border">
                        <h3 align="center">ตรวจสอบอายุประกัน</h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-4">
                            </div>
                            <div class="col-xs-4">
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Serial number</label>
                                    <input name="serialnumber" type="text" class="form-control" id="serialnumber" placeholder="กรอกข้อมูลผลิตภัณฑ์">
                                </div>
                                <div class="form-group" style="text-align: center">
                                    <button type="button" class="btn btn-warning btn-xs" onclick="check()">ตรวจสอบอายุประกัน</button>
                                </div>
                                <div class="form-group" id="alert"></div>
                                <div class="form-group" id="purchase"></div>
                                <div class="form-group" id="productcode"></div>
                                <div class="form-group" id="productname"></div>
                                <div class="form-group" id="serial"></div>
                                <div class="form-group" id="warranty"></div>
                            </div>
                            <div class="col-xs-4">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>