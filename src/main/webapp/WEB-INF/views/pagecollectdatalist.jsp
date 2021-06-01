<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<html>
<head>
<title>Psychometric</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="${pageContext.request.contextPath }/asset/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath }/asset/assets/libs/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/asset/assets/libs/datatables/responsive.bootstrap4.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/asset/assets/libs/datatables/buttons.bootstrap4.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/asset/assets/libs/datatables/select.bootstrap4.css" rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath }/asset/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/asset/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/asset/assets/css/app.min.css" rel="stylesheet" type="text/css" />

</head>
<style>
</style>

<body>

	<h1 class="display-4" align="center">Psychometric Survey</h1>
		<div class="container">
	  		<div class="row"> 
			    <img src="${pageContext.request.contextPath }/asset/image/mentalwellbeing.jpg" class="d-block w-100" alt="...">
  			</div>
		</div>
		<br>

		<div class="container">
			<table id="basic-datatable" class="table dt-responsive nowrap">
				<thead>
					<tr>
						<th scope="col">Theme</th>
						<th scope="col">Range</th>
						<th scope="col">Description</th>
						<th scope="col">Detail</th> 
					</tr>
				</thead>
				<c:forEach items="${map.documentData }" var="data">
					<tr>
						<td>${data.theme}</td>
						<td>${data.minvalue} - ${data.maxvalue}</td>
						<td>${data.descriptions}</td>
						<td><a href="/cs19/mapping/collectdata/${data.id}">Detail</a></td> 
					</tr>
				</c:forEach>
			</table>
		</div>
</body>

<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/js/bootstrap.min.js"></script>

<!-- Vendor js -->
<script src="${pageContext.request.contextPath }/asset/assets/js/vendor.min.js"></script>

<!-- third party js -->
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/dataTables.bootstrap4.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/responsive.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/buttons.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/buttons.flash.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/buttons.print.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/dataTables.keyTable.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/dataTables.select.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/pdfmake/pdfmake.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/pdfmake/vfs_fonts.js"></script>
<!-- third party js ends -->

<!-- Datatables init -->
<script src="${pageContext.request.contextPath }/asset/assets/js/pages/datatables.init.js"></script>

<!-- App js-->
<script src="${pageContext.request.contextPath }/asset/assets/js/app.min.js"></script>

</html>


