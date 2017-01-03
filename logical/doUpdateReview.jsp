<%@include file="../helper/connect.jsp"%>

<%
	String query="update reviews set comment='"+ request.getParameter("review") +"', rate="+ request.getParameter("rate") +" where id = "+request.getParameter("id");
	st.executeUpdate(query);
	response.sendRedirect("../view/review.jsp?id="+ request.getParameter("idproduct") +"&err=success to update review");
%>