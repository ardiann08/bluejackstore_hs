<%@include file="header.jsp"%>
<% 
	String emailcookie = "";
	String passwordcookie = "";
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(int i=0;i<cookies.length;i++){			
			if(cookies[i].getName().equals("email")){
				emailcookie = cookies[i].getValue();
			}else if(cookies[i].getName().equals("password")){
				passwordcookie = cookies[i].getValue();
			}
			
		}
	}
%>

<div class="container">
	<div class="row col-md-10 col-md-offset-1">
		<form class="form-horizontal" action="../logical/doLogin.jsp" method="GET">
			<fieldset>
				<h2>Login</h2>

				<div class="form-group">
					<label class="col-md-4 control-label">Email</label>  
					<div class="col-md-4">
						<input type="email" name="email" placeholder="Email" class="form-control input-md" required="" value="<%= emailcookie%>">

					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label">Password</label>  
					<div class="col-md-4">
						<input type="password" name="password" placeholder="password" class="form-control input-md" required="" value="<%= passwordcookie%>">

					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label"></label>  
					<div class="col-md-4">
						<label>
							<input type="checkbox" name="cookies"class="input-md" >
							Remember me
						</label>

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
					<button type="submit" class="form-control input-md btn btn-primary">Login</button>
				</div>
			</div>



		</fieldset>
	</form>
</div>
</div>
