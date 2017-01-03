<%@include file="../helper/connect.jsp"%>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");

	String query = "select * from users where email='" + email + "' and password='" + password + "'";
	ResultSet rs = st.executeQuery(query);

	if(rs.next()){
		Integer totaluser =  (Integer)application.getAttribute("totaluser");
		if(totaluser==null){
			totaluser=1;
		}else{
			totaluser++;
		}
		application.setAttribute("totaluser", totaluser);

		session.setAttribute("userid", rs.getString("id"));
		session.setAttribute("role", rs.getString("role"));

		if(request.getParameter("cookies")!=null){
			Cookie emailcookie = new Cookie("email",email);
			Cookie passwordcookie = new Cookie("password",password);

			emailcookie.setMaxAge(60*60*24);
			passwordcookie.setMaxAge(60*60*24);

			emailcookie.setPath("/");
			passwordcookie.setPath("/");

			response.addCookie(emailcookie);
			response.addCookie(passwordcookie);
		}
		response.sendRedirect("../view/index.jsp");
	}else{
		response.sendRedirect("../view/login.jsp?err=Invalid email or password");
	}
%>