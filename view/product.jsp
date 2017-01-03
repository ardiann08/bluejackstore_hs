<%@include file="header.jsp"%>
<%@include file="../helper/connect.jsp"%>
<%
if(session.getAttribute("role")!=null){
%>
<div class="container">
	<h1>Products</h1>
	<%
	String query ="select * from products a , users b where a.postedby = b.id";
	ResultSet product = st.executeQuery(query); 
	while(product.next()){
	%>
	<div class="row col-md-10 col-md-offset-1 box">
		<h2>PR00<%=product.getString("id")%></h2>

		<div class="col-md-3" style="padding-left: 0px;">
			<img src="../<%=product.getString("image")%>" alt="" class="image-control">
		</div>
		<div class="col-md-7">
			<p>
				Name	:	<%=product.getString("nama")%>
			</p>
			<p>
				Price	:	<%=product.getString("harga")%>
			</p>
			<p>
				Stock	:	<%=product.getString("stock")%>
			</p>
			<p>
				Weight	:	<%=product.getString("berat")%>
			</p>
			<p>
				<small>Inserted by	:	<%=product.getString("fullname")%></small>
			</p>
			<p>
				<a href="review.jsp">View Product Review</a>
			</p>
		</div>
		<%
		if(session.getAttribute("role").equals("member")){
		%>
		<div class="col-md-2">
			<form action="../logical/doProducttoCart.jsp" method="post">
				<input type="hidden" name="id" value="<%=product.getString("id")%>">
				<div class="col-md-9">
					<div class="form-group">
						<input type="number" class="form-control" name="qty" value="1" min="1" max="<%=product.getString("stock")%>">
					</div>
				</div>
				
				
				<button class="btn btn-default" style="width: 100%;">Add to Cart <i class="glyphicon glyphicon-shopping-cart"></i></button>
			</form>
		</div>
		<%}%>
		<%
		if(session.getAttribute("role").equals("admin")){
		%>
		<div class="col-md-2">
			<a href="updateproduct.jsp?id=<%=product.getString("id")%>" class="btn btn-default">Update <i class="glyphicon glyphicon-pencil"></i></a>
			<form action="../logical/doDeleteProduct.jsp" method="post">
				<input type="hidden" name="id" value="<%=product.getString("id")%>">
				<button class="btn btn-default">Delete <i class="glyphicon glyphicon-minus-sign"></i></button>
			</form>
		</div>
		<%}%>
		
	</div>
	<%}%>
</div>
<%}%>