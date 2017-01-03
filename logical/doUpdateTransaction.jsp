<%@include file="../helper/connect.jsp"%>

<%
	String query="update transactions set status = 'Completed' where id = "+request.getParameter("id");
	st.executeUpdate(query);
	response.sendRedirect("../view/transaction.jsp");
%>