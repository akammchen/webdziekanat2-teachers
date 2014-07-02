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
<script data-pace-options='{ "ajax": false }' src='/webdzieknat2/pace/pace.js'></script>  

 <link href="/webdzieknat2/pace/themes/pace-theme-corner-indicator.css" rel="stylesheet" />
 <link href="/webdzieknat2/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
 <link href="/webdzieknat2/bootstrap/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
 <link href="/webdzieknat2/pace/themes/pace-theme-corner-indicator.css" rel="stylesheet" type="text/css" />
 <link href="/webdzieknat2/FooTable/css/footable-0.1.css" rel="stylesheet" type="text/css"/>

<script src="/webdzieknat2/FooTable/js/jquery-1.11.1.js" type="text/javascript"></script> 
<script src="/webdzieknat2/bootstrap/js/bootstrap.js" type="text/javascript"></script>
<script src="/webdzieknat2/FooTable/js/footable-0.1.js" type="text/javascript"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="well well-sm">
					<form class="form-horizontal" action="addStudent.jsp" method="post">
						<fieldset>
							<legend class="text-center">Dodawanie studenta do bazy</legend>
							<div class="form-group">
								<label class="col-md-3 control-label" for="firstname">Imiê</label>
								<div class="col-md-9">
									<input id="firstname" name="firstname" type="text"
										placeholder="Wpisz imiê" class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="lastname">Nazwisko</label>
								<div class="col-md-9">
									<input id="lastname" name="lastname" type="text"
										placeholder="Wpisz nazwisko" class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="address">Adres</label>
								<div class="col-md-9">
									<textarea class="form-control" id="address" name="address"
										placeholder="Wpisz tutaj pe³ny adres..." rows="5"></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12 text-center">
									<button type="submit" class="btn btn-primary btn-lg">Dodaj</button>
								</div>
							</div>
						</fieldset>
						<%
			String lastname = request.getParameter("lastname");
			String firstname = request.getParameter("firstname");
			String address = request.getParameter("address");
			
			if(lastname!=null && firstname!=null && address!=null){

				if(lastname!="" && firstname!="" && address!="") {
			Student st = new Student();
			st.setFirstname(firstname);
			st.setLastname(lastname);
			st.setAddress(address);
			
			StudentDaoInterface studentDaoInterface;
			studentDaoInterface = new HibernateStudentDaoImpl();
			studentDaoInterface.add(st);
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