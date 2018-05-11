<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Feed</title>
<link rel="stylesheet" type="text/css" href="styles/main.css">
<%@ include file="/includes/header.html" %>
</head>
<body>
	<%@ include file="/includes/topnav.jsp" %>
	<div class="content">
		<h1>Edit My Feed</h1>
		<table>
			<tr>
				<th></th>
				<th>Feed Name</th>
				<th>Description</th>
				<th>URL</th>
				<th></th>
			</tr>
			<c:forEach var="feed" items="${cart.items}">
				<tr>
					<td>
					</td>
					<td>
						<form action="" method="post">
							<input type="hidden" name="productCode"
								value="<c:out value='${item.product.code}'/>"> <input
								type=text name="quantity"
								value="<c:out value='${item.quantity}'/>" id="quantity">
							<input type="submit" value="Update">
						</form>
					</td>
					<td><c:out value='${item.product.description}' /></td>
					<td>${item.product.priceCurrencyFormat}</td>
					<td>${item.totalCurrencyFormat}</td>
					<td>
						<form action="" method="post">
							<input type="hidden" name="productCode"
								value="<c:out value='${item.product.code}'/>"> <input
								type="hidden" name="quantity" value="0"> <input
								type="submit" value="Remove Item">
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>

		<form action="" method="post">
			<input type="hidden" name="action" value="updateFeed">
			<input class="green-flat-button" type="submit" value="Update" class="margin_left">
		</form>

		<form action="" method="post">
			<input type="hidden" name="action" value="cancel">
			<a href="profile.jsp"><input class="gray-flat-button" type="submit" value="Cancel" class="margin_left"></a>   		
		</form>
	</div>
	<%@ include file="/includes/footer.jsp" %>
</body>
</html>