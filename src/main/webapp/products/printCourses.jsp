<!-- @author Pawel -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<%
	int iShowRows = 10;
	int iTotalSearchRecords = 5;

	int iTotalRows = nullIntconv(request.getParameter("iTotalRows"));
	int iTotalPages = nullIntconv(request.getParameter("iTotalPages"));
	int iPageNo = nullIntconv(request.getParameter("iPageNo"));
	int cPageNo = nullIntconv(request.getParameter("cPageNo"));

	int iStartResultNo = 0;
	int iEndResultNo = 0;

	if (iPageNo == 0) {
		iPageNo = 0;
	} else {
		iPageNo = Math.abs((iPageNo - 1) * iShowRows);
	}

	CourseDaoInterface courseDaoInterface;
	courseDaoInterface = new HibernateCourseDaoImpl();

	List courses = courseDaoInterface.getPage(iPageNo, iShowRows);
	List courses1 = courseDaoInterface.getAll();

	java.util.Iterator iterator = courses.iterator();

	iTotalRows = courses1.size();
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
<script src="http://mymaplist.com/js/vendor/TweenLite.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('table').footable();
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<input type="hidden" name="iPageNo" value="<%=iPageNo%>">
	<input type="hidden" name="cPageNo" value="<%=cPageNo%>">
	<input type="hidden" name="iShowRows" value="<%=iShowRows%>">

	<br />
	<table width="100%" class="footable">
		<thead>
			<tr>
				<th data-class="expand">ID</th>
				<th data-hide="phone">Nazwa</th>
				<th data-hide="phone">Opis</th>
				<th data-hide="phone,tablet">ECTS</th>
				<th>X</th>
			</tr>
		</thead>
		<tbody>
			<%
				while (iterator.hasNext()) {

					Course course = (Course) iterator.next();
					
			%>
			<tr>
				<td><%=course.getId()%></td>
				<td><%=course.getName()%></td>
				<td><%=course.getDescription()%></td>
				<td><%=course.getEcts()%></td>
				<td style="width: 100px;"><a
					href="removeCourse.jsp?id_course=<%=course.getId()%>"
					style="cursor: pointer;" class="btn btn-danger">Usuń</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
		<%
			try {
				if (iTotalRows < (iPageNo + iShowRows)) {
					iEndResultNo = iTotalRows;
				} else {
					iEndResultNo = (iPageNo + iShowRows);
				}

				iStartResultNo = (iPageNo + 1);
				iTotalPages = ((int) (Math
						.ceil((double) iTotalRows / iShowRows)));

			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>

	<ul class="pager">
		<%
			int i = 0;
			int cPage = 0;
			if (iTotalRows != 0) {
				cPage = ((int) (Math.ceil((double) iEndResultNo
						/ (iTotalSearchRecords * iShowRows))));

				int prePageNo = (cPage * iTotalSearchRecords)
						- ((iTotalSearchRecords - 1) + iTotalSearchRecords);
				if ((cPage * iTotalSearchRecords) - (iTotalSearchRecords) > 0) {
		%>
		<li><a
			href="printCourses.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>">
				<< Previous</a></li>
		<%
			}

				for (i = ((cPage * iTotalSearchRecords) - (iTotalSearchRecords - 1)); i <= (cPage * iTotalSearchRecords); i++) {
					if (i == ((iPageNo / iShowRows) + 1)) {
		%>
		<li><a href="printCourses.jsp?iPageNo=<%=i%>"
			style="cursor: pointer; color: blue"><b><%=i%></b></a></li>
		<%
			} else if (i <= iTotalPages) {
		%>
		<li><a href="printCourses.jsp?iPageNo=<%=i%>"><%=i%></a></li>
		<%
			}
				}
				if (iTotalPages > iTotalSearchRecords && i < iTotalPages) {
		%>
		<li><a href="printCourses.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>">
				>> Next</a></li>
		<%
			}
			}
		%>
		<b>Rekordy <%=iStartResultNo%> - <%=iEndResultNo%> Wszystkich rekordów <%=iTotalRows%>
		</b>

	</ul>
</body>
</html>
