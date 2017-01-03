<%@include file="../helper/connect.jsp"%>

<%
	String query="update products set nama = '"+request.getParameter("nama")+"',harga = "+request.getParameter("harga")+",stock = "+request.getParameter("stock")+",berat = "+request.getParameter("berat")+" where id = "+request.getParameter("id");
	st.executeUpdate(query);
	response.sendRedirect("../view/product.jsp");
%>