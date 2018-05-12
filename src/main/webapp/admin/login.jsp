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
        <form name ="login" action="/Feedz/UserServlet" method="POST">
            <table class="standard" width="280em">
                <tbody>
                	<tr>
                		<td><b>Admin Login</b></td>
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