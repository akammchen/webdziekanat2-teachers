<!-- @author Pawel -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
<%@ page import="dao.interf.students.*"%>
<%@ page import="dao.impl.students.*"%>
<%@ page import="java.util.*"%>
<%@ page import="model.students.*"%>

<%!public int nullIntconv(String str) {
		int conv = 0;
		if (str == null) {
			str = "0";
		} else if ((str.trim()).equals("null")) {
			str = "0";
		} else if (str.equals("")) {
			str = "0";
		}
		try {
			conv = Integer.parseInt(str);
		} catch (Exception e) {
		}
		return conv;
	}%>
	
	
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

<%
						long id_personalNumber = nullIntconv(request.getParameter("id_personalNumber"));
					PersonalNumber personalNumber = null;
					PersonalNumberDaoInterface personalNumberDaoInterface;
					personalNumberDaoInterface = new HibernatePersonalNumberDaoImpl();
					List pn = personalNumberDaoInterface.getAll();
					java.util.Iterator iterator1 = pn.iterator();
					while (iterator1.hasNext()) {
						PersonalNumber tmp1 = (PersonalNumber) iterator1.next();
						if(tmp1.getId().equals(id_personalNumber)){
							personalNumber=tmp1;
 							break;					
 						}
					}
					
%>
					
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="well well-sm">
					<form class="form-horizontal" action="editPersonalNumber.jsp?id_personalNumber=<%=id_personalNumber%>"
						method="post">
						<fieldset>
							<legend class="text-center">Edycja has³a</legend>
							<div class="form-group">
								<label class="col-md-3 control-label" for="index">Numer
									indeksu</label>
								<div class="col-md-9">
									<p class="form-control-static"><%=personalNumber.getPersonalNumber()%></p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="password">Haslo</label>
								<div class="col-md-9">
									<input id="password" name="password" type="text"
										value="<%=personalNumber.getPassword()%>" class="form-control">
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12 text-center">
									<button type="submit" class="btn btn-primary btn-lg">Zapisz</button>
								</div>
							</div>
						</fieldset>
						<%
							String haslo = request.getParameter("password");

							if (haslo != null) {

								if (haslo != "") {

									personalNumber.setPassword(haslo);

									personalNumberDaoInterface.update(personalNumber);
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