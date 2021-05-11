<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<html lang="en" style="">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Psychometric</title>

<link
	href="//cdn.bootcss.com/bootstrap-slider/9.4.1/css/bootstrap-slider.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath }/asset/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />

<!-- third party css -->
<link
	href="${pageContext.request.contextPath }/asset/assets/libs/datatables/dataTables.bootstrap4.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/asset/assets/libs/datatables/responsive.bootstrap4.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/asset/assets/libs/datatables/buttons.bootstrap4.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/asset/assets/libs/datatables/select.bootstrap4.css"
	rel="stylesheet" type="text/css" />
<!-- third party css end -->

<!-- App css -->
<link
	href="${pageContext.request.contextPath }/asset/assets/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/asset/assets/css/icons.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/asset/assets/css/app.min.css"
	rel="stylesheet" type="text/css" />




</head>

<body>
<h1 class="display-4" align="center">Psychometric Mapping Tool</h1>	
<ul class="nav">
		<li class="nav-item"><a class="nav-link active"
			href="/cs19/mapping/upload">Upload</a></li>
		<li class="nav-item"><a class="nav-link"
			href="/cs19/mapping/data">Projection</a></li>
	</ul>
<br><br><br><br><br><br>
	<div class="container">
		<div class="row">
			<div class="col-sm"></div>
			<div class="col-sm">

		<input id="ex23" type="text" style="width: 500">
	
	<br><br><br><br>
	<div><label>Psychometric Description:</label>
		 <input id="psychometric" type="text" class="form-control"><br>
		<button onclick="predict()" class="btn btn-primary waves-effect waves-light">Predict</button>
	</div>
	<br>
	<div>
		<table class="table mb-0">
			<thead>
				<tr>
					<th colspan="2">The table header</th>
				</tr>
			</thead>
			<tbody id="box">

			</tbody>
		</table>
	</div>
	</div>
	<div class="col-sm"></div></div></div>

</body>
<script
	src="${pageContext.request.contextPath }/asset/js/bootstrap.min.js"></script>

<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script
	src="//cdn.bootcss.com/bootstrap-slider/9.4.1/bootstrap-slider.min.js"></script>
<script
	src="${pageContext.request.contextPath }/asset/js/bootstrap.bundle.min.js"></script>
<script>
	var idString = "${map.data.idString}";
	var psychometricSpace = "${map.data.psychometricSpace}";
	var numericSpace = "${map.data.numericSpace}";
	var algorithmtype = "${map.data.algorithm}";

	var arr_label = psychometricSpace.split(",");
	var arr_ticks = new Array();
	for (var i = 0; i < arr_label.length; i++) {
		arr_ticks.push(i);
	}

	var arr_positions = new Array();
	var length = 100 / (arr_label.length - 1);
	for (var i = 0; i < arr_label.length; i++) {
		arr_positions.push(i * length);
	}

	function predict() {
		var value = document.getElementById("ex23").value;
		var description = document.getElementById("psychometric").value;
		var valueInteger = parseInt(value);
		var numericalArr = numericSpace.split(",");
		numericalArr.map(Number);
		if (valueInteger == arr_ticks[arr_label.length - 1]) {
			valueInteger = valueInteger - 1;
		}
		var a = numericalArr[valueInteger + 1] - numericalArr[valueInteger];
		var b = value - valueInteger;
		var c = parseFloat(numericalArr[valueInteger]);
		var d = a * b + c;

		var e = parseFloat(d).toFixed(3);
		var result = e.substring(0, e.toString().length - 1);

		var box = document.getElementById('box');

		var tr = document.createElement('tr');
		var tdlPsy = document.createElement('td');
		var tdlNum = document.createElement('td');

		tdlPsy.innerText = description;
		tdlNum.innerText = result;

		tr.appendChild(tdlPsy);
		tr.appendChild(tdlNum);
		box.appendChild(tr);
	}

	$('#ex23').slider({
		ticks : arr_ticks,
		ticks_labels : arr_label,
		ticks_positions : arr_positions,
		step : 0.01
	});
</script>
</html>