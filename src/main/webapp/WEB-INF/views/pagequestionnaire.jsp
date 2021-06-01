<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<html>
<head>
<title>Psychometric</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath }/asset/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
 <!-- third party css -->
<link href="${pageContext.request.contextPath }/asset/assets/libs/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/asset/assets/libs/datatables/responsive.bootstrap4.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/asset/assets/libs/datatables/buttons.bootstrap4.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/asset/assets/libs/datatables/select.bootstrap4.css" rel="stylesheet" type="text/css" />
<!-- third party css end -->

<!-- App css -->
<link href="${pageContext.request.contextPath }/asset/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/asset/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/asset/assets/css/app.min.css" rel="stylesheet" type="text/css" />

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
	</ul><br>
	<div class="container">
		<div class="row">
			<div class="col-sm"></div>
			<div class="col-sm"> </div>
			<div class="col-sm" align="right"> <a type="button" class="btn btn-primary" href="/cs19/mapping/questionnairecreate">Create Questionnaire</a></div>
		</div>
	</div>
	<br>
		<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">


					<table id="basic-datatable" class="table dt-responsive nowrap">
						<thead>
							<tr>

								<th scope="col">Theme</th>
								<th scope="col">Range</th>
								<th scope="col">Description</th>
								<th scope="col">Detail</th> 
							</tr>
						</thead>


						<c:forEach items="${map.documentData }" var="data">

							<tr>

								<td>${data.theme}</td>
								<td>${data.minvalue} - ${data.maxvalue}</td>
								<td>${data.descriptions}</td>
								<td><a href="/cs19/mapping/questionnaire/data/${data.id}">Detail</a></td> 
								
							</tr>

						</c:forEach>
					</table>

				</div>
				<!-- end card body-->
			</div>
			<!-- end card -->
		</div>
		<!-- end col-->
	</div>
	<!-- end row-->
	<br>
	<br>
	<br>

</body>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/js/bootstrap.min.js"></script>


<!-- Vendor js -->
<script src="${pageContext.request.contextPath }/asset/assets/js/vendor.min.js"></script>

<!-- third party js -->
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/dataTables.bootstrap4.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/responsive.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/buttons.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/buttons.flash.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/buttons.print.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/dataTables.keyTable.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/dataTables.select.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/pdfmake/pdfmake.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/assets/libs/pdfmake/vfs_fonts.js"></script>
<!-- third party js ends -->

<!-- Datatables init -->
<script src="${pageContext.request.contextPath }/asset/assets/js/pages/datatables.init.js"></script>

<!-- App js-->
<script src="${pageContext.request.contextPath }/asset/assets/js/app.min.js"></script>

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

		<link rel="shortcut icon" href="${pageContext.request.contextPath }/asset/assets/images/favicon.ico">
		<!-- third party css -->
		<link href="${pageContext.request.contextPath }/asset/assets/libs/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath }/asset/assets/libs/datatables/responsive.bootstrap4.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath }/asset/assets/libs/datatables/buttons.bootstrap4.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath }/asset/assets/libs/datatables/select.bootstrap4.css" rel="stylesheet" type="text/css" />
		<!-- third party css end -->
		
		<!-- App css -->
		<link href="${pageContext.request.contextPath }/asset/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath }/asset/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath }/asset/assets/css/app.min.css" rel="stylesheet" type="text/css" />
		 
		    
    </head>
   
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
                            <li >
                                <a href="/cs19/mapping/upload">Mapping Upload</a>
                            </li>
                            <li class="has-submenu">
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
		                <h4 class="page-title">Questionnaire List</h4>
		            </div>
		        </div>
		          
		        
                <div class="row"> 
                    <div class="col-12">
                        <div class="page-title-box">
                        <div class="card">
							<div class="card-body">
							
							<div class="row"> 
			                    <div class="col-12">
						        	<div class="container">
										<div class="row">
											<div class="col-sm"> </div>
											<div class="col-sm"> </div>
											<div class="col-sm" align="right"><a type="button" class="btn btn-primary" href="/cs19/mapping/questionnairecreate">Create Questionnaire</a></div>
										</div>
									</div>
								</div>
					        </div>
							<br>
								<table id="basic-datatable" class="table dt-responsive nowrap">
									<thead>
										<tr>
											<th scope="col">Theme</th>
											<th scope="col">Range</th>
											<th scope="col">Description</th>
											<th scope="col">Detail</th> 
										</tr>
									</thead>
									<c:forEach items="${map.documentData }" var="data">
										<tr>
											<td>${data.theme}</td>
											<td>${data.minvalue} - ${data.maxvalue}</td>
											<td>${data.descriptions}</td>
											<td><a href="/cs19/mapping/questionnaire/data/${data.id}">Detail</a></td> 
										</tr>
									</c:forEach>
								</table>
							</div>
							</div>
                        </div>
                    </div>
                </div> 
                
            </div>
        </div>
        
        
        <script src="${pageContext.request.contextPath }/asset/assets/js/app.min.js"></script>
		<script src="${pageContext.request.contextPath }/asset/assets/jquery-3.6.0.min.js"></script>
		<script src="${pageContext.request.contextPath }/asset/js/bootstrap.bundle.min.js"></script>
		<script src="${pageContext.request.contextPath }/asset/js/bootstrap.min.js"></script>
        
		<!-- Vendor js -->
		<script src="${pageContext.request.contextPath }/asset/assets/js/vendor.min.js"></script>
		
		<!-- third party js -->
		<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/dataTables.bootstrap4.js"></script>
		<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/dataTables.responsive.min.js"></script>
		<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/responsive.bootstrap4.min.js"></script>
		<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/dataTables.buttons.min.js"></script>
		<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/buttons.bootstrap4.min.js"></script>
		<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/buttons.html5.min.js"></script>
		<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/buttons.flash.min.js"></script>
		<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/buttons.print.min.js"></script>
		<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/dataTables.keyTable.min.js"></script>
		<script src="${pageContext.request.contextPath }/asset/assets/libs/datatables/dataTables.select.min.js"></script>
		<script src="${pageContext.request.contextPath }/asset/assets/libs/pdfmake/pdfmake.min.js"></script>
		<script src="${pageContext.request.contextPath }/asset/assets/libs/pdfmake/vfs_fonts.js"></script>
		<!-- third party js ends -->
		
		<!-- Datatables init -->
		<script src="${pageContext.request.contextPath }/asset/assets/js/pages/datatables.init.js"></script>
		
		<!-- App js-->
		<script src="${pageContext.request.contextPath }/asset/assets/js/app.min.js"></script>

    </body>
</html>