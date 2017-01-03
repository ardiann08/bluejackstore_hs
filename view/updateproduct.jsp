<%@include file="header.jsp"%>
<%@include file="../helper/connect.jsp"%>
<%
if(session.getAttribute("role")!=null){
%>
<div class="container">
	<h1>Update Product</h1>
	<%
	String query ="select * from products where id = "+request.getParameter("id");
	ResultSet product = st.executeQuery(query); 
	if(product.next()){
	%>
	<div class="row col-md-10 col-md-offset-1 box">
		<form action="../logical/doUpdateProduct.jsp" method="post" class="form-horizontal">
			<input type="hidden" name="id" value="<%=product.getString("id")%>">
			<h2>PR00<%=product.getString("id")%></h2>

			<div class="col-md-3" style="padding-left: 0px;">
				<img src="../<%=product.getString("image")%>" alt="" class="image-control">
			</div>
			<div class="col-md-7">

				<div class="form-group">
					<label class="col-md-2 control-label">Name:</label>	
					<div class="col-md-4">
						<input type="text" name="nama" value="<%=product.getString("nama")%>" class="form-control">
					</div>	
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label">Price:</label>	
					<div class="col-md-4">
						<input type="number" name="harga" value="<%=product.getString("harga")%>" class="form-control">
					</div>	
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label">Stock:</label>	
					<div class="col-md-4">
						<input type="number" name="stock" value="<%=product.getString("stock")%>" class="form-control">
					</div>	
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label">Weight:</label>	
					<div class="col-md-4">
						<input type="number" name="berat" value="<%=product.getString("berat")%>" class="form-control">
					</div>	
				</div>


			</div>

			<div class="col-md-2" style="height: 180px;position: relative;">
			<button class="btn btn-default" type="submit" style="bottom: 0;right:0;position: absolute;">Update</button>
			</div>
		</form>
	</div>
	<%}%>
</div>
<%}%>