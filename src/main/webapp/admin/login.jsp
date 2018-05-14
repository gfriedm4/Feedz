<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="../styles/main.css">
	<script src="../thirdparty/jquery-3.3.1.min.js"></script>
	<script src="../thirdparty/jquery.validate.min.js"></script>
	<script src="../javascript/main.js"></script>
	<%@ include file="/includes/header.html" %>
</head>
	<body>
	<div class="content">
        <form name ="login" action="UserServlet" method="POST">
        		<% if(request.getAttribute("message") != null) { %>
                	<p style="text-align: center; color: red; margin: auto;">${message}</p>
            <% } %>
            <table class="invisible" width="280em">
                <tbody>
                	<tr>
                		<td bgcolor="#FFFF99"><i class="fa fa-lock"></i>&nbsp;<b>Admin Login</b></td>
                    </tr>
                    <tr>
                        <td colspan="2">Email</td>
                    </tr>
                    <tr>
                        <td colspan="2" align='center'><input type="email" name="email" value=""  style="width:98%"/></td>
                    </tr>
                    <tr>
                        <td colspan="2">Password</td>
                    </tr>
                    <tr>
                        <td colspan="2" align='center'><input type="password" name="password" value="" style="width:98%"/></td>
                    </tr>
                    <tr>
			            <input type="hidden" name="action" value="adminLogin">
                        <td colspan="2" align='center'> <input class="green-flat-button" type="submit" value="Login" style="width:100%"/></td>
                    </tr>
                    
                </tbody>
            </table>
        </form>
    </div>
    </body>
</html>