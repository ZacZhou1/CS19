<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<html>
<head>
<title>Psychometric</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath }/asset/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/asset/css/bootstrap-slider.css" rel="stylesheet" type="text/css">

</head>
<body>
	<h1 class="display-4" align="center">Psychometric Mapping Tool</h1>



	<a href="/cs19/mapping/upload" class="btn btn-primary btn-lg "
		role="button" aria-pressed="true">File Upload</a>
	<a href="/cs19/mapping/data" class="btn btn-primary btn-lg "
		role="button" aria-pressed="true">Stored Algorithm</a>

	<br>
	<br>
	<br>
	<br>
	<div class="container">
		
<input id="ex23" type="text"/>
	</div>
</body>

<script src="${pageContext.request.contextPath }/asset/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/js/bootstrap-slider.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/js/popper.min.js"></script>
<script>
$("#ex23").slider({
    ticks: [0, 1, 2, 3, 4],
    ticks_positions: [0, 30, 60, 70, 90, 100],
    ticks_snap_bounds: 200,
	formatter: function(value) {
		return 'Current value: ' + value;
	},
	ticks_tooltip: true,
	step: 0.01
});
</script>
</html>
