<%@include file="../helper/connect.jsp"%>

<%
	String name = request.getParameter("name");
	String price = request.getParameter("price");
	String weight = request.getParameter("weight");
	String stock = request.getParameter("stock");
	String image = request.getParameter("image");
	String err = "";


	
	if(image.endsWith(".jpg")==false&&image.endsWith(".png")==false){
		err = "image must .jpg or .png <br />";
	}

	if(err.equals("")){
		String query = "insert into products values(null, '"+ name +"', "+ price +", "+ weight +", "+ stock +",'"+ image +"',"+session.getAttribute("userid")+")";		
		st.executeUpdate(query);
		response.sendRedirect("../view/product.jsp");
	}else{
		response.sendRedirect("../view/addproduct.jsp?err=" + err);
	}

%>