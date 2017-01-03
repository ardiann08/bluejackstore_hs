<%@include file="header.jsp"%>

<div class="container">
	<div class="row col-md-10 col-md-offset-1">
		<form class="form-horizontal" action="../logical/doRegister.jsp" method="GET">
			<fieldset>
				<h2>Register</h2>
				<div class="form-group">
					<label class="col-md-4 control-label">Fullname</label>  
					<div class="col-md-4">
						<input type="text" name="fullname" placeholder="Fullname" class="form-control input-md" required="">

					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Phone</label>  
					<div class="col-md-4">
						<input type="text" name="phone" placeholder="Phone Number" class="form-control input-md" required="">

					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Email</label>  
					<div class="col-md-4">
						<input type="email" name="email" placeholder="Email" class="form-control input-md" required="">

					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Password</label>  
					<div class="col-md-4">
						<input type="password" name="password" placeholder="password" class="form-control input-md" required="">

					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Confirm Password</label>  
					<div class="col-md-4">
						<input type="password" name="copassword" placeholder="Confirm Password" class="form-control input-md" required="">

					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Gender</label>  
					<div class="col-md-4">
						<label><input type="radio" name="gender" value="male"/>Male</label>
						<label><input type="radio" name="gender" value="female"/>Female</label>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Date of Birth</label>  
					<div class="col-md-4">
						<input type="text" id="dob" name="birthdate" placeholder="Birthdate" class="form-control input-md" required="">
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Address</label>  
					<div class="col-md-4">
						<textarea name="address" placeholder="Address" class="form-control input-md" required="" rows="5"></textarea>
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
					<button type="submit" class="form-control input-md btn btn-primary">Register</button>
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
