<!-- @author Pawel -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>

<%@ page import="dao.interf.students.*"%>
<%@ page import="dao.impl.students.*"%>
<%@ page import="java.util.*"%>
<%@ page import="model.students.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script data-pace-options='{ "ajax": false }'
	src='/webdzieknat2/pace/pace.js'></script>

<link href="/webdzieknat2/pace/themes/pace-theme-corner-indicator.css"
	rel="stylesheet" />
<link href="/webdzieknat2/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="/webdzieknat2/bootstrap/css/bootstrap-theme.css"
	rel="stylesheet" type="text/css" />
<link href="/webdzieknat2/pace/themes/pace-theme-corner-indicator.css"
	rel="stylesheet" type="text/css" />
<link href="/webdzieknat2/FooTable/css/footable-0.1.css"
	rel="stylesheet" type="text/css" />

<script src="/webdzieknat2/FooTable/js/jquery-1.11.1.js"
	type="text/javascript"></script>
<script src="/webdzieknat2/bootstrap/js/bootstrap.js"
	type="text/javascript"></script>
<script src="/webdzieknat2/FooTable/js/footable-0.1.js"
	type="text/javascript"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<div class="row">
<div class="col-sm-3 col-sm-offset-2 text-center">
	<img src="/webdzieknat2/webPics/students.jpg" alt="Studenci" class="img-thumbnail">
	</div>
<ul class="pager">
		<li><a href="printStudents.jsp" target="frameStudents">Lista studentów</a>
		</li>
		<li><a href="addStudent.jsp" target="frameStudents">Dodaj</a></li>
	</ul>
</div>
	
	<iframe name="frameStudents" style="margin-top: 10px;" width="100%"
		height="2000px" frameBorder="0"></iframe>
</body>
</html>