<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<html>
<head>
<title>Psychometric</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="${pageContext.request.contextPath}/asset/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<h1 class="display-4" align="center">Psychometric Mapping Tool</h1>



<a href="/cs19/upload" class="btn btn-primary btn-lg " role="button" aria-pressed="true">File Upload</a>
<a href="/cs19/storedalgorithm" class="btn btn-primary btn-lg " role="button" aria-pressed="true">Stored Algorithm</a>
</body>
</html>
 --%>
 
<%--  <html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>jQuery Bootstrap Slider Plugin Examples</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap.min.css">
    <link href="../../css/bootstrap-slider.css" rel="stylesheet" type="text/css">
 
</head>
 
<body >
<div class="container">
    <h2>Custom tick marks.</h2>
    <input id="ex4" type="text" data-slider-ticks="[0, 100, 200, 300, 400,500,600,700]" data-slider-ticks-snap-bounds="30"
           data-slider-ticks-labels='["1", "2", "3", "4", "5","6","7","8","9"]'/>
</div>
<script src="../../js/jquery.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/bootstrap-slider.js"></script>
<script>
    $("#ex4").slider({
        ticks: [0, 100, 200, 300, 400,500,600,700,800],
        ticks_labels: ['1', '2', '3', '4', '5','6', '7', '8', '9'],
        ticks_snap_bounds: 100
    });
</script>
</body>
</html> --%>


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
<link href="${pageContext.request.contextPath }/asset/css/bootstrap-slider.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1 class="display-4" align="center">Psychometric Mapping Tool</h1>



<ul class="nav">
  <li class="nav-item">
    <a class="nav-link active" href="/cs19/mapping/upload">upload</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/cs19/mapping/data">Projection</a>
  </li>
</ul>


	<table class="table">
		<thead>
			<tr>
				
				<th scope="col">psychometricSpace</th>
				<th scope="col">numericSpace</th>
				<th scope="col">algorithm</th>
				<!-- <th scope="col">Detail</th> -->
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${map.documentData }" var="data">

				<tr>
					
					<th>${data.psychometricSpace}</th>
					<td>${data.numericSpace}</td>
					<td>${data.algorithm}</td>
					<%-- <td><a href="/cs19/storedalgorithm/${data.idString}">click</a></td> --%>
				</tr>

			</c:forEach>
		</tbody>
	</table>

</body>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/js/bootstrap-slider.js"></script>
<script>
	
</script>
</html>
