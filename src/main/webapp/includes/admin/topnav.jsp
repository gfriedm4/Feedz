<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- topnav for users -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/main.css">
<div class="topnav">
	<ul>
		<li>
			<a href="${pageContext.request.contextPath}/user/feed.jsp"><i class="fa fa-feed"></i>  Feedz</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/user/profile.jsp"><i class="fa fa-user"></i>  Profile</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/admin/managefeeds.jsp"><i class="fa fa-lock"></i>  Manage Feeds</a>
		</li>
		
		<li>
			<a href="${pageContext.request.contextPath}/admin/manageusers.jsp"><i class="fa fa-lock"></i>  Manage Users</a>
		</li>
		

		<li style="float: right">
			<a href="${pageContext.request.contextPath}/admin/login.jsp"><font size="2">Logout</font></a>
		</li>
		<li style="float: right">
			<a href="${pageContext.request.contextPath}/user/profile.jsp"><font size="2">Welcome ${user.firstName}</font></a>
		</li>
	</ul>
</div>
