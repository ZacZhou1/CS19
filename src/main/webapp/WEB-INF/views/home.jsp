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
				<form action="/cs19/map" method="get">
					<div class="form-group">
						<label>Please Choose Emotion </label> <select class="form-control"
							id="emotion" name="emotion">
							<option value="Happiness">Happiness</option>
							<option value="Sadness">Sadness</option>
							<option value="Fear">Fear</option>
							<option value="Anger">Anger</option>
							<option value="Suprise">Surprise</option>
							<option value="Disgust">Disgust</option>
						</select>
					</div>


					<div class="form-group">
						<label>Please Choose Range Of Emotion</label> <select
							class="form-control" id="range" name="range">
							<option value="3">3</option>
							<option value="5">5</option>
							<option value="7">7</option>
							<option value="9">9</option>
						</select>
					</div>
					<br><br>



					<div class="form-group" style="display: none" id="div1">
						<label>Very Strongly Disagree</label> <input type="range"
							class="form-control-range" id="range1" name="irange" min="1"
							max="100">
					</div>
					<div class="form-group" style="display: none" id="div2">
						<label>Strongly Disagree</label> <input type="range"
							class="form-control-range" id="range1" name="irange" min="1"
							max="100">
					</div>
					<div class="form-group" style="display: block" id="div3">
						<label>Disagree</label> <input type="range"
							class="form-control-range" name="irange" min="1" max="100">
					</div>
					<div class="form-group" style="display: none" id="div4">
						<label>Slightly Disagree</label> <input type="range"
							class="form-control-range" name="irange" min="1" max="100">
					</div>
					<div class="form-group" style="display: block" id="div5">
						<label>Normal</label> <input type="range"
							class="form-control-range" name="irange" min="1" max="100">
					</div>
					<div class="form-group" style="display: none" id="div6">
						<label>Slightly Agree</label> <input type="range"
							class="form-control-range" name="irange" min="1" max="100">
					</div>
					<div class="form-group" style="display: block" id="div7">
						<label>Agree</label> <input type="range"
							class="form-control-range" name="irange" min="1" max="100">
					</div>
					<div class="form-group" style="display: none" id="div8">
						<label>Strongly Agree</label> <input type="range"
							class="form-control-range" name="irange" min="1" max="100">
					</div>
					<div class="form-group" style="display: none" id="div9">
						<label>Very Strongly Agree</label> <input type="range"
							class="form-control-range" name="irange" min="1" max="100">
					</div>




					<br> <label>Choose The Algorithm</label>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="algorithm"
							id="exampleRadios1" value="Algorithm A" checked="checked">
						<label class="form-check-label" for="exampleRadios1">
							Algorithm A </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="algorithm"
							id="exampleRadios2" value="Algorithm B"> <label
							class="form-check-label" for="exampleRadios2"> Algorithm
							B </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="algorithm"
							id="exampleRadios3" value="Algorithm C"> <label
							class="form-check-label" for="exampleRadios3"> Algorithm
							C </label>
					</div>


					<br> <input type="button" class="btn btn-primary"
						value="submit" onclick="submitForm()">

				</form>
			</div>
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


$('select[name="range"]').on('change', function() {
	var emotion = document.getElementById("emotion");
	var emotionIndex = emotion.selectedIndex;
	var emotionValue = emotion.options[emotionIndex].value;

	var range = document.getElementById("range");
	var rangeIndex = range.selectedIndex;
	var rangeValue = range.options[rangeIndex].value;
	
	var div1 = document.getElementById("div1");
	var div2 = document.getElementById("div2");
	var div3 = document.getElementById("div3");
	var div4 = document.getElementById("div4");
	var div5 = document.getElementById("div5");
	var div6 = document.getElementById("div6");
	var div7 = document.getElementById("div7");
	var div8 = document.getElementById("div8");
	var div9 = document.getElementById("div9");
	
	if (rangeValue == 3) {
		div3.style.display = "block";
		div5.style.display = "block";
		div7.style.display = "block";
		
		div1.style.display = "none";
		div2.style.display = "none";
		div4.style.display = "none";
		div6.style.display = "none";
		div8.style.display = "none";
		div9.style.display = "none";
		return;
	}
	
	if (rangeValue == 5) {
		div2.style.display = "block";
		div3.style.display = "block";
		div5.style.display = "block";
		div7.style.display = "block";
		div8.style.display = "block";
		
		div1.style.display = "none";
		div4.style.display = "none";
		div6.style.display = "none";
		div9.style.display = "none";
		return;
	}
	
	if (rangeValue == 7) {
		div2.style.display = "block";
		div3.style.display = "block";
		div4.style.display = "block";
		div5.style.display = "block";
		div6.style.display = "block";
		div7.style.display = "block";
		div8.style.display = "block";
		
		div1.style.display = "none";
		div9.style.display = "none";
		return;
	}
	
	if (rangeValue == 9) {
		div1.style.display = "block";
		div2.style.display = "block";
		div3.style.display = "block";
		div4.style.display = "block";
		div5.style.display = "block";
		div6.style.display = "block";
		div7.style.display = "block";
		div8.style.display = "block";
		div9.style.display = "block";
		return;
	}


});

	
	function submitForm() {
		var emotion = document.getElementById("emotion");
		var emotionIndex = emotion.selectedIndex;
		var emotionValue = emotion.options[emotionIndex].value;
		
		var range = document.getElementById("range");
		var rangeIndex = range.selectedIndex;
		var rangeValue = range.options[rangeIndex].value;
		
		var range1=document.getElementsByName("irange")[0].value;
		var range2=document.getElementsByName("irange")[1].value;
		var range3=document.getElementsByName("irange")[2].value;
		var range4=document.getElementsByName("irange")[3].value;
		var range5=document.getElementsByName("irange")[4].value;
		var range6=document.getElementsByName("irange")[5].value;
		var range7=document.getElementsByName("irange")[6].value;
		var range8=document.getElementsByName("irange")[7].value;
		var range9=document.getElementsByName("irange")[8].value;
		
		var algorithmValue = 0;
		var ischecked =document.getElementsByName("algorithm");
		for (var i = 0; i < ischecked.length; i++)
		{
			if(ischecked[i])
			{
				algorithmValue = ischecked[i].value;
			}
		}	
		
		$.ajax({
			type : "post",
			url : "/cs19/map",
			data : {
				emotionValue : emotionValue,
				rangeValue : rangeValue,
				algorithmValue : algorithmValue,
				range1 : range1, 
				range2 : range2, 
				range3 : range3, 
				range4 : range4, 
				range5 : range5, 
				range6 : range6, 
				range7 : range7, 
				range8 : range8, 
				range9 : range9, 
			},
			success : function(msg) {
				window.location.href = '';
				alert("You have submitted successfully");
			},
			error : function(msg) {
				alert("The submit is failed");
			}

		});
	}
</script>
</html>
