<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<html lang="en" style="">
<head>
<meta charset="utf-8">
<title></title>
</head>

<body>
	<div class="table-responsive">
		<table id="firm_table"
			class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>#</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>E-Mail</th>
					<th>Number</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>Delpha</td>
					<td>siliciophite</td>
					<td>circumflex@masterwork.net</td>
					<td>997300858</td>
				</tr>

			</tbody>
		</table>
	</div>

</body>

<script src="${pageContext.request.contextPath }/asset/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/csv/FileSaver.min.js"></script>
<script src="${pageContext.request.contextPath }/asset/csv/tableexport.js"></script>

<script type="text/javascript">

$('.table').tableExport({
    filename: 'table',
    format: 'csv'
});
</script>

</html>