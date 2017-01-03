<%@include file="../helper/connect.jsp"%>

<%
	String query="select * from carts where id = "+request.getParameter("id");
	ResultSet cart = st.executeQuery(query);
	if(cart.next()){
		String query2="select * from products where id = "+cart.getString("idproduct");
		ResultSet product = stmt.executeQuery(query2);
		Integer stock=Integer.parseInt(cart.getString("qty"));
		if(product.next()){
			stock+=Integer.parseInt(product.getString("stock"));
		}
		query2="update products set stock = "+stock+" where id = "+cart.getString("idproduct");
		stmt.executeUpdate(query2);
	}
	query="delete from carts where id = "+request.getParameter("id");
	st.executeUpdate(query);
	
	response.sendRedirect("../view/cart.jsp");
%>