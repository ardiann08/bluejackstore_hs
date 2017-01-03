<%@include file="header.jsp"%>
<%@include file="../helper/connect.jsp"%>

<%
String query = "select * from users where id = " + session.getAttribute("userid");
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>


<div class="container">
	<div class="row col-md-10 col-md-offset-1">
		<form class="form-horizontal" >
			<fieldset>
				<h2>Profile</h2>
				<div class="col-md-offset-5" style="margin-bottom: 10px">
					<img src="../user.png" width="130" height="130">
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Fullname</label>  
					<div class="col-md-4">
						<input type="text" class="form-control input-md" value="<%= rs.getString("fullname")%>" disabled>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Phone</label>  
					<div class="col-md-4">
						<input type="text" class="form-control input-md" value="<%= rs.getString("phone")%>" disabled>

					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Email</label>  
					<div class="col-md-4">
						<input type="email" class="form-control input-md" value="<%= rs.getString("email")%>" disabled>

					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Date of Birth</label>  
					<div class="col-md-4">
						<input type="text" class="form-control input-md" value="<%= rs.getString("birthdate")%>" disabled>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Address</label>  
					<div class="col-md-4">
						<textarea class="form-control input-md" rows="5" disabled><%= rs.getString("address")%></textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label"></label>  
					<div class="col-md-4">
						<button type="button" class="form-control input-md btn btn-primary" data-toggle="modal" data-target="#myModal">Update</button>
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
		</fieldset>
	</form>
</div>
</div>

<script>
	$(function(){
		$("#dob").datepicker();
	});
	$('#dob').datepicker({ dateFormat: 'yy/mm/dd' });
</script>



<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Update Profile</h4>
			</div>
			<div class="modal-body">
				
				<form class="form-horizontal" action="../logical/doUpdateProfile.jsp" method="POST">
					<fieldset>
						<div class="form-group">
							<label class="col-md-4 control-label">old Password</label>  
							<div class="col-md-4">
								<input type="password" class="form-control input-md" name="oldpassword" required>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">New Password</label>  
							<div class="col-md-4">
								<input type="password" class="form-control input-md" name="newpassword" required>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">Confirm New Password</label>  
							<div class="col-md-4">
								<input type="password" class="form-control input-md" name="conewpassword" required>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">Phone</label>  
							<div class="col-md-4">
								<input type="text" class="form-control input-md" name="phone" value="<%= rs.getString("phone") %>" required>

							</div>
						</div>					

						<div class="form-group">
							<label class="col-md-4 control-label">Address</label>  
							<div class="col-md-4">
								<textarea class="form-control input-md" rows="5" name="address" required><%= rs.getString("address") %></textarea>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">Photo</label>  
							<div class="col-md-4">
								<input type="file" class="input-md" name="photo" required>
							</div>
						</div>						

						<div class="form-group">
							<label class="col-md-4 control-label"></label>  
							<div class="col-md-4">
								<button type="submit" class="form-control input-md btn btn-primary">Confirm</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<%}%>