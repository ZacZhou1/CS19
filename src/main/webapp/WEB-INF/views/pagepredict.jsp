<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<html lang="en" style="">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Psychometric</title>
 <link
	href="${pageContext.request.contextPath }/asset/slider/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
 <link
	href="${pageContext.request.contextPath }/asset/slider/bootstrap-slider.css"
	rel="stylesheet">



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
	<br>
	<br>
	<br>
	<div class="container">
	
		<div class="row">
			<div class="col-1"></div>
			<div class="col-5">
				<input id="ex23" type="text" style="width: 200%">
			</div>
			<div class="col-1"></div>
		</div>
	</div>
<br> <br> 
	<div class="container">
		<div class="row">
			<div class="col-sm"></div>
			<div class="col-sm" >
				<div >
					<label>Psychometric Description:</label> <input id="psychometric"
						type="text" class="form-control"><br>
					<button onclick="predict()"
						class="btn btn-primary waves-effect waves-light">Predict</button>
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
			<div class="col-sm"></div>
		</div>
	</div>

</body>

<script src="${pageContext.request.contextPath }/asset/slider/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/slider/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/slider/bootstrap-slider.js"></script>
<script src="${pageContext.request.contextPath }/asset/js/bootstrap.bundle.min.js"></script>
<script>
	var idString = "${map.data.idString}";
	var psychometricSpace = "${map.data.psychometricSpace}";
	var numericSpace = "${map.data.numericSpace}";
	var algorithmtype = "${map.data.algorithm}";
	var arr_label = psychometricSpace.split(",");
	var arr_number = numericSpace.split(",");
	var arr_number1 = arr_number.map(Number);
	var arr_positions = new Array();
	for (var i = 0; i < arr_label.length; i++) {
		var pos =  (arr_number1[i] -arr_number1[0]) * 100 /(arr_number1[arr_number1.length-1] -arr_number1[0]);
		arr_positions.push(pos);
	}
	function predict() {
		var value = document.getElementById("ex23").value;
		
 		var description = document.getElementById("psychometric").value;
 		if(description==""){
 			alert("Please input description")
 			return;
 		}
		
		var box = document.getElementById('box');
		var tr = document.createElement('tr');
		var tdlPsy = document.createElement('td');
		var tdlNum = document.createElement('td');
		tdlPsy.innerText = description;
		tdlNum.innerText = value;
		tr.appendChild(tdlPsy);
		tr.appendChild(tdlNum);
		box.appendChild(tr); 
	}
	
	
	$('#ex23').slider({
		ticks: arr_number1,
	    ticks_positions: arr_positions,
	    ticks_labels: arr_label,
	    step: 0.01,
	    formatter: function(value) {
			return 'Current value: ' + value;
		}
	    
	});
</script>
</html> 