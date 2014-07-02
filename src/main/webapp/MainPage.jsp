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
				<a class="navbar-brand" href="index.jsp">WEB DZIEKANAT&nbsp <span
					class="glyphicon glyphicon-book"></span></a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">STUDENT<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="students/student/studentPage.jsp"
								target="frame">Studenci</a></li>
							<li class="divider"></li>
							<li><a href="students/personalNumber/personalNumberPage.jsp"
								target="frame">Indeksy</a></li>
							<li class="divider"></li>
							<li><a href="students/rating/ratingPage.jsp" target="frame">Oceny</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">KURSY <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="products/coursePage.jsp" target="frame">Przedmioty</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<div id="content">
		<iframe name="frame" height="800px" width="100%" frameBorder="0"></iframe>
	</div>
</body>
</html>
