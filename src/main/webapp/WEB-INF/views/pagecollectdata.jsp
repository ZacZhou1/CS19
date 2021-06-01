<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<html>
<head>
<title>Psychometric</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="${pageContext.request.contextPath }/asset/slider/bootstrap-slider.css"
	rel="stylesheet">

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
<style>
</style>

<body>

	<h1 class="display-4" align="center">Psychometric Survey</h1>
	
	<div class="container">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm">
				<form>
					<div id="box" class="form-group"></div>
				</form>
			</div>
			<div class="col-sm-3"></div>
		</div>
		<br>
		
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm">
			<form>
				<div class="form-group">
					<label>Name</label> 
					<input class="form-control" id="username" placeholder="Please input your name">
				</div>
				</form>
			</div>
			<div class="col-sm-3"></div>
		</div>
		
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm" align="right">
				<a type="button" class="btn btn-secondary" href="/cs19/mapping/collectdata/list">Back</a>
				<button onclick="submit()" class="btn btn-primary">Submit</button>
			</div>
			<div class="col-sm-3"></div>
		</div>
		
	</div>
</body>


<script
	src="${pageContext.request.contextPath }/asset/slider/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/asset/slider/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath }/asset/slider/bootstrap-slider.js"></script>
<script
	src="${pageContext.request.contextPath }/asset/js/bootstrap.bundle.min.js"></script>


<script>
	var questionnaireid = "${map.questionnaire.id}";
	var theme = "${map.questionnaire.theme}";
	var minvalue = "${map.questionnaire.minvalue}";
	var maxvalue = "${map.questionnaire.maxvalue}";
	var descriptionnumber = "${map.questionnaire.descriptionnumber}";
	var descriptions = "${map.questionnaire.descriptions}";
	var arr_description = descriptions.split(",");
	var box = document.getElementById('box');
	for (var i = 0; i < descriptionnumber; i++) {
		var labeldescription = document.createElement('label');
		var br = document.createElement('br');
		var inputdescription = document.createElement('input');
		labeldescription.innerText = arr_description[i];
		labeldescription.name = 'psylabel';
		inputdescription.name = 'psynumber';
		inputdescription.type = 'range';
		inputdescription.style = 'width: 100%';
		box.appendChild(labeldescription);
		box.appendChild(br);
		box.appendChild(inputdescription);
		box.appendChild(br);
		box.appendChild(br);
	}
	$("input[name='psynumber']").slider({
		min : minvalue,
		max : maxvalue,
		step : 0.01,
		ticks : [ 0, maxvalue ],
		ticks_positions : [ 0, 100 ],
		ticks_labels : [ minvalue, maxvalue ],
	});
	function submit() {
		var psynumber = document.getElementsByName("psynumber");
		var username = document.getElementById("username").value;
		var arr_number = new Array();
		for (var i = 0; i < psynumber.length; i++) {
			arr_number[i] = psynumber[i].value
		}
		$.ajax({
			type : "post",
			url : "/cs19/mapping/collectdata/submit",
			data : {
				arr_description : arr_description,
				questionnaireid : questionnaireid,
				arr_number : arr_number,
				username: username
			},
			success : function(msg) {
				alert("success");
				window.location = "/cs19/mapping/collectdata/list";
			},
			error : function(msg) {
				alert("fail");
			}
		});
	}
</script>



</html>