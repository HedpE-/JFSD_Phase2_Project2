<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Registration System</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<div class="container mt-5 w-50">
		<div class="jumbotron">
			<h1 class="display-4">Customer Registration</h1>
			<br />
			<div class="container w-75">
<%-- 				<% String redirect = request.getParameter("redirect"); %> --%>
				<form action="register" method="post" class="justify-content-center">
					<div class="row mb-3">
						<div class="col-md-6">
							<label for="fname">First name</label>
							<input type="text" class="form-control" id="fname" name="fname" placeholder="First Name" required>
						</div>
						<div class="col-md-6">
							<label for="lname">Last name</label>
							<input type="text" class="form-control" id="lname" name="lname" placeholder="Last Name" required>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-md-6">
							<label for="uname">Username</label>
							<input type="text" class="form-control" id="uname" name="uname" placeholder="Username" required>
						</div>
						<div class="col-md-6">
							<label for="email">Email</label>
							<input type="email" class="form-control" id="email" name="email" placeholder="Email address" required>
						</div>
					</div>
					<div class="row mb-4">
						<div class="col-md-6">
							<label for="password">Password</label>
							<input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
						</div>
						<div class="col-md-6">
							<label for="rpassword">Repeat Password</label>
							<input type="password" class="form-control" id="rpassword" name="rpassword" placeholder="Repeat Password" required>
						</div>
					</div>
					<c:if test="${param.redirect ne null && param.redirect != ''}">
						<input type="hidden" name="redirect" value="${param.redirect}">
					</c:if>
					<div class="form-group w-100 text-center">
						<button type="submit" class="btn btn-primary">Complete registration</button>
					</div> 
				</form>
   				<p class="text-center">Have an account?
					<a href="login.jsp<%String redirect = request.getParameter("redirect"); if(redirect != null && redirect != "") out.print("?redirect=" + redirect); %>">Sign In</a>
				</p>
			</div>
		</div>
	</div>
	<jsp:include page="footer.html" />
</body>
</html>