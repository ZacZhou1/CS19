<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

<div class="row" >
<div >
					 <select class="form-control" id="AlgorithmlSelect">
						<option value="kmeans">K-Means</option>
						<option value="xmeans">X-Means</option>
						<option value="gmeans">G-Means</option>
						<option value="mds">Classical Multi-dimensional Scaling</option>
						<option value="isomds">Kruskal's Nonmetric MDS</option>
						<option value="sammon">Sammon's Mapping</option>
						<option value="pca">Principal Component Analysis</option>
					</select>
				</div>
				<button type="button" class="btn btn-primary" onclick="submit()">Submit</button>

</div>


	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<table id="basicdatatable" class="table dt-responsive nowrap">
						<thead>
							<tr>
								<th scope="col">User Name</th>
								<c:set var="tablehead1" value="${map.tablehead} "/>
								<c:set var="tablehead2" value="${fn:split(tablehead1, ',')}" />
								<c:forEach items="${tablehead2}" var="tableheaddata">
									<th>${tableheaddata}</th>
									
									</c:forEach>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${map.documentData }" var="data">
								<tr>
								
									<td>${data.username}</td>
									<c:set var="string1" value="${data.values} "/>
									<c:set var="string2" value="${fn:split(string1, ',')}" />
									<c:forEach items="${string2}" var="data1">
									<td>${data1}</td>
									
									</c:forEach>
									
									
									
									<%-- <td>${data.values}</td> --%>
								</tr>
							</c:forEach>
						</tbody>
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

	
	
<script src="${pageContext.request.contextPath }/asset/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/csv/FileSaver.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/csv/tableexport.js"></script>

<script type="text/javascript">

var questionnaireid ="${map.questionnaireid}" ;

var table = TableExport(document.getElementsByTagName("table"), {
	  formats: ["csv"],
	  filename: questionnaireid
	});

var exportData = table.getExportData();;


var csvData = exportData.basicdatatable.csv.data;


	
	
function submit() {
	var algorithm = document.getElementById('AlgorithmlSelect').value;
	$.ajax({
		type : "post",
		url : "/cs19/mapping/questionnaire/data/submit",
		data : {
			csvData : csvData,
			algorithm : algorithm,
		},
		success : function(msg) {
			alert("success");
			window.location = "/cs19/mapping/data";
		},
		error : function(msg) {
			alert("fail");
		}

	});
}
	
</script>


</html>