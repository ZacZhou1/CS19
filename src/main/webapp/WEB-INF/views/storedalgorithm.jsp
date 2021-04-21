<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<html>
<head>
<title>Psychometric</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="${pageContext.request.contextPath }/asset/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<h1 class="display-4" align="center">Psychometric Mapping Tool</h1>


	<table class="table">
		<thead>
			<tr>
				<th scope="col">User Name</th>
				<th scope="col">psychometricSpace</th>
				<th scope="col">numericSpace</th>
				<th scope="col">Detail</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${map.documentData }" var="data">

				<tr>
					<th >${data.userName} </th>
					<td>${data.psychometricSpace}</td>
					<td>${data.numericSpace}</td>
					<td><a href="/cs19/storedalgorithm/${data.idString}">click</a></td>
				</tr>

			</c:forEach>
		</tbody>
	</table>

</body>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script>
	
</script>
</html>
