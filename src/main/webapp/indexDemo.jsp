<!-- @author Pawel -->
<%@ page import="main.samples.students.*" %>
<html>

<body>
<h2>dziekanat samples</h2>
<%
int a=2;

PersonalNumberSample personalNumbersample = new PersonalNumberSample();
String values="indeksy: ";
values+=personalNumbersample.printAllPersonalNumbers();
%>

<%= 
"zmienna a="+a
%>
<br>

<button id="1" onClick="reply_click(this.id)">pokaz wszystkie indeksy</button>
<button id="2" onClick="reply_click(this.id)">ukryj wszystkie indeksy</button>
<br>
<div id="001"></div>


<script type="text/javascript">
function reply_click(clicked_id)
{
	if(clicked_id==1){
		//alert("ok");
		document.getElementById("001").innerHTML= '<%=values%>';
	}
	if(clicked_id==2){
		//alert("ok");
		document.getElementById("001").innerHTML= '';
	}
    //alert(clicked_id);
}
</script>

</body>
</html>
