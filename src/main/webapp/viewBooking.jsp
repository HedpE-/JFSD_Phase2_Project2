<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="jfsd.assessments.phase2.entity.Booking"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<div class="container mt-5 w-60">
		<div class="jumbotron">
			<%
			Booking booking = (Booking) session.getAttribute("currentBooking");
			%>
			<div class="py-5 text-center">
				<h1 class="display-4">Booking details</h1>
			</div>
			<div class="row">
				<div class="col-md-4 order-md-2 mb-4">
					<ul class="list-group mb-3">
						<li class="list-group-item d-flex lh-condensed">
							<div>
								<h6 class="my-0">
									<%=booking.getFlight().getSource_place().getName()%> -> <%=booking.getFlight().getDestination_place().getName()%>
								</h6>
								<small class="text-muted">
									<%=booking.getFlight().getDepart_date("dd/MM/yyyy")%> -> <%=booking.getFlight().getReturn_date("dd/MM/yyyy")%>
									<br /><%=booking.getFlight().getAirline().getName()%><br />
									<strong>Seats:</strong>
								</small>
								<input type="number" style="max-width: 60px;" class="form-control" id="seats"
									value="<%=booking.getSeats()%>" disabled readonly>
							</div>
							<span class="text-bold justify-content-end pl-5" id="price"><%=booking.getFlight().getPrice()%> EUR</span>
						</li>
					</ul>
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-muted">Total</span>
						<span class="badge badge-secondary badge-pill" id="total"><%=booking.getTotal_ammount()%> EUR</span>
					</h4>
				</div>
				<div class="col-md-8 order-md-1">
					<h4 class="mb-3">Billing address</h4>
					<div class="row mb-3">
						<div class="col-md-6">
							<label for="uname">Username</label>
							<input type="text" class="form-control" id="uname"
								value="<%=booking.getUser().getUsername()%>" disabled readonly>
						</div>
						<div class="col-md-6">
							<label for="email">Email</label> <input type="email"
								class="form-control" id="email"
								value="<%=booking.getUser().getEmail()%>" disabled readonly>
						</div>
					</div>

					<div class="row mb-3">
						<div class="col-md-6">
							<label for="fname">First name</label>
							<input type="text" class="form-control" id="fname"
								value="<%=booking.getUser().getFname()%>" disabled readonly>
						</div>
						<div class="col-md-6">
							<label for="lname">Last name</label>
							<input type="text" class="form-control" id="lname"
								value="<%=booking.getUser().getLname()%>" disabled readonly>
						</div>
					</div>

					<div class="mb-3">
						<label for="address">Address</label>
						<input type="text" class="form-control" id="address"
							value="<%=booking.getAddress()%>" disabled readonly>
					</div>

					<div class="mb-3">
						<label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>
						<input type="text" class="form-control" id="address2"
							value="<%=booking.getAddress2()%>" disabled readonly>
					</div>

					<div class="row mb-4">
						<div class="col-md-5">
							<label for="country">Country</label>
							<input type="text" class="form-control d-block w-100" id="country"
								value="<%=booking.getCountry()%>" disabled readonly>
						</div>
						<div class="col-md-4">
							<label for="city">City</label>
							<input type="text" class="form-control d-block w-100" id="city"
								value="<%=booking.getCity()%>" disabled readonly>
						</div>
						<div class="col-md-3">
							<label for="postcode">Postal or Zip code</label>
							<input type="text" class="form-control" id="postcode"
								value="<%=booking.getPostcode()%>" disabled readonly>
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
								value="XXXXXXXXXXXX<%=booking.getCc_lastdigits()%>" disabled
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