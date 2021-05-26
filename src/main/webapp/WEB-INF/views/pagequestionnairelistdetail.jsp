<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<html>
<head>
<title>Psychometric</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath }/asset/css/bootstrap.min.css" rel="stylesheet" type="text/css" />


<link href="${pageContext.request.contextPath }/asset/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/asset/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/asset/assets/css/app.min.css" rel="stylesheet" type="text/css" />



	
</head>

<body>

	<h1 class="display-4" align="center">Psychometric Mapping Tool</h1>
	<ul class="nav">
		<li class="nav-item"><a class="nav-link active"
			href="/cs19/mapping/upload">Upload</a></li>
		<li class="nav-item"><a class="nav-link"
			href="/cs19/mapping/data">Projection</a></li>
			<li class="nav-item"><a class="nav-link"
			href="/cs19/mapping/questionnaire">Questionnaire List</a></li>
	</ul>
	
	
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">


					<table id="basic-datatable" class="table dt-responsive nowrap">
						<thead>
							<tr>

								
								
								<th scope="col">Descriptions</th>
								<th scope="col">Values</th>
								<!-- <th scope="col">Detail</th> -->
							</tr>
						</thead>


						<c:forEach items="${map.documentData }" var="data">

							<tr>

								<td>${data.descriptions}</td>
								<td>${data.values}</td>

								
							</tr>

						</c:forEach>
					</table>

				</div>
				<!-- end card body-->
			</div>
			<!-- end card -->
		</div>
		<!-- end col-->
	</div>
	<!-- end row-->
	

</body>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/asset/js/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath }/asset/js/bootstrap.min.js"></script>
	

</html>