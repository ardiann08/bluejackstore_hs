<%@include file="header.jsp"%>
<%@include file="../helper/connect.jsp"%>
<%
if(session.getAttribute("role")!=null){
%>
<div class="container">
	<div class="col-md-12" style="margin-bottom: 30px;">
		<h1>Products</h1>
		<%
			if(session.getAttribute("role").equals("admin")){
		%>
		<div style="text-align: center;">
			<a href="addproduct.jsp" class="btn btn-default">Add Product</a>
		</div>
		<%}%>
		<div class="pull-left">
			<form action="" class="form-inline">
				<div class="form-group">
					<input type="text" class="form-control" name="query" placeholder="Find Product by Name">		
				</div>
				<div class="form-group">
					<button class="btn btn-default">Search</button>
				</div>
			</form>
		</div>
	</div>
	
	<%
	int limit = 5;
	int offset=0;
	String query ="select * from products a , users b where a.postedby = b.id";
	if(request.getParameter("query")!=null){
		query+=" and a.nama like '%"+request.getParameter("query")+"%'";
	}
	if(request.getParameter("page")!=null){
		offset = (Integer.parseInt(request.getParameter("page"))-1)*limit;
	}
	query+=" limit "+limit+" offset "+offset;
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
				<a href="review.jsp?id=<%=product.getString("id")%>">View Product Review</a>
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
	<div class="col-md-12 text-center">
		<nav aria-label="Page navigation">
			<ul class="pagination">
				<%if(offset!=0){%>
				<li>
					<a href="product.jsp?page=<%=Integer.parseInt(request.getParameter("page"))-1%><%if(request.getParameter("query")!=null)out.print("&query="+request.getParameter("query"));%>" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				<%}%>
				<%
					String query2="select count(id)'count' from products";
					if(request.getParameter("query")!=null){
						query2+=" where nama like '%"+request.getParameter("query")+"%'";
					}
					ResultSet counter = stmt.executeQuery(query2);
					int total = 0;
					boolean last = false;
					int current =0;
					if(counter.next()){
						total=Integer.parseInt(counter.getString("count"));
					}
					if(total%limit!=0){
						total/=limit;
						total+=1;
					}else{
						total/=limit;
					}
					if(request.getParameter("page")!=null){
						if(Integer.parseInt(request.getParameter("page"))==total){
							last=true;
						}
						current=Integer.parseInt(request.getParameter("page"));
					}else{
						if(total==1){
							last=true;
						}
					}
					for(int i=0;i<total;i++){
				%>
				<li><a href="product.jsp?page=<%=i+1%><%if(request.getParameter("query")!=null)out.print("&query="+request.getParameter("query"));%>"><%=i+1%></a></li>
				<%}%>
				<%if(last==false){%>
				<li>
					<a href="product.jsp?page=<%=current+1%><%if(request.getParameter("query")!=null)out.print("&query="+request.getParameter("query"));%>" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
				<%}%>
			</ul>
		</nav>
	</div>
	
	
</div>
<%}%>