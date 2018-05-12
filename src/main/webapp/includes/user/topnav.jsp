<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- topnav for users -->
<link rel="stylesheet" type="text/css" href="styles/main.css">
<div class="topnav">
	<ul>
		<li>
			<a href="feed.jsp"><i class="fa fa-feed">  Feedz</i></a>
		</li>
		<li>
			<a href="profile.jsp"><i class="fa fa-user">  Profile</i></a>
		</li>

		<li style="float: right">
			<a href="login.jsp"><font size="2">Logout</font></a>
		</li>
		<li style="float: right">
			<a href="profile.jsp"><font size="2">Welcome ${user.firstName}</font></a>
		</li>
	</ul>
</div>
