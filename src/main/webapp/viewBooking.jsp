<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Booking details</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<div class="container mt-5 w-60">
		<div class="jumbotron">
			<c:set var="booking" value="${sessionScope.currentBooking}" />
			<div class="py-5 text-center">
				<h1 class="display-4">Booking details</h1>
			</div>
			<div class="row">
				<div class="col-md-4 order-md-2 mb-4">
					<ul class="list-group mb-3">
						<li class="list-group-item d-flex lh-condensed">
							<div>
								<h6 class="my-0">
									${booking.getFlight().getSource_place().getName()} -> ${booking.getFlight().getDestination_place().getName()}
								</h6>
								<small class="text-muted">
									${booking.getFlight().getDepart_date("dd/MM/yyyy")} -> ${booking.getFlight().getReturn_date("dd/MM/yyyy")}
									<br />${booking.getFlight().getAirline().getName()}<br />
									<strong>Seats:</strong>
								</small>
								<input type="number" style="max-width: 60px;" class="form-control" id="seats"
									value="${booking.getSeats()}" disabled readonly>
							</div>
							<span class="text-bold justify-content-end pl-5" id="price">${booking.getFlight().getPrice()} EUR</span>
						</li>
					</ul>
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-muted">Total</span>
						<span class="badge badge-secondary badge-pill" id="total">${booking.getTotal_ammount()} EUR</span>
					</h4>
				</div>
				<div class="col-md-8 order-md-1">
					<h4 class="mb-3">Billing address</h4>
					<div class="row mb-3">
						<div class="col-md-6">
							<label for="uname">Username</label>
							<input type="text" class="form-control" id="uname"
								value="${booking.getUser().getUsername()}" disabled readonly>
						</div>
						<div class="col-md-6">
							<label for="email">Email</label> <input type="email"
								class="form-control" id="email"
								value="${booking.getUser().getEmail(}" disabled readonly>
						</div>
					</div>

					<div class="row mb-3">
						<div class="col-md-6">
							<label for="fname">First name</label>
							<input type="text" class="form-control" id="fname"
								value="${booking.getUser().getFname()}" disabled readonly>
						</div>
						<div class="col-md-6">
							<label for="lname">Last name</label>
							<input type="text" class="form-control" id="lname"
								value="${booking.getUser().getLname()}" disabled readonly>
						</div>
					</div>

					<div class="mb-3">
						<label for="address">Address</label>
						<input type="text" class="form-control" id="address"
							value="${booking.getAddress()}" disabled readonly>
					</div>

					<div class="mb-3">
						<label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>
						<input type="text" class="form-control" id="address2"
							value="${booking.getAddress2()}" disabled readonly>
					</div>

					<div class="row mb-4">
						<div class="col-md-5">
							<label for="country">Country</label>
							<input type="text" class="form-control d-block w-100" id="country"
								value="${booking.getCountry()}" disabled readonly>
						</div>
						<div class="col-md-4">
							<label for="city">City</label>
							<input type="text" class="form-control d-block w-100" id="city"
								value="${booking.getCity()}" disabled readonly>
						</div>
						<div class="col-md-3">
							<label for="postcode">Postal or Zip code</label>
							<input type="text" class="form-control" id="postcode"
								value="${booking.getPostcode()}" disabled readonly>
						</div>
					</div>
					<hr class="mb-4">

					<h4 class="mb-3">Payment</h4>

					<div class="d-block my-3">
						<div class="custom-control custom-radio">
							<input id="creditcard" name="paymentMethod" type="radio"
								class="custom-control-input"
								checked="${booking.getPayment_method().equals("credit_card") ? "checked" : "unchecked"}"
								disabled readonly>
							<label class="custom-control-label" for="creditcard">Credit card</label>
						</div>
					</div>
					<div class="row mb-4">
						<div class="col-md-6">
							<label for="cc-number">Credit card number</label> <input
								type="text" class="form-control" id="cc-number"
								value="XXXXXXXXXXXX${booking.getCc_lastdigits()}" disabled
								readonly>
						</div>
					</div>
					<hr class="mb-4">
					<a href="myFlights.jsp" class="f-n-hover btn btn-primary btn-md w-25">Back to My Flights</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.html" />
</body>
</html>