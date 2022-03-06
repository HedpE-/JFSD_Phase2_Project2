<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flights</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<div class="container mt-5 w-50">
		<div class="jumbotron">
			<h1 class="display-4">
			<c:set var="hasParams" value="${param.start_date ne null && param.end_date ne null && param.source ne null && param.destination ne null}"/>
			<c:choose>
				<c:when test="${hasParams}">
					Filter results
				</c:when>
				<c:otherwise>
					Explore Flights
				</c:otherwise>
			</c:choose>
			</h1>
			<c:set var="flightsResult" value="${sessionScope.flightsResult}"/>
			<c:choose>
				<c:when test="${flightsResult ne null && flightsResult.size() > 0}">
					<c:forEach var="flight" items="${sessionScope.flightsResult}">
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