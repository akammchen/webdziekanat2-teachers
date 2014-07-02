<!-- @author Pawel -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
<%@ page import="dao.interf.students.*"%>
<%@ page import="dao.impl.students.*"%>
<%@ page import="dao.interf.products.*"%>
<%@ page import="dao.impl.products.*"%>
<%@ page import="java.util.*"%>
<%@ page import="model.students.*"%>
<%@ page import="model.products.*"%>

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
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="well well-sm">
					<form class="form-horizontal"
						
						method="post">
						<fieldset>
							<legend class="text-center">Wstawianie oceny</legend>

							<div class="form-group">
								<label class="col-md-3 control-label" for="subject">Przedmiot:</label>
								<div class="col-md-9">
									<select class="form-control" name="subject" id="subject">
										<%
											CourseDaoInterface cDaoInterface;
										cDaoInterface = new HibernateCourseDaoImpl();
												List courses1 = cDaoInterface.getAll();

												java.util.Iterator iterator2c = courses1.iterator();
												while (iterator2c.hasNext()) {

													Course cour = (Course) iterator2c.next();
													String przedmiot = "";
													
													
														if (cour.getName() != null) {
																przedmiot = cour.getName().toString();
																//break;
															}
											
										%>

										<option value="<%=cour.getId()%>"><%= cour.getName()%></option>										<%
										}
												
										%>

									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="index">Numer indeksu</label>
								<div class="col-md-9">
									<select class="form-control" name="index" id="index">
										<%
											PersonalNumberDaoInterface pnDaoInterface;
											pnDaoInterface = new HibernatePersonalNumberDaoImpl();
												List indexes1 = pnDaoInterface.getAll();

												java.util.Iterator iterator2 = indexes1.iterator();
												while (iterator2.hasNext()) {

													PersonalNumber pers = (PersonalNumber) iterator2.next();
													String indeks = "";
													
													
														if (pers.getStudent() != null) {
														//tylko indeksy przypisane											
										%>

										<option value="<%=pers.getStudent().getId().toString()%>"><%= pers.getPersonalNumber()%></option>										<%
										}
												}		
										%>

									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-3 control-label" for="rate">Ocena</label>
								<div class="col-md-9">
									<input id="rate" name="rate" type="text"
										placeholder="Wpisz ocenê [2-5]" class="form-control">
								</div>
							</div>
							
							
							
							<div class="form-group">
								<div class="col-md-12 text-center">
									<button type="submit" class="btn btn-primary btn-lg">Wpisz</button>
								</div>
							</div>
						</fieldset>
						<%
						String subject = request.getParameter("subject");
						String student = request.getParameter("index");
						String mark = request.getParameter("rate");
						
						if(subject!=null && student!=null && mark!=null){
							int mark2 = Integer.parseInt(mark);
							int subject2 = Integer.parseInt(subject);
							int student2 = Integer.parseInt(student);
							
							if(mark2>1 && mark2<6){
								System.out.println("sub:"+subject2+" ind:"+student2+" mark:"+mark2);
								
								Course cour = new Course();
								cour.setId((long)subject2);
								Student stud = new Student();
								stud.setId((long)student2);
								
								RatingId rt = new RatingId();
								rt.setStudent(stud);
								rt.setCourse(cour);
								Rating rtt = new Rating();
								rtt.setPk(rt);
								rtt.setRating(mark2);
								
								RatingDaoInterface ratingDaoInterface;
								ratingDaoInterface = new HibernateRatingDaoImpl();
								ratingDaoInterface.add(rtt);
							
							}
							
							else {
								//System.out.println("Niepoprawna ocena!");
								%><h3>
								<span class="label label-default">Niepoprawna ocena!</span>
								</h3>
								<br/><%
							}
							
						}
						
						%>
					</form>
				</div>
			</div>
		</div>
	</div>


</body>
</html>