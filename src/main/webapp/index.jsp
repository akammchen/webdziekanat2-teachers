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

<!DOCTYPE html>
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
$(document).ready(function(){
	  $(document).mousemove(function(e){
	     TweenLite.to($('body'), 
	        .5, 
	        { css: 
	            {
	                backgroundPosition: ""+ parseInt(event.pageX/8) + "px "+parseInt(event.pageY/'12')+"px, "+parseInt(event.pageX/'15')+"px "+parseInt(event.pageY/'15')+"px, "+parseInt(event.pageX/'30')+"px "+parseInt(event.pageY/'30')+"px"
	            }
	        });
	  });
	}); 
</script>
<style type="text/css">
  body{
    background: url(http://mymaplist.com/img/parallax/back.png);
	background-color: #444;
    background: url(http://mymaplist.com/img/parallax/pinlayer2.png),url(http://mymaplist.com/img/parallax/pinlayer1.png),url(http://mymaplist.com/img/parallax/back.png);    
}

.vertical-offset-100{
    padding-top:100px;
}
  </style>
</head>
<body>
</br>
</br></br></br></br>
	<div class="container">
		<div class="row vertical-offset-100">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Zaloguj siê</h3>
					</div>
					<div class="panel-body">
						<form accept-charset="UTF-8" role="form">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="numer identyfikacyjny" name="index"
										type="text">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="has³o" name="password"
										type="password" value="">
								</div>
								<input class="btn btn-lg btn-success btn-block" type="submit"
									value="ZALOGUJ">
							</fieldset>
							<%

							int indeks = nullIntconv(request.getParameter("index"));
							String haslo = request.getParameter("password");

							if (haslo!=null && indeks!=0) {
									PersonalNumberDaoInterface personalNumberDaoInterface;
									personalNumberDaoInterface = new HibernatePersonalNumberDaoImpl();
									List personalNumbers1 = personalNumberDaoInterface.getAll();
									java.util.Iterator iterator = personalNumbers1.iterator();
									while (iterator.hasNext()) {
										PersonalNumber personalNumber = (PersonalNumber) iterator.next();
										if (personalNumber.getStudent()!=null)
										{
											if (personalNumber.getPersonalNumber().equals(indeks) && personalNumber.getPassword().equals(haslo))
											{
												String site = new String("MainPage.jsp");
				 								response.setStatus(response.SC_MOVED_TEMPORARILY);
				 								response.setHeader("Location", site);
											}
										}
									}
							}
							%>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
