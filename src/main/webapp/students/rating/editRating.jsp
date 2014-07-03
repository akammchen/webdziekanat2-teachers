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

<%
						long id_student = nullIntconv(request.getParameter("id"));
							long id_course = nullIntconv(request.getParameter("course"));

RatingDaoInterface ratingDaoInterface;
ratingDaoInterface = new HibernateRatingDaoImpl();

List ratings1 = ratingDaoInterface.getAll();
java.util.Iterator iterator = ratings1.iterator();

Rating mark = null;

while (iterator.hasNext()) {
	
	Rating marks = (Rating) iterator.next();
	if(marks.getPk().getStudent().getId().equals(id_student) && marks.getPk().getCourse().getId().equals(id_course))
	{
		mark = marks;
	}
}			
%>
					
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="well well-sm">
					<form class="form-horizontal" action="editRating.jsp?id=<%=id_student%>&course=<%=id_course%>"
						method="post">
						<fieldset>
							<legend class="text-center">Edycja wystawionej oceny</legend>
							<div class="form-group">
								<label class="col-md-3 control-label" for="index">Przedmiot : dotychczasowa ocena</label>
								<div class="col-md-9">
									<p class="form-control-static"><%=mark.getPk().getCourse().getName().toString()%> : <%=mark.getRating().toString()%></p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="password">Nowa ocena</label>
								<div class="col-md-9">
									<input id="ocena" name="ocena" type="text" placeholder="Wpisz ocenê [2-5]"
										class="form-control">
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12 text-center">
									<button type="submit" class="btn btn-primary btn-lg">Zapisz</button>
								</div>
							</div>
						</fieldset>
						<%
							String new_ocena = request.getParameter("ocena");

							if (new_ocena != null) {

								if (new_ocena != "") {
									
									int mar = Integer.parseInt(new_ocena);

									mark.setRating(mar);

									ratingDaoInterface.remove(mark);
									
									Course cour = new Course();
									cour.setId(id_course);
									Student stud = new Student();
									stud.setId(id_student);

									RatingId rt = new RatingId();
									rt.setStudent(stud);
									rt.setCourse(cour);
									Rating rtt = new Rating();
									rtt.setPk(rt);
									rtt.setRating(mar);
									
									ratingDaoInterface.add(rtt);

									
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