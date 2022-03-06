<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Congratulations</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome 5 Iconic Font -->
<link rel="stylesheet" href="/path/to/cdn/fontawesome.min.css" />
<!-- jQuery Library -->
<script src="/path/to/cdn/jquery.slim.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
	integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
	crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<div class="container mt-5" style="max-width: 900px;">
		<div class="jumbotron text-center">
			<h1 class="display-4">Congratulations for your purchase</h1>
			<p class="lead">
				You can find details of this and other booking in <a href="myFlights.jsp">My Flights</a> category.<br/>Enjoy your flight!
			</p>
			<a href="index.jsp" class="f-n-hover btn btn-primary px-4 py-25 mt-5 text-600">Go Home</a>
		</div>
	</div>
	<jsp:include page="footer.html" />
</body>
</html>
