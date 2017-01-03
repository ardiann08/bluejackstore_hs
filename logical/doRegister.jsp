<%@include file="../helper/connect.jsp"%>

<%
	String fullname = request.getParameter("fullname");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String copassword = request.getParameter("copassword");
	String gender = request.getParameter("gender");
	String birthdate = request.getParameter("birthdate");
	String address = request.getParameter("address");

	String err = "";


	try{
		Long.parseLong(phone);
	}catch(Exception e){
		err = "Phone must be numeric <br />";
	}

	if(!password.equals(copassword)){
		err = "password and confirm password must same <br />";
	}

	if(err.equals("")){
		String query = "insert into users values(null, '"+ fullname +"', '"+ phone +"', '"+ email +"', '"+ password +"', '"+ gender +"','"+ birthdate +"', '"+ address +"','user.png', 'member')";		
		st.executeUpdate(query);
		response.sendRedirect("../view/register.jsp?err=Success to register");
	}else{
		response.sendRedirect("../view/register.jsp?err=" + err);
	}

%>