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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="well well-sm">
					<form class="form-horizontal" action="addPersonalNumber.jsp"
						method="post">
						<fieldset>
							<legend class="text-center">Dodawanie indeksu do bazy</legend>
							<div class="form-group">
								<label class="col-md-3 control-label" for="index">Numer
									indeksu</label>
								<div class="col-md-9">
									<input id="index" name="index" type="text"
										placeholder="Podaj numer indeksu" class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="password">Haslo</label>
								<div class="col-md-9">
									<input id="password" name="password" type="text"
										value="<%=UUID.randomUUID().toString().substring(0, 7)%>" class="form-control">
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12 text-center">
									<button type="submit" class="btn btn-primary btn-lg">Dodaj</button>
								</div>
							</div>
						</fieldset>
						<%
							String indeks = request.getParameter("index");
							String haslo = request.getParameter("password");

							if (indeks != null && haslo != null) {

								if (indeks != "" && haslo != "") {

									PersonalNumber pn = new PersonalNumber();
									pn.setPersonalNumber(Integer.parseInt(indeks));
									pn.setPassword(haslo);

									PersonalNumberDaoInterface personalNumberDaoInterface;
									personalNumberDaoInterface = new HibernatePersonalNumberDaoImpl();
									personalNumberDaoInterface.add(pn);
								}
							}
						%>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- </div> -->
	<!-- </div> -->
</body>
</html>