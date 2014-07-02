<!-- @author Pawel -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>

<%@ page import="dao.interf.products.*"%>
<%@ page import="dao.impl.products.*"%>
<%@ page import="java.util.*"%>
<%@ page import="model.products.*"%>

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
	<img src="/webdzieknat2/webPics/przedmioty.jpg" alt="przedmioty" class="img-thumbnail">
	</div>
<ul class="pager">
		<li><a href="printCourses.jsp" target="frameCourses">Lista przedmiotów</a>
		</li>
		<li><a href="addCourses.jsp" target="frameCourses">Dodaj</a></li>
	</ul>
</div>
	
	<iframe name="frameCourses" style="margin-top: 10px;" width="100%"
		height="2000px" frameBorder="0"></iframe>
</body>
</html>