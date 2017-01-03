<%@include file="header.jsp"%>
<%@include file="../helper/connect.jsp"%>
<%
if(session.getAttribute("role")!=null){
%>
<div class="container">
	<h1>Carts</h1>	
	<%
	Boolean flag=false;
	String query ="select * from products a , carts b where a.id = b.idproduct";
	ResultSet productandcart = st.executeQuery(query); 
	while(productandcart.next()){
	flag=true;
	%>
	<div class="row col-md-10 col-md-offset-1 box">
		<h2>CART00<%=productandcart.getString("b.id")%></h2>

		<div class="col-md-3" style="padding-left: 0px;">
			<img src="../<%=productandcart.getString("image")%>" alt="" class="image-control">
		</div>
		<div class="col-md-7">
			<p>
				Name	:	<%=productandcart.getString("nama")%>
			</p>
			<p>
				Quantity	:	<%=productandcart.getString("qty")%>
			</p>
			<p>
				Subtotal	:	<%=productandcart.getString("subtotal")%>
			</p>
		</div>
		<%
		if(session.getAttribute("role").equals("member")){
		%>
		<div class="col-md-2">
			<form action="../logical/doDeleteCart.jsp" method="post">
				<input type="hidden" name="id" value="<%=productandcart.getString("b.id")%>">
				<button class="btn btn-default">Delete <i class="glyphicon glyphicon-minus-sign"></i></button>
			</form>
		</div>
		<%}%>
		
	</div>
	<%}%>
	<%if(flag==true){%>
	<div class="col-md-12" style="text-align: right;">
		<a href="../logical/doCarttoTransaction.jsp" class="btn btn-primary" style="margin: auto;">Checkout</a>
	</div>
	<%}%>
</div>
<%}%>