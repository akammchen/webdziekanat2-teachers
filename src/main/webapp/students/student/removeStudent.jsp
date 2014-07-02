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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 text-center">
				<div class="well well-sm">
					<%
						long id_student = nullIntconv(request.getParameter("id_student"));
						StudentDaoInterface studentDaoInterface;
						studentDaoInterface = new HibernateStudentDaoImpl();
						List students1 = studentDaoInterface.getAll();
						Student student = null;
						java.util.Iterator iterator = students1.iterator();
						while (iterator.hasNext()) {
							Student tmp = (Student) iterator.next();
							if (tmp.getId().equals(id_student)) {
								student = tmp;
								break;
							}
						}

						if (!student.equals(null)) {
							
							PersonalNumber personalNumberToRemove = null;
							PersonalNumberDaoInterface personalNumberDaoInterface;
							personalNumberDaoInterface = new HibernatePersonalNumberDaoImpl();
							List pn = personalNumberDaoInterface.getAll();
							java.util.Iterator iterator1 = pn.iterator();
							while (iterator1.hasNext()) {
								PersonalNumber tmp1 = (PersonalNumber) iterator1.next();
								if(tmp1.getStudent()!=null){
		 								if (tmp1.getStudent().getId().equals(id_student)) {
		 									personalNumberToRemove = tmp1;
		 									break;
		 								}					
		 						}
							}
							if (personalNumberToRemove!=null){
								personalNumberDaoInterface.remove(personalNumberToRemove);
							}
							
							studentDaoInterface.remove(student);
							
					%>
					<h3>
						<span class="label label-default">Wybrany student zosta³
							usuniêty z bazy</span>
					</h3>
					</br>
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

				</div>
			</div>
		</div>
	</div>
</body>
</html>