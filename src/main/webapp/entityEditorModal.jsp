<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Entity Editor</title>
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
	<div class="modal fade" id="entity-editor" tabindex="-1" role="dialog" aria-labelledby="entityEditorModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
				<c:set var="view" scope="page" value="${param.view.toLowerCase()}"/>
				<c:set var="view" scope="page" value="${view.substring(0, 1).toUpperCase().concat(view.substring(1))}"/>
                <div class="modal-header">
                    <h4 class="modal-title" id="entityEditorModalLabel">Add new ${view.substring(0, view.length() - 1)}</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
            
				<form class="form-block" id="editorForm" action="add" method="post">
	                <div class="modal-body">
					    <input type="hidden" class="form-control" name="view" value="${view.toLowerCase()}">
		            	<c:if test="${view.equals('Places')}">
	               			<div class="row mx-2">
	               				<div class="md-6 mr-3">
									<label for="name" class="form-label">Place Name</label>
								    <input type="text" class="form-control" id="name" name="name" placeholder="Place Name"
										aria-label="Place Name" required>
								</div>
								<div class="md-6">
									<label for="country" class="form-label">Country</label>
								    <input type="text" class="form-control" id="country" name="country" placeholder="Country"
										aria-label="Country" required>
								</div>
							</div>
							<div class="mx-2">
								<label for="description" class="form-label">Description</label>
								<textarea class="form-control" id="description" name="description" rows="3"></textarea>
							</div>
						</c:if>
		            	<c:if test="${view.equals('Airlines')}">
               				<div class="mb-3">
								<label for="name" class="form-label">Airline Name</label>
							    <input type="text" class="form-control" id="name" name="name" placeholder="Airline Name"
									aria-label="Place Name" required>
							</div>
						</c:if>
		            	<c:if test="${view.equals('Flights')}">
							<c:set var="places" scope="page" value="${sessionScope.crud.getPlaces()}"/>
							<c:set var="airlines" scope="page" value="${sessionScope.crud.getAirlines()}"/>
	               			<div class="row mb-3">
	               				<div class="col-md-6">
									<label for="source" class="form-label">Source Location</label>
									<select class="form-control custom-select" id="source" name="source" required>
									    <option selected>Choose...</option>
									    <c:forEach var="place" items="${places}">
										    <option value="${place.getId()}">${place.getName()}</option>
									    </c:forEach>
								  	</select>
								</div>
								<div class="col-md-6">
									<label for="destination" class="form-label">Destination Location</label>
									<select class="form-control custom-select" id="destination" name="destination" required>
									    <option selected>Choose...</option>
									    <c:forEach var="place" items="${places}">
										    <option value="${place.getId()}">${place.getName()}</option>
									    </c:forEach>
								  	</select>
								</div>
							</div>
	               			<div class="row mb-3">
	               				<div class="col-md-6">
									<label for="depart_date" class="form-label">Depart Date</label>
								    <input type="date" class="form-control" id="depart_date" name="depart_date"
										placeholder="Depart Date" aria-label="Depart Date" required>
								</div>
								<div class="col-md-6">
									<label for="return_date" class="form-label">Return Date</label>
								    <input type="date" class="form-control" id="return_date" name="return_date"
										placeholder="Return Date" aria-label="Return Date" required>
								</div>
							</div>
							<div class="row mb-3">
	               				<div class="col-md-6">
									<label for="airline" class="form-label">Airline</label>
									<select class="form-control custom-select" id="airline" name="airline" required>
									    <option selected>Choose...</option>
									    <c:forEach var="airline" items="${airlines}">
										    <option value="${airline.getId()}">${airline.getName()}</option>
									    </c:forEach>
								  	</select>
								</div>
								<div class="col-md-6">
									<label for="price" class="form-label">Price</label>
								    <input type="number" class="form-control sm-2 w-75" step="0.01" min="0"
								    	id="price" name="price" placeholder="Price in EUR" aria-label="Price" required>
								</div>
							</div>
						</c:if>
	                </div>
	                
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
	                    <button type="submit" class="btn btn-primary btn-ok">Save</button>
	                </div>
				</form>	
            </div>
        </div>
    </div>
</body>
</html>