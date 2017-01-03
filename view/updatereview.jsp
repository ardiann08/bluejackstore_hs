<%@include file="header.jsp"%>
<%@include file="../helper/connect.jsp"%>

<%
String query = "select * from products where id = " + request.getParameter("idproduct");
ResultSet rs = st.executeQuery(query);
if(rs.next()){
%>


<div class="container">
	<div class="row col-md-12 ">
		<h2>Comment</h2>
		<div class="col-md-offset-5">
			<img src="../<%= rs.getString("image") %>" width="150" height="150">
		</div>
		<%
			query = "select * from reviews a join users b on a.iduser = b.id where a.id = " + request.getParameter("id");
			ResultSet reviews = stmt.executeQuery(query);				
			if(reviews.next()){
		%>

		<div class="col-md-12" style="margin-bottom : 15%">
			<form action="../logical/doUpdateReview.jsp" method="POST">
				<div class="panel panel-default">
					<div class="panel-body">
						<input type="hidden" name="id" value="<%= request.getParameter("id") %>"/>
						<input type="hidden" name="idproduct" value="<%= rs.getString("id") %>"/>
						<textarea class="col-md-12" rows="5" name="review" style="margin-bottom: 10px"><%= reviews.getString("comment") %></textarea>
						<label>Rate : <input type="number" min="1" max="5" name="rate" value="<%= reviews.getString("rate") %>" /></label>
						<input type="submit" class="btn btn-success pull-right" value="Update review"/>
					</div>
				</div>
			</form>
		</div>
		
		<%}%>
		
		<label class="err">
			<%
				if(request.getParameter("err") != null){
				out.print(request.getParameter("err"));
			}
		%>
	</label>
</div>
<%}%>