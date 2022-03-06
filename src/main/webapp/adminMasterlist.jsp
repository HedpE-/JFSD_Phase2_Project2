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
<title>
	<c:set var="view" scope="page" value="${param.view.toLowerCase()}"/>
	<c:set var="view" scope="page" value="${view.substring(0, 1).toUpperCase().concat(view.substring(1))}"/>
	${view} Masterlist
</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<div class="container mt-5 w-50">
		<div class="jumbotron">
			<h1 class="display-4">${view} Masterlist</h1>
           	<c:if test="${sessionScope.user ne null && sessionScope.user.getRole().equals('admin')}">
				<button class="btn btn-primary w-25 my-2" data-href="add?view=${view.toLowerCase()}" data-toggle="modal" data-target="#entity-editor">Add new</button>
			</c:if>
			<c:set var="viewContext" value="${sessionScope.viewContext}"/>
			<c:choose>
				<c:when test="${viewContext ne null && viewContext.size() > 0}">
					<c:forEach var="obj" items="${viewContext}">
						<div class="d-style bg-light w-100 my-2 py-3 shadow-sm">
							<div class="row align-items-center">
								<div class="col text-center">
									<h1 class="pt-3 text-170 text-600 text-primary-d1 letter-spacing">
										#${obj.getId()}
									</h1>
								</div>
								<div class="col-12 col-md-4">
									<h4 class="pt-3 text-170 text-600 text-primary-d1 letter-spacing">
						            	<c:if test="${obj['class'].simpleName.equals('Flight')}">
											${obj.getSource_place().getName()} -> ${obj.getDestination_place().getName()}
										</c:if>
										<c:if test="${!obj['class'].simpleName.equals('Flight')}">
											${obj.getName()}
										</c:if>
									</h4>
									<div class="text-secondary-d1 text-120">
						            	<span class="text-180">
							            	<c:if test="${obj['class'].simpleName.equals('Place')}">
												${obj.getCountry()}
											</c:if>
											<c:if test="${obj['class'].simpleName.equals('Flight')}">
												${obj.getDepart_date("dd/MM/yyyy")} -> ${obj.getReturn_date("dd/MM/yyyy")}
											</c:if>
										</span>
						            </div>
								</div>
								<div class="col text-center">
									<button class="btn btn-warning w-75 mt-2" data-href="delete?view=${view.toLowerCase()}&id=${obj.getId()}" data-toggle="modal" data-target="#confirm-delete">Delete</button>
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
	<jsp:include page="confirmDeleteModal.jsp" />
	<jsp:include page="entityEditorModal.jsp" />
</body>
</html>