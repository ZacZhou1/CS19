<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<html lang="en" style="">
<head>
<meta charset="utf-8">
<title>Slider for Bootstrap Examples Page</title>
<link href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="//cdn.bootcss.com/bootstrap-slider/9.4.1/css/bootstrap-slider.css" rel="stylesheet">
</head>

<body>
	<div class="container">
				<input id="ex23" type="text" style="width:500">
	</div>
</body>

<script src="//cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap-slider/9.4.1/bootstrap-slider.min.js"></script>

<script>
	$('#ex23').slider({
		ticks : [ 0, 1, 2, 3, 4 ],
		ticks_labels: ['little', 'less', 'normal', 'very', 'extra'],
		ticks_positions : [ 0, 25, 50, 75, 100 ],
		step : 0.01
	});
	
	var name = document.getElementById("ex23").value;
    alert(name);

	
	
	
</script>
</html>