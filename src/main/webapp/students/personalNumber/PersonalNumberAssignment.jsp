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

<%
	long id_personalNumber = nullIntconv(request
			.getParameter("id_personalNumber"));
	PersonalNumber personalNumberToRemove = null;
	PersonalNumberDaoInterface personalNumberDaoInterface;
	personalNumberDaoInterface = new HibernatePersonalNumberDaoImpl();
	List pn = personalNumberDaoInterface.getAll();
	java.util.Iterator iterator1 = pn.iterator();
	while (iterator1.hasNext()) {
		PersonalNumber tmp1 = (PersonalNumber) iterator1.next();
		if (tmp1.getId().equals(id_personalNumber)) {
			personalNumberToRemove = tmp1;
			break;
		}
	}

	if (personalNumberToRemove != null) {
%>

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
					<form class="form-horizontal"
						action="PersonalNumberAssignment.jsp?id_personalNumber=<%=id_personalNumber%>"
						method="post">
						<fieldset>
							<legend class="text-center">Przypisanie indeksu do
								studenta</legend>
							<div class="form-group">
								<label class="col-md-3 control-label" for="firstname">Numer
									indeksu:</label>
								<div class="col-md-9">
									<p class="form-control-static"><%=personalNumberToRemove.getPersonalNumber()%></p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="lastname">Has³o:</label>
								<div class="col-md-9">
									<p class="form-control-static"><%=personalNumberToRemove.getPassword()%></p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="address">Wybierz
									studenta</label>
								<div class="col-md-9">
									<select class="form-control" name="selValue" id="selValue">
										<%
											StudentDaoInterface studentDaoInterface;
												studentDaoInterface = new HibernateStudentDaoImpl();
												List students1 = studentDaoInterface.getAll();

												java.util.Iterator iterator2 = students1.iterator();
												while (iterator2.hasNext()) {

													Student student2 = (Student) iterator2.next();
													String indeks = "brak";
													java.util.Iterator iterator12 = pn.iterator();
													while (iterator12.hasNext()) {
														PersonalNumber tmp1 = (PersonalNumber) iterator12
																.next();
														if (tmp1.getStudent() != null) {
															if (tmp1.getStudent().getId()
																	.equals(student2.getId())) {
																indeks = tmp1.getPersonalNumber().toString();
																break;
															}
														}
													}
													if (indeks == "brak") {
										%>

										<option value="<%=student2.getId()%>"><%=student2.getFirstname() + ", "
								+ student2.getLastname() + ", "
								+ student2.getAddress()%></option>
										<%
											}
												}
										%>

									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12 text-center">
									<button type="submit" class="btn btn-primary btn-lg">Zapisz</button>
								</div>
							</div>
						</fieldset>
						<%
							long id_student = nullIntconv(request.getParameter("selValue"));
								List students2 = studentDaoInterface.getAll();
								Student student = null;
								java.util.Iterator iterator = students2.iterator();
								while (iterator.hasNext()) {
									Student tmp = (Student) iterator.next();
									if (tmp.getId().equals(id_student)) {
										student = tmp;
										break;
									}
								}

								if (student != null) {

									personalNumberToRemove.setStudent(student);
									personalNumberDaoInterface.update(personalNumberToRemove);

								}
						%>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%
		} else {
	%>
	<h3>
		<span class="label label-default">Wyst±pi³ b³±d</span>
	</h3>
	</br>
	<%
		}
	%>

</body>
</html>