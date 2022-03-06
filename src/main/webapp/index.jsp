<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fly Away Agency</title>
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
	<div class="container mt-5 w-50">
		<div class="jumbotron">
			<h1 class="display-4 mb-3">
				Welcome
				<c:if test="${sessionScope.user ne null}">
					${sessionScope.user.getFname()}
				</c:if>
				<br />find the travel of your dreams!
			</h1>
			<form class="needs-validation" action="findTravel">
				<div class="row mb-3">
					<div class="col-md-6">
						<label for="start_date" class="form-label">Depart Date</label>
						<input type="date" class="form-control" id="start_date" name="start_date">
					</div>
					<div class="col-md-6">
						<label for="end_date" class="form-label">Arrival Date</label>
						<input type="date" class="form-control" id="end_date" name="end_date">
					</div>
				</div>
				<div class="row mb-3">
					<c:set var="places" scope="page" value="${sessionScope.crud.getPlaces()}"/>
					<div class="col-md-6">
						<label for="source" class="form-label">Source</label>
						<select class="form-control custom-select" id="source" name="source">
						    <option value="-1" selected>Where do you come from?</option>
						    <c:forEach var="place" items="${places}">
							    <option value="${place.getId()}">${place.getName()}</option>
						    </c:forEach>
					  	</select>
					</div>
					<div class="col-md-6">
						<label for="destination" class="form-label">Destination</label>
						<select class="form-control custom-select" id="destination" name="destination">
						    <option value="-1" selected>Where do you want to go?</option>
						    <c:forEach var="place" items="${places}">
							    <option value="${place.getId()}">${place.getName()}</option>
						    </c:forEach>
					  	</select>
					</div>
				</div>
				<div class="col text-center w-100 mt-5">
					<button type="submit" class="btn btn-primary w-25">Find travels</button>
				</div>
			</form>
		</div>
		<div class="jumbotron">
			<h1 class="display-4 mb-4">Top Flights</h1>
			<c:set var="topFlights" value="${sessionScope.crud.findFlights(5)}"/>
			<c:choose>
				<c:when test="${topFlights ne null && topFlights.size() > 0}">
					<c:forEach var="flight" items="${topFlights}" begin="0" end="4">
						<div class="d-style border-2 bg-light w-100 my-2 py-3 shadow-sm">
							<div class="row align-items-center">
								<div class="col text-center">
									<h1 class="pt-3 text-170 text-600 text-primary-d1 letter-spacing">
										#${flight.getId()}
									</h1>
									<p class="lead display-5 text-180">
										${flight.getAirline().getName()}
									</p>
								</div>
								<div class="col-12 col-md-4">
									<h4 class="pt-3 text-170 text-600 text-primary-d1 letter-spacing">
										${flight.getSource_place().getName()} -> ${flight.getDestination_place().getName()}
									</h4>
									<div class="text-secondary-d1 text-120">
						            	<span class="text-180">
											${flight.getDepart_date("dd/MM/yyyy")} -> ${flight.getReturn_date("dd/MM/yyyy")}
										</span>
						            </div>
								</div>
								<div class="col text-center">
									<h4 class="pt-3 text-170 text-600 text-primary-d1 letter-spacing">
										${flight.getPrice()} EUR
									</h4>
									<form action='viewFlight'>
										<input type='hidden' name='id' value="${flight.getId()}">
										<button type='submit' class='btn btn-primary mt-3'>View details</button>
									</form>
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
