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
	int iShowRows = 10;
	int iTotalSearchRecords = 5;

	int x = 0;
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

	StudentDaoInterface studentDaoInterface;
	studentDaoInterface = new HibernateStudentDaoImpl();

	//List students = studentDaoInterface.getPage(iPageNo, iShowRows);
	List students = studentDaoInterface.getAll();
	List students1 = studentDaoInterface.getAll();

	java.util.Iterator iterator = students.iterator();

	iTotalRows = students1.size();
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
<script type="text/javascript">
	$(function() {
		$('table').footable();
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

	<input type="hidden" name="iPageNo" value="<%=iPageNo%>">
	<input type="hidden" name="cPageNo" value="<%=cPageNo%>">
	<input type="hidden" name="iShowRows" value="<%=iShowRows%>">

	<br />
	<table width="100%" class="footable">
		<thead>
			<tr>
				<th data-class="expand">Nazwisko</th>
				<th data-hide="phone">Imiê</th>
				<th data-hide="phone,tablet">Indeks</th>
			</tr>
		</thead>
		<tbody>
			<%
				while (iterator.hasNext()) {

					Student student = (Student) iterator.next();
					
					String indeks = "brak";
					String stud = "0";
					PersonalNumberDaoInterface personalNumberDaoInterface;
					personalNumberDaoInterface = new HibernatePersonalNumberDaoImpl();
					List pn = personalNumberDaoInterface.getAll();
					java.util.Iterator iterator1 = pn.iterator();
					while (iterator1.hasNext()) {
						PersonalNumber tmp1 = (PersonalNumber) iterator1.next();
						if(tmp1.getStudent()!=null){
 								if (tmp1.getStudent().getId().equals(student.getId())) {
 									indeks = tmp1.getPersonalNumber().toString();
 									stud = tmp1.getIs_student().toString();
 									break;
 								}					
 						}
					}
					if (stud.equals("1")){
						x++;
			%>
			<tr>
				<td><%=student.getLastname()%></td>
				<td><%=student.getFirstname()%></td>
				<td><%=indeks%></td>
				
			</tr>
			<%
					}
				}
			iTotalRows = x;
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
			href="printStudents.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>">
				<< Previous</a></li>
		<%
			}

				for (i = ((cPage * iTotalSearchRecords) - (iTotalSearchRecords - 1)); i <= (cPage * iTotalSearchRecords); i++) {
					if (i == ((iPageNo / iShowRows) + 1)) {
		%>
		<li><a href="printStudents.jsp?iPageNo=<%=i%>"
			style="cursor: pointer; color: blue"><b><%=i%></b></a></li>
		<%
			} else if (i <= iTotalPages) {
		%>
		<li><a href="printStudents.jsp?iPageNo=<%=i%>"><%=i%></a></li>
		<%
			}
				}
				if (iTotalPages > iTotalSearchRecords && i < iTotalPages) {
		%>
		<li><a href="printStudents.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>">
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