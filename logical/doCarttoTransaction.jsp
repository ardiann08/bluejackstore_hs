<%@include file="../helper/connect.jsp"%>

<%
	Integer total=0;
	String transactionid="";
	String query="insert into transactions values(null,"+session.getAttribute("userid")+",null,default,default)";
	st.executeUpdate(query);
	query = "select * from carts where iduser = "+session.getAttribute("userid");
	ResultSet cart = st.executeQuery(query);
	String query2="";
	while(cart.next()){
		query2="select * from transactions where iduser = "+session.getAttribute("userid")+" and total is NULL";
		ResultSet transaction = stmt.executeQuery(query2);
		if(transaction.next()){
			transactionid = transaction.getString("id");
		}
		query2="insert into detailtransactions values(null,"+transactionid+","+cart.getString("idproduct")+","+cart.getString("qty")+","+cart.getString("subtotal")+")";
		stmt.executeUpdate(query2);
		total += Integer.parseInt(cart.getString("subtotal"));
	}
	query2="update transactions set total = "+total+" where id = "+transactionid;
	stmt.executeUpdate(query2);
	query2="delete from carts where iduser = "+session.getAttribute("userid");
	stmt.executeUpdate(query2);
	response.sendRedirect("../view/transaction.jsp");
%>