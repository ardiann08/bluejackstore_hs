<%@include file="../helper/connect.jsp"%>

<%
	String query="delete from products where id = "+request.getParameter("id");
	st.executeUpdate(query);
	response.sendRedirect("../view/product.jsp");
%>