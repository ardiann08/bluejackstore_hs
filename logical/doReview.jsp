<%@include file="../helper/connect.jsp"%>

<%
	String idproduct = request.getParameter("id");
	String review = request.getParameter("review");
	String rate = request.getParameter("rate");
	String query = "insert into reviews values(null, "+ session.getAttribute("userid") +", "+ idproduct +", '"+ review +"', "+ rate +")";
	st.executeUpdate(query);
	response.sendRedirect("../view/review.jsp?id="+ idproduct +"&err=Success to review this product");
%>