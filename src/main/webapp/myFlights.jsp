<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<title>My Flights</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<div class="container mt-5 w-50">
		<div class="jumbotron">
			<h1 class="display-4 mb-3">My Flights</h1>
			<c:set var="bookings" value="${sessionScope.user.getBookings()}"/>
			<c:choose>
				<c:when test="${bookings ne null && bookings.size() > 0}">
					<c:forEach var="booking" items="${bookings}">
						<div class="d-style bg-light w-100 my-2 py-3 shadow-sm">
							<div class="row align-items-center">
								<div class="col text-center">
									<h4 class="pt-3 text-170 text-600 text-primary-d1 letter-spacing">
										Booked on
									</h4>
									<p class="lead display-5 text-180">
										${booking.getCreate_date()}<br/>
										<strong>Seats:</strong> ${booking.getSeats()}
									</p>
								</div>
								<div class="col-12 col-md-4">
									<h4 class="pt-3 text-170 text-600 text-primary-d1 letter-spacing">
										${booking.getFlight().getSource_place().getName()} -> ${booking.getFlight().getDestination_place().getName()}
									</h4>
									<div class="text-secondary-d1 text-120">
						            	<span class="text-180">
											${booking.getFlight().getDepart_date("dd/MM/yyyy")} -> ${booking.getFlight().getReturn_date("dd/MM/yyyy")}
										</span>
						            </div>
								</div>
								<div class="col text-center">
									<h4 class="pt-3 text-170 text-600 text-primary-d1 letter-spacing">
										Total price
									</h4>
									<p class="lead display-5 text-180">
										${booking.getTotal_ammount()} EUR
									</p>
									<a href="bookFlight?id=${booking.getId()}" class="f-n-hover btn btn-primary px-4 py-25 mb-3 text-600">View details</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<h4 class="lead mt-5">
						No results found
					</h4>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<jsp:include page="footer.html" />
</body>
</html>