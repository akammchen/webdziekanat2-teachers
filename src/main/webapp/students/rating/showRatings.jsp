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

	RatingDaoInterface ratingDaoInterface;
	ratingDaoInterface = new HibernateRatingDaoImpl();

	List ratings1 = ratingDaoInterface.getAll();
	java.util.Iterator iterator = ratings1.iterator();

	iTotalRows = ratings1.size();
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
	
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="well well-sm">
					<form class="form-horizontal"
						
						method="post">
						<fieldset>
							<legend class="text-center">Wybierz studenta</legend>

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
													String imie = "";
													String nazwisko = "";

													if (pers.getStudent() != null) {
														//tylko indeksy przypisane		
														imie = pers.getStudent().getFirstname()
																.toString();
														nazwisko = pers.getStudent().getLastname()
																.toString();								
										%>

										<option value="<%=pers.getStudent().getId().toString()%>"><%=imie%> <%=nazwisko%>, numer indeksu: <%=pers.getPersonalNumber()%></option>										
										<%
										}
												}		
										%>

									</select>
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-md-12 text-center">
									<button type="submit" class="btn btn-primary btn-lg">Poka¿</button>
								</div>
							</div>
						</fieldset>
						<%
						String studentId = request.getParameter("index");
						System.out.println(studentId);//ok
						%>
					</form>
				</div>
			</div>
		</div>
	</div>


<table width="80%" class="footable">
		<thead>
			<tr>
				<th data-class="expand">Kurs</th>
				<th data-class="expand">Ocena</th>
			</tr>
		</thead>
		
		<tbody>
			<%
				
				while (iterator.hasNext()) {
					
					Rating marks = (Rating) iterator.next();
					if(studentId != null && marks.getPk().getStudent().getId().toString().equals(studentId))
					{
		
			%>
			<tr>
				<td><%=marks.getPk().getCourse().getName()%></td>
				<td><%=marks.getRating()%></td>
			</tr>
			<%
				}}
			%>
		</tbody>

	</table>
	


</body>
</html>