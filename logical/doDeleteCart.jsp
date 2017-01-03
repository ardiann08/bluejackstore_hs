<%@include file="../helper/connect.jsp"%>

<%
	String query="delete from carts where id = "+request.getParameter("id");
	st.executeUpdate(query);
	response.sendRedirect("../view/cart.jsp");
%>