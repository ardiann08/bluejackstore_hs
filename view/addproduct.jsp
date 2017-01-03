<%@include file="header.jsp"%>
<%@include file="../helper/connect.jsp"%>
<div class="container">
	<div class="row col-md-10 col-md-offset-1">
		<form class="form-horizontal" action="../logical/doAddProduct.jsp" method="POST">
			<fieldset>
				<h2>Add Product</h2>

				<div class="form-group">
					<label class="col-md-4 control-label">Name</label>  
					<div class="col-md-4">
						<input type="text" name="name" placeholder="Name" class="form-control input-md" required="" >

					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Price</label>  
					<div class="col-md-4">
						<input type="number" name="price" placeholder="Price" class="form-control input-md" required="">
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Weight</label>  
					<div class="col-md-4">
						<input type="number" name="weight" placeholder="Weight" class="form-control input-md" required="">
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Stock</label>  
					<div class="col-md-4">
						<input type="number" name="stock" placeholder="Stock" class="form-control input-md" required="">
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Image</label>  
					<div class="col-md-4">
						<input type="file" name="image" required="">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label"></label>  
					<div class="col-md-4">
						<label class="err">
							<%
							if(request.getParameter("err") != null){
							out.print(request.getParameter("err"));
						}
						%>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label"></label>  
				<div class="col-md-4">
					<button type="submit" class="form-control input-md btn btn-primary">Add</button>
				</div>
			</div>



		</fieldset>
	</form>
</div>
</div>