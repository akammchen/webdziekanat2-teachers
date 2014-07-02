
<%@page import="configuration.Config"%>
<%@ page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-2"
	pageEncoding="ISO-8859-2"%>
<%@ page import="dao.interf.students.*"%>
<%@ page import="dao.impl.students.*"%>
<%@ page import="java.util.*"%>
<%@ page import="model.students.*"%>
<%@ page import="main.samples.itext.*"%>
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
	long id_student = nullIntconv(request.getParameter("id_student"));

	String saveFile = "";
	String contentType = request.getContentType();
	if ((contentType != null)
			&& (contentType.indexOf("multipart/form-data") >= 0)) {
		DataInputStream in = new DataInputStream(
				request.getInputStream());
		int formDataLength = request.getContentLength();
		byte dataBytes[] = new byte[formDataLength];
		int byteRead = 0;
		int totalBytesRead = 0;
		while (totalBytesRead < formDataLength) {
			byteRead = in.read(dataBytes, totalBytesRead,
					formDataLength);
			totalBytesRead += byteRead;
		}
		String file = new String(dataBytes);
		saveFile = file.substring(file.indexOf("filename=\"") + 10);
		saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
		saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,
				saveFile.indexOf("\""));
		int lastIndex = contentType.lastIndexOf("=");
		String boundary = contentType.substring(lastIndex + 1,
				contentType.length());
		int pos;
		pos = file.indexOf("filename=\"");
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		int boundaryLocation = file.indexOf(boundary, pos) - 4;
		int startPos = ((file.substring(0, pos)).getBytes()).length;
		int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
		saveFile = Config.uploadPath + saveFile;
		File ff = new File(saveFile);
		if (!ff.exists()) {
			ff.createNewFile();
		}
		FileOutputStream fileOut = new FileOutputStream(ff);

		fileOut.write(dataBytes, startPos, (endPos - startPos));
		fileOut.flush();
		fileOut.close();
		String extension = "";
		int i = ff.getAbsolutePath().lastIndexOf('.');
		if (i > 0) {
			extension = ff.getAbsolutePath().substring(i + 1);
		}
		if (extension.equals("jpg") || extension.equals("jpeg")
				|| extension.equals("bmp")) {
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
			new Vacation().createVactionPdf(student,
					ff.getAbsolutePath());
		}
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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 text-center">
				<div class="well well-sm">
					<%
						out.println(saveFile);
							File f = new File(Config.pdfExportFileName);
							if (f.exists()) {
					%>
					<h3>
						<span class="label label-default">Twój plik zosta³ poprawnie za³adowany</span>
					</h3>
					<div class="form-group">
						<a href="download.jsp" style="cursor: pointer;"
							class="btn btn-primary">Pobierz podanie</a>
					</div>

					<%
						} else {
					%><div class="col-sm-12">
						<h3>
							<span class="label label-default">Wyst±pi³ b³±d</span>
						</h3>
					</div>
					<%
						}

						}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>