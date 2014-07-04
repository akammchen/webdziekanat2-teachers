<!-- @author Pawel -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
<!DOCTYPE html>
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
<script src="http://mymaplist.com/js/vendor/TweenLite.min.js"></script>


</head>
<body>
	<nav class="navbar navbar-inverse" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="MainPageAdmin.jsp">WEB DZIEKANAT&nbsp-&nbspADMIN <span
					class="glyphicon glyphicon-user"></span></a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">OSOBY<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="students/student/studentPageAdmin.jsp"
								target="frame">U¿ytkownicy</a></li>
							<li class="divider"></li>
							<li><a href="students/personalNumber/personalNumberPageAdmin.jsp"
								target="frame">Numery identyfikacyjne</a></li>
							<li class="divider"></li>
							<li><a href="students/rating/ratingPage.jsp" target="frame">Oceny studentów</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">KURSY <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="products/coursePage.jsp" target="frame">Przedmioty</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.jsp" style="color: red">Wyloguj&nbsp <span
							class="glyphicon glyphicon-log-out"></span></a></li>
				</ul>
			</div>
		</div>
	</nav>
<!-- 	<div class="jumbotron" style="padding-top:5px; padding-bottom:5px;"> -->
<!-- 			<h2 class="text-center">Witaj w wirtualnym dziekanacie Politechniki ï¿½ï¿½dzkiej!</h2> -->
<!-- 	</div> -->
	<div id="content">
		<iframe name="frame" height="800px" width="100%" frameBorder="0"></iframe>
	</div>
</body>
</html>
