<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-fluid section">
				<h3 class="text-center main-title">
					<i class="glyphicon glyphicon-film"></i>&nbsp;&nbsp;DOCUMENTS
				</h3>
	<table class="table table-responsive table-striped">
		<tr><th>FILE NAME</th><th>DESCRIPTION</th><th>ACCESS</th><th>DATE CREATED</th><th>ACTIONS</th></tr>
		<c:forEach var="file" items="${medias}">
		<tr><td>${ file.name }</td><td>${ file.description }</td><td>${ file.access }</td><td>${ file.created }</td><td><a class="btn btn-sm btn-info" href="<%=request.getContextPath()%>/media/${ file.name }"><i class="glyphicon glyphicon-download"></i>&nbsp;DOWNLOAD</a></td></tr>
		</c:forEach>
	</table>
</div>