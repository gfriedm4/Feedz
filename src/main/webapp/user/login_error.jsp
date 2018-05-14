<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="styles/main.css">
	<%@ include file="/includes/header.html" %>
</head>
	<body>
	<div class="content">
	 	<div class="center error">
	        <p>You did not log in successfully.</p>
	        <p>Please check your username and password and try again.</p>
        </div>
        <form action="UserServlet" method="POST">
            <table class="invisible" width="280em">
                <tbody>
                    <tr>
                		<td><b>Login</b></td>
                        <td align='right'><small> New to Feedz? <a href="register.jsp">Register Here</a></small></td>
                    </tr>
                    <tr>
                        <td colspan="2">Email</td>
                    </tr>
                    <tr>
                        <td colspan="2" align='center'><input type="email" name="email" value=""  style="width:98%"  required/></td>
                    </tr>
                    <tr>
                        <td colspan="2">Password</td>
                    </tr>
                    <tr>
                        <td colspan="2" align='center'><input type="password" name="password" value="" style="width:98%"  required/></td>
                    </tr>
                    <tr>
			            <input type="hidden" name="action" value="Login"/>
                        <td colspan="2" align='center'> <input class="green-flat-button" type="submit" value="Login" style="width:100%"/></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
    </body>
</html>