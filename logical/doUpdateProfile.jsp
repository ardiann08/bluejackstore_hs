<%@include file="../helper/connect.jsp"%>

<%
	String oldpassword = request.getParameter("oldpassword");
	String newpassword = request.getParameter("newpassword");
	String conewpassword = request.getParameter("conewpassword");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String photo = request.getParameter("photo");
	String err = "";

	String query = "select password from users where password = '" + oldpassword + "'";
	ResultSet rs = st.executeQuery(query);
	if(!rs.next()){
		err += "Invalid Old password <br>";
	}

	if(!newpassword.equals(conewpassword)){
		err += "new password must same with confirm new password <br>";
	}

	if(!photo.endsWith(".png") && !photo.endsWith(".jpg")){
		err += "invalid images extenstion <br>";	
	}
	
	if(err.equals("")){
		query = "update users set password = '"+newpassword+"', phone='"+ phone +"', address='"+address+"' where id = " + session.getAttribute("id");
		st.executeUpdate(query);
		response.sendRedirect("../view/profile.jsp?error=success to update profile");
	}else{
		response.sendRedirect("../view/profile.jsp?error=" + err);
	}


	out.print(err);



%>