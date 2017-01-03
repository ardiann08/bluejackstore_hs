<%@include file="../helper/connect.jsp"%>

<%
	
	Integer totaluser =  (Integer)application.getAttribute("totaluser");
	if(totaluser==0){
		totaluser=0;
	}else{
		totaluser--;
	}
	application.setAttribute("totaluser", totaluser);

	session.removeAttribute("userid");
	session.removeAttribute("role");

	response.sendRedirect("../view/index.jsp");
	
%>