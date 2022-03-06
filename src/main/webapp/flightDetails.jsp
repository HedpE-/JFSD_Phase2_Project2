<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Flight details</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<div class="container mt-5 w-50">
		<div class="jumbotron">
			<c:set var="flight" value="${sessionScope.currentFlight}"/>
			<h1 class="display-4 mb-4">Flight #${flight.getId()} details</h1>
			<div class="card m-b-30">
	            <div class="card-body py-5">
                	<h1 class="display-4 text-right">
						${flight.getPrice()} EUR
					</h1>
	                <div class="row">
	                    <div class="col-lg-9">
	                        <div class="table-responsive">
	                            <table class="table table-borderless mb-0">
	                                <tbody>
	                                    <tr>
	                                        <th scope="row" class="p-1">Airline company:</th>
	                                        <td class="p-1">${flight.getAirline().getName()}</td>
	                                    </tr>
	                                    <tr>
	                                        <th scope="row" class="p-1">Depart from:</th>
	                                        <td class="p-1">${flight.getSource_place().getName()} (${flight.getSource_place().getCountry()})</td>
	                                    </tr>
	                                    <tr>
	                                        <th scope="row" class="p-1">Depart date:</th>
	                                        <td class="p-1">${flight.getDepart_date("dd/MM/yyyy")}</td>
	                                    </tr>
	                                    <tr>
	                                        <th scope="row" class="p-1">Arrive at:</th>
	                                        <td class="p-1">${flight.getDestination_place().getName()} (${flight.getDestination_place().getCountry()})</td>
	                                    </tr>
	                                    <tr>
	                                        <th scope="row" class="p-1">Return date:</th>
	                                        <td class="p-1">${flight.getReturn_date("dd/MM/yyyy")}</td>
	                                    </tr>
	                                </tbody>
	                            </table>
	                        </div>
	                    </div>
	                </div>
                    <div class="text-center">
                   		<h1 class="display-4 my-4">${flight.getDestination_place().getDescription()}</h1>
                    </div>
					<form action="bookFlight" method="post">
						<button type="submit" class="btn btn-primary">Book Flight</button>
					</form>
	            </div>
	        </div>
		</div>
	</div>
	<br />
	<jsp:include page="footer.html" />
</body>
</html>