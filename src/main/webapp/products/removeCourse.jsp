<!-- @author Pawel -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
<%@ page import="dao.interf.products.*"%>
<%@ page import="dao.impl.products.*"%>
<%@ page import="java.util.*"%>
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
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 text-center">
				<div class="well well-sm">
					<%
						long id_course = nullIntconv(request.getParameter("id_course"));
						CourseDaoInterface courseDaoInterface;
						courseDaoInterface = new HibernateCourseDaoImpl();
						List courses1 = courseDaoInterface.getAll();
						Course course = null;
						java.util.Iterator iterator = courses1.iterator();
						while (iterator.hasNext()) {
							Course tmp = (Course) iterator.next();
							if (tmp.getId().equals(id_course)) {
								course = tmp;
								break;
							}
						}

						if (!course.equals(null)) {
						
							courseDaoInterface.remove(course);
							
					%>
					<h3>
						<span class="label label-default">Wybrany kurs zosta�
							usuni�ty z bazy</span>
					</h3>
					</br>
					<%
						} else {
					%>
					<h3>
						<span class="label label-default">Wyst�pi� b��d</span>
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
