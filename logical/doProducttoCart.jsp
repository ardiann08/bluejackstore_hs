<%@include file="../helper/connect.jsp"%>

<%
	String query="select * from products where id = "+request.getParameter("id");
	ResultSet product = st.executeQuery(query);
	String query2="";
	String query3="";
	if(product.next()){
		Integer stock = Integer.parseInt(product.getString("stock")) - Integer.parseInt(request.getParameter("qty"));
		query2="update products set stock = "+stock+" where id = "+product.getString("id");
		stmt.executeUpdate(query2);
		
		Integer subtotal=Integer.parseInt(request.getParameter("qty")) * Integer.parseInt(product.getString("harga"));
		query2="select * from carts where idproduct = "+product.getString("id");
		ResultSet cart = stmt.executeQuery(query2);
		if(cart.next()){
			subtotal += Integer.parseInt(cart.getString("subtotal"));
			Integer qty = Integer.parseInt(cart.getString("qty")) + Integer.parseInt(request.getParameter("qty"));
			query3="update carts set qty = "+qty+",subtotal = "+subtotal+" where id = "+cart.getString("id");
		}else{
			query3="insert into carts values(null,"+session.getAttribute("userid")+","+product.getString("id")+","+request.getParameter("qty")+","+subtotal+")";
		}
		stmt.executeUpdate(query3);
		response.sendRedirect("../view/product.jsp");
	}
%>