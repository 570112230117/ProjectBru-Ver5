<%@page import="com.bru.model.LoginBean"%>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Log in</title>
            <link href="/css/common.css" rel="stylesheet">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        </head>
        <%        
    	String result = "";
        LoginBean bean = null;
    %>
            <%
    	result = (String) request.getAttribute("messessError");
        bean = (LoginBean) request.getSession().getAttribute("LoginUser");
    %>

                <body>
                    <div class="container">
                        <form method="POST" action="/welcome" name="welcome" class="form-signin">
                            <h2 class="form-heading">Log in</h2>

                            <div class="form-group">
                                <input name="username" type="text" class="form-control" placeholder="Username" autofocus="true" />
                                <input name="password" type="password" class="form-control" placeholder="Password" />

                                <%
						if (result.equals("F")) {
					%>
                                    <div class="alert alert-danger">
                                        <strong>Faill ! </strong> You Login Faill !!
                                    </div>
                                    <%
						} 
					%> 
                                        <button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
                            </div>

                        </form>

                    </div>
                    <script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
                    <script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
                </body>
        </html>