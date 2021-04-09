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
</head>
<body>
	<h1 class="display-4" align="center">Psychometric Mapping Tool</h1>



	<div class="container">
		<img
			src="${pageContext.request.contextPath }/asset/image/psychometric.jpg"
			class="img-fluid w-100 h-50" alt="...">
	</div>
	<br>
	<br>



	<div class="container">


		<div class="row">
			<div class="col-sm"></div>
			<div class="col-sm">

				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="Range"
						id="inputRange">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button"
							onclick="rangeClick()">Confirm</button>
					</div>
				</div>
			</div>
			<div class="col-sm"></div>


		</div>
		<br>
		<br>
		
		<div id="box" align="center"></div>
		<br><br>
		<div class="row">
		<div class="col-sm"></div>
		<div class="col-sm"><button type="button" class="btn btn-primary" onclick="submit()">submit</button></div>
		<div class="col-sm"></div>
		</div>
	</div>


	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script>
	function rangeClick() {
		var goButton = document.getElementById("inputRange");
		var range = goButton.value;
		var isNum = isRealNum(range);//judge if it is a number

		if (!isNum) {//if it is not a number, alert
			alert("Please Input Number");
			return;
		}
		var box = document.getElementById('box');
		
		
		//delete all the child nodes of element id box
		var childs = box.childNodes; 
		for(var i = childs .length - 1; i >= 0; i--) {
		  box.removeChild(childs[i]);
		}
		
		for (var i = 0; i < range; i++) {

			var labelPsy = document.createElement('label');
			var labelNum = document.createElement('label');
			var br = document.createElement('br');
			var inputPsy = document.createElement('input');
			var inputNum = document.createElement('input');
			
			labelPsy.innerText = 'Emotion';
			inputPsy.name = 'psy';
			inputPsy.required = 'required';
			inputNum.name = 'num';
			labelNum.innerText = 'Value';
			
			box.appendChild(labelPsy);
			box.appendChild(inputPsy);
			box.appendChild(labelNum);
			box.appendChild(inputNum);

			box.appendChild(br);
		}

	}
	
	function submit() {
		var psy = document.getElementsByName("psy");
		var psyArr = new Array();
		for(var i = 0; i < psy.length; i++){
			psyArr[i] = psy[i].value
		}
		var num = document.getElementsByName("num");
		var numArr = new Array();
		for(var i = 0; i < num.length; i++){
			numArr[i] = num[i].value
		}
		$.ajax({
			type : "post",
			url : "/cs19/map",
			data : {
				psyArr : psyArr,
				numArr : numArr,
			},
			success : function(msg) {
				document.write(msg);
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
