<%@include file="header.jsp"%>
<%@include file="../helper/connect.jsp"%>

<%
String query = "select * from products where id = " + request.getParameter("id");
ResultSet rs = st.executeQuery(query);
if(rs.next()){
%>


<div class="container">
	<div class="row col-md-10 col-md-offset-1">
		<h2>Comment</h2>
		<div class="col-md-offset-5">
			<img src="../<%= rs.getString("image") %>" width="150" height="150">
		</div>
		<%
		query = "select * from reviews a join users b on a.iduser = b.id where idproduct = " + request.getParameter("id");
		ResultSet reviews = stmt.executeQuery(query);				
		while(reviews.next()){
		%>
		<div class="box col-md-12" style="margin-top: 50px">				
			<p></p>
			<img src="../<%= reviews.getString("image") %>" width="100" height="100">				
			<label><%= reviews.getString("comment") %></label>
			<p>
				<label><%= reviews.getString("fullname") %></label>	<br>	
				<label>Rating : <%= reviews.getString("rate") %></label>
			</p>
			<%if(session.getAttribute("userid").equals(reviews.getString("iduser"))){%>
			<div class="pull-right">
				<a href="updatereview.jsp?id=<%= reviews.getString("id") %>&idproduct=<%= request.getParameter("id") %>">
					<button class="btn btn-success">Edit</button>
				</a>
				<a href="../logical/doDeleteReview.jsp?id=<%= reviews.getString("id") %>&idproduct=<%= rs.getString("id") %>">
					<button class="btn btn-danger" onclick="return confirm('are you sure ? ') ">Delete</button>
				</a>
			</div>
			<%}%>
		</div>
		<%}%>
		<div class="col-md-12" style="margin-bottom : 15%">
			<form action="../logical/doReview.jsp" method="POST">
				<div class="panel panel-default">
					<div class="panel-body">
						<input type="hidden" name="id" value="<%= request.getParameter("id") %>"/>
						<textarea class="col-md-12" rows="5" name="review" style="margin-bottom: 10px"></textarea>
						<label>Rate : <input type="number" min="1" max="5" name="rate" value="1" /></label>
						<input type="submit" class="btn btn-success pull-right" value="Leave a review"/>
					</div>
				</div>
			</form>
		</div>
		<label class="err">
			<%
				if(request.getParameter("err") != null){
				out.print(request.getParameter("err"));
			}
			%>
		</label>
</div>
<%}%>