<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<html>
<head>
<title>Psychometric</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath }/asset/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<!-- App css -->
<link href="${pageContext.request.contextPath }/asset/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/asset/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/asset/assets/css/app.min.css" rel="stylesheet" type="text/css" />



	
</head>
<style type="text/css">
table {
	border: 2px solid #ccc;
}

table th {
	background-color: #F7F7F7;
	color: #333;
	font-weight: bold;
}

table th, table td {
	padding: 5px;
	border-color: #ccc;
}
</style>
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
	
	<div class="container">
		<div class="row">
			<div class="col-sm"></div>
			<div class="col-sm">

				<br> <br> <br> <br>

				<div class="custom-file">
					<input onchange="showFilename(this.files[0])" type="file"
						class="custom-file-input" id="fileUpload"> <label
						class="custom-file-label" for="customFile" id="filename_label">Choose
						file</label>
				</div>

				<br> <br> <br>
				<div class="form-group">
					<label for="algorithmLabel">Mapping Algorithm</label> <select
						class="form-control" id="AlgorithmlSelect">
						<option value="kmeans">K-Means</option>
						<option value="xmeans">X-Means</option>
						<option value="gmeans">G-Means</option>
						<option value="mds">Classical Multi-dimensional Scaling</option>
						<option value="isomds">Kruskal's Nonmetric MDS</option>
						<option value="sammon">Sammon's Mapping</option>
						<option value="pca">Principal Component Analysis</option>
					</select>
				</div>
				<br> <br> <br>

				<button type="button" class="btn btn-primary" onclick="submit()">Submit</button>
				<hr />
				<div id="dvCSV"></div>
			</div>
			<div class="col-sm"></div>
		</div>
	</div>
	<br>
	<br>
	<br>

</body>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/js/bootstrap.min.js"></script>
	

	
<script type="text/javascript">
	$(function() {
		$("#fileUpload").bind("change", function() {
			var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.csv|.txt)$/;
			if (regex.test($("#fileUpload").val().toLowerCase())) {
				if (typeof (FileReader) != "undefined") {
					var reader = new FileReader();
					reader.onload = function(e) {
						var table = $("<table />");
						var rows = e.target.result.split("\n");
						for (var i = 0; i < rows.length; i++) {
							var row = $("<tr />");
							var cells = rows[i].split(",");
							for (var j = 0; j < cells.length; j++) {
								var cell = $("<td />");
								cells[j] = cells[j].replaceAll("\"","");
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

	function showFilename(file) {
		$("#filename_label").html(file.name);
	}

	function submit() {
		let reads = new FileReader();
		file = document.getElementById('fileUpload').files[0];
		reads.readAsText(file, 'utf-8');
		var algorithm = document.getElementById('AlgorithmlSelect').value;
		/* console.log(algorithm) */

		reads.onload = function(e) {
			/* console.log(e.target.result); */
			var csv = e.target.result;

			$.ajax({
				type : "post",
				url : "/cs19/mapping/uploadsubmit",
				data : {
					csv : csv,
					algorithm : algorithm,
				},
				success : function(msg) {
					alert("success");
					window.location = "/cs19/mapping/data";
				},
				error : function(msg) {
					alert("fail");
				}

			});
		}

	}
</script>
</html> --%>




<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Psychometric</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- App css -->
        <link href="${pageContext.request.contextPath }/asset/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath }/asset/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath }/asset/assets/css/app.min.css" rel="stylesheet" type="text/css" />
    </head>
    <style type="text/css">
		table {
			border: 2px solid #ccc;
		}
		
		table th {
			background-color: #F7F7F7;
			color: #333;
			font-weight: bold;
		}
		
		table th, table td {
			padding: 5px;
			border-color: #ccc;
		}
	</style>
    <body>
        <header id="topnav">
            <div class="navbar-custom">
                <div class="container-fluid">
                	<h1 align="center">Psychometric Mapping Tool</h1>
                </div>
            </div>
            <div class="topbar-menu">
                <div class="container-fluid">
                    <div id="navigation">
                        
                        <ul class="navigation-menu">
                            <li class="has-submenu">
                                <a href="/cs19/mapping/upload">Mapping Upload</a>
                            </li>
                            <li >
                                <a href="/cs19/mapping/data">Projection</a>
                            </li>
                            <li >
                                <a href="/cs19/mapping/questionnaire">Questionnaire List</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>

        <div class="wrapper">
            <div class="container-fluid">
            	 <div class="row">
		            <div class="col-12">
		                <h4 class="page-title">File Upload</h4>
		            </div>
		        </div>
                <div class="row" align="center"> 
                    <div class="col-12">
                        <div class="page-title-box">
                         <div class="card">
		                            <div class="card-body">
                            <div class="col-lg-6" align="left">
		                       
		
		                                <h4 class="header-title">Please choose a csv file and click upload</h4>
		                                <p class="sub-header">
		                                    There are different algorithm, different algorithm has different features and mapping the psychometirc space to different values.
		                                </p>
		
		                               

		                                    <div class="form-group mb-3">
		                                        <div class="custom-file">
													<input onchange="showFilename(this.files[0])" type="file" class="custom-file-input" id="fileUpload"> 
													<label class="custom-file-label" for="customFile" id="filename_label">Choose file</label>
												</div>
		                                    </div>
		                                    
		                                    <div class="form-group mb-3">
		                                    	<label for="algorithmLabel">Mapping Algorithm</label> 
		                                    	<select class="form-control" id="AlgorithmlSelect">
													<option value="kmeans">K-Means</option>
													<option value="xmeans">X-Means</option>
													<option value="gmeans">G-Means</option>
													<option value="mds">Classical Multi-dimensional Scaling</option>
													<option value="isomds">Kruskal's Nonmetric MDS</option>
													<option value="sammon">Sammon's Mapping</option>
													<option value="pca">Principal Component Analysis</option>
												</select>
		                                    </div>
		                                    
		                                    <div class="form-group mb-3" align="right">
		                                    	<button type="button" class="btn btn-primary waves-effect waves-light" onclick="submit()">Submit</button>
		                               		</div>
		                               
		
		                            </div>
		                        </div>
		                        <div align="center"  id="dvCSV"> </div>
		                        <br><br><br><br>
		                    </div>
                        </div>
                    </div>
                </div> 
                
            </div>
        </div>

        <script src="${pageContext.request.contextPath }/asset/assets/js/vendor.min.js"></script>
        <script src="${pageContext.request.contextPath }/asset/assets/js/app.min.js"></script>
		<script src="${pageContext.request.contextPath }/asset/assets/jquery-3.6.0.min.js"></script>
		<script src="${pageContext.request.contextPath }/asset/js/bootstrap.bundle.min.js"></script>
		<script src="${pageContext.request.contextPath }/asset/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#fileUpload").bind("change", function() {
					var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.csv|.txt)$/;
					if (regex.test($("#fileUpload").val().toLowerCase())) {
						if (typeof (FileReader) != "undefined") {
							var reader = new FileReader();
							reader.onload = function(e) {
								var table = $("<table />");
								var rows = e.target.result.split("\n");
								for (var i = 0; i < rows.length; i++) {
									var row = $("<tr />");
									var cells = rows[i].split(",");
									for (var j = 0; j < cells.length; j++) {
										var cell = $("<td />");
										cells[j] = cells[j].replaceAll("\"","");
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
		
			function showFilename(file) {
				$("#filename_label").html(file.name);
			}
		
			function submit() {
				let reads = new FileReader();
				file = document.getElementById('fileUpload').files[0];
				reads.readAsText(file, 'utf-8');
				var algorithm = document.getElementById('AlgorithmlSelect').value;
				/* console.log(algorithm) */
		
				reads.onload = function(e) {
					/* console.log(e.target.result); */
					var csv = e.target.result;
		
					$.ajax({
						type : "post",
						url : "/cs19/mapping/uploadsubmit",
						data : {
							csv : csv,
							algorithm : algorithm,
						},
						success : function(msg) {
							alert("success");
							window.location = "/cs19/mapping/data";
						},
						error : function(msg) {
							alert("fail");
						}
		
					});
				}
		
			}
		</script>
    </body>
</html>