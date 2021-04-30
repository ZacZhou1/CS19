<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<div class="row">
			<div class="input-group">
				<input type="file" class="form-control" id="inputGroupFile04" 
					aria-describedby="inputGroupFileAddon04" aria-label="Upload" accept=".csv" onchange="uploadfile(this)">
				<button class="btn btn-outline-secondary" type="button"
					id="inputGroupFileAddon04" onclick="submit()">Button</button>
			</div>
		</div>
	</div>





</body>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/echarts@5/dist/echarts.min.js"></script>
<script>

function uploadfile(input) {
	
    let reads = new FileReader();
    file = document.getElementById('inputGroupFile04').files[0];
    reads.readAsText(file, 'utf-8');
    console.log(reads);
    var emptyBufferArray = reads.result;
    console.log(emptyBufferArray)
    reads.onload = function (e) {
        console.log(e)
        
    };


}

function submit() {
	console.log(', e')
	
}

	
</script>
</html> --%>

<html>
<head>
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<style type="text/css">
body
{
  font-family: Arial;
  font-size: 10pt;
}
table
{
  border: 1px solid #ccc;
}
table th
{
  background-color: #F7F7F7;
  color: #333;
  font-weight: bold;
}
table th, table td
{
  padding: 5px;
  border-color: #ccc;
}
</style>
</head>
<body>

<input type="file" id="fileUpload" />

<button type="button" class="btn btn-primary" onclick="submit()">Submit</button>
<hr />
<div id="dvCSV">
</div>
</body>


<script type="text/javascript">
$(function () {
  $("#fileUpload").bind("change", function () {
    var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.csv|.txt)$/;
    if (regex.test($("#fileUpload").val().toLowerCase())) {
      if (typeof (FileReader) != "undefined") {
        var reader = new FileReader();
        reader.onload = function (e) {
          var table = $("<table />");
          var rows = e.target.result.split("\n");
          for (var i = 0; i < rows.length; i++) {
            var row = $("<tr />");
            var cells = rows[i].split(",");
            for (var j = 0; j < cells.length; j++) {
              var cell = $("<td />");
              cell.html(cells[j]);
              row.append(cell);
            }
            table.append(row);
          }
          $("#dvCSV").html('');
          $("#dvCSV").append(table);
        }
        reader.readAsText($("#fileUpload")[0].files[0]);
      } else {
        alert("This browser does not support HTML5.");
      }
    } else {
      alert("Please upload a valid CSV file.");
    }
  });
});

function submit() {
	let reads = new FileReader();
	file = document.getElementById('fileUpload').files[0];
	reads.readAsText(file, 'utf-8');
	
	reads.onload = function (e) {
		console.log(e.target.result);
		var csv = e.target.result;
 		
		$.ajax({
			type : "post",
			url : "/cs19/uploadsubmit",
			data : {
				csv : csv,
			},
			success : function(msg) {
				alert("success");
			},
			error : function(msg) {
				alert("fail");
			}

		});
	}
	
	
}
</script>
</html>
 