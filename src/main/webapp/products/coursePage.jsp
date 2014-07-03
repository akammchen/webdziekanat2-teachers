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
src='http://bednar.url.ph/webdz/pace.js'></script>

<link href="http://bednar.url.ph/webdz/pace-theme-corner-indicator.css"
rel="stylesheet" />
<link href="http://bednar.url.ph/webdz/bootstrap.css" rel="stylesheet"
type="text/css" />
<link href="http://bednar.url.ph/webdz/bootstrap-theme.css"
rel="stylesheet" type="text/css" />
<link href="http://bednar.url.ph/webdz/pace-theme-corner-indicator.css"
rel="stylesheet" type="text/css" />
<link href="http://bednar.url.ph/webdz/footable-0.1.css"
rel="stylesheet" type="text/css" />

<script src="http://bednar.url.ph/webdz/jquery-1.11.1.js"
type="text/javascript"></script>
<script src="http://bednar.url.ph/webdz/bootstrap.js"
type="text/javascript"></script>
<script src="http://bednar.url.ph/webdz/footable-0.1.js"
type="text/javascript"></script>
<script src="http://mymaplist.com/js/vendor/TweenLite.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<div class="row">
<div class="col-sm-3 col-sm-offset-2 text-center">
	<img src="/webdzieknat2/webPics/przedmioty.jpg" alt="przedmioty" class="img-thumbnail">
	</div>
<ul class="pager">
		<li><a href="printCourses.jsp" target="frameCourses">Lista przedmiot�w</a>
		</li>
		<li><a href="addCourses.jsp" target="frameCourses">Dodaj</a></li>
	</ul>
</div>
	
	<iframe name="frameCourses" style="margin-top: 10px;" width="100%"
		height="2000px" frameBorder="0"></iframe>
</body>
</html>
