
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
		<li class="nav-item"><a class="nav-link"
			href="/cs19/mapping/questionnaire">Questionnaire List</a></li>
	</ul>
	<br>

	<div class="container">


		<div class="row">
			<div class="col-sm"></div>
			<div class="col-sm">


				<div class="form-group">
					<label>Theme</label> <input class="form-control" id="theme">
				</div>


				<div class="form-group">
					<label>Min Value</label> <input class="form-control" id="minvalue">
				</div>

				<div class="form-group">
					<label>Max Value</label> <input class="form-control" id="maxvalue">
				</div>
				<br>



				<div class="input-group mb-3">
					<input type="text" class="form-control"
						placeholder="Description Number" id="descriptionnumber">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button"
							onclick="rangeClick()">Confirm</button>
					</div>
				</div>
			</div>
			<div class="col-sm"></div>


		</div>
		<br> <br>

		<div id="box" align="center"></div>
		<br> <br>
		<div class="row">
			<div class="col-sm"></div>
			<div class="col-sm">
				<button type="button" class="btn btn-primary" onclick="submit()">submit</button>
			</div>
			<div class="col-sm"></div>
		</div>
	</div>
	<br>
	<br>
	<br>

</body>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/asset/js/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath }/asset/js/bootstrap.min.js"></script>

<script>
	function rangeClick() {
		var goButton = document.getElementById("descriptionnumber");
		var range = goButton.value;
		var isNum = isRealNum(range);//judge if it is a number

		if (!isNum) {//if it is not a number, alert
			alert("Please Input Number");
			return;
		}
		var box = document.getElementById('box');

		//delete all the child nodes of element id box
		var childs = box.childNodes;
		for (var i = childs.length - 1; i >= 0; i--) {
			box.removeChild(childs[i]);
		}

		for (var i = 0; i < range; i++) {

			var labelPsy = document.createElement('label');

			var br = document.createElement('br');
			var inputPsy = document.createElement('input');

			labelPsy.innerText = 'Description: ';
			inputPsy.name = 'psy';
			inputPsy.required = 'required';
			inputPsy.type = 'text';

			box.appendChild(labelPsy);
			box.appendChild(inputPsy);

			box.appendChild(br);
		}

	}

	function submit() {
		var psy = document.getElementsByName("psy");
		var theme = document.getElementById("theme").value;
		var minvalue = document.getElementById("minvalue").value;
		var maxvalue = document.getElementById("maxvalue").value;
		var descriptionnumber = document.getElementById("descriptionnumber").value;
		var psyArr = new Array();
		for (var i = 0; i < psy.length; i++) {
			psyArr[i] = psy[i].value
		}

		$.ajax({
			type : "post",
			url : "/cs19/mapping/questionnairecreate/create",
			data : {
				psyArr : psyArr,
				theme : theme,
				minvalue : minvalue,
				maxvalue : maxvalue,
				descriptionnumber : descriptionnumber,
			},
			success : function(msg) {
				alert("success");
				window.location = "/cs19/mapping/questionnaire";
			},
			error : function(msg) {
				alert("fail");
			}

		});
	}

	function isRealNum(val) {
		if (val === "" || val == null) {
			return false;
		}
		if (!isNaN(val)) {
			return true;
		} else {
			return false;
		}
	}

	function myIsNaN(value) {
		return typeof value === 'number' && !isNaN(value);
	}
</script>


</html>