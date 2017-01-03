<%@include file="../helper/connect.jsp"%>

<%
	String query="delete from reviews where id = "+request.getParameter("id");
	st.executeUpdate(query);
	response.sendRedirect("../view/review.jsp?id="+ request.getParameter("idproduct") +"&err=success to delete review");
%>