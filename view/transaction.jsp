<%@include file="header.jsp"%>
<%@include file="../helper/connect.jsp"%>
<%
if(session.getAttribute("role")!=null){
%>
<div class="container">
	<h1>Transactions</h1>
	
	<%
	int limit = 5;
	int offset=0;
	String query ="select * from transactions a , users b where a.iduser = b.id";
	if(session.getAttribute("role").equals("member")){
		query+=" and a.iduser = "+session.getAttribute("userid");
	}
	if(request.getParameter("page")!=null){
		offset = (Integer.parseInt(request.getParameter("page"))-1)*limit;
	}
	query+=" limit "+limit+" offset "+offset;
	ResultSet transactions = st.executeQuery(query); 
	while(transactions.next()){
	%>
	<div class="row col-md-10 col-md-offset-1 box">
		<h2>TR00<%=transactions.getString("a.id")%>
			<%
			if(session.getAttribute("role").equals("admin")&&transactions.getString("status").equals("Waiting for Approval")){
			%>
			<div class="col-md-2 pull-right">
				<form action="../logical/doUpdateTransaction.jsp" method="post">
					<input type="hidden" name="id" value="<%=transactions.getString("id")%>">
					<button class="btn btn-default">Approve <i class="glyphicon glyphicon-ok-sign"></i></button>
				</form>
			</div>
			<%}%>
		</h2>
		<p>Rp.<%=transactions.getString("total")%>,00</p>
		<p><%=transactions.getString("status")%></p>
		<p><%=transactions.getString("datetime")%></p>
		<%if(session.getAttribute("role").equals("admin")){%>
		<p>Transaction By <%=transactions.getString("fullname")%></p>
		<%}%>
		<%
		String query2="select * from detailtransactions a , products b where a.idproduct = b.id";
		ResultSet detail = stmt.executeQuery(query2);
		while(detail.next()){
		%>
		<div class="col-md-12" style="border-top: 1px solid #aeaeae;padding: 15px 0;">	
			<div class="col-md-3" style="padding-left: 0px;">
				<img src="../<%=detail.getString("image")%>" alt="" class="image-control">
			</div>
			<div class="col-md-9">
				<p>
					Name	:	<%=detail.getString("nama")%>
				</p>
				<p>
					Quantity	:	<%=detail.getString("qty")%>
				</p>
				<p>
					Subtotal	:	<%=detail.getString("subtotal")%>
				</p>
			</div>
		</div>
		
		<%}%>
	</div>
	<%}%>
	<div class="col-md-12 text-center">
		<nav aria-label="Page navigation">
			<ul class="pagination">
				<%if(offset!=0){%>
				<li>
					<a href="transaction.jsp?page=<%=Integer.parseInt(request.getParameter("page"))-1%>" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				<%}%>
				<%
					String query2="select count(id)'count' from transactions";
					if(session.getAttribute("role").equals("member")){
						query2+=" and a.iduser = "+session.getAttribute("userid");
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
				<li><a href="transaction.jsp?page=<%=i+1%>"><%=i+1%></a></li>
				<%}%>
				<%if(last==false){%>
				<li>
					<a href="transaction.jsp?page=<%=current+1%>" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
				<%}%>
			</ul>
		</nav>
	</div>
</div>
<%}%>