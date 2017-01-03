<%@include file="header.jsp"%>
<%@include file="../helper/connect.jsp"%>
<%
if(session.getAttribute("role")!=null){
%>
<div class="container">
	<h1>Member</h1>
	<%
		String query ="select * from users";
		ResultSet member = st.executeQuery(query); 
		while(member.next()){
	%>
	<div class="row col-md-10 col-md-offset-1 box">		
		<div class="col-md-3" style="padding-left: 0px;">
			<img src="../<%=member.getString("image")%>" alt="" class="image-control">
		</div>
		<div class="col-md-7">
			<p></p>
			<p>
				Name	:	<%=member.getString("fullname")%>
			</p>
			<p>
				Phone Number	:	<%=member.getString("phone")%>
			</p>
			<p>
				Email	:	<%=member.getString("email")%>
			</p>
			<p>
				Address	:	<%=member.getString("address")%>
			</p>
		</div>
	</div>
	<%}%>
</div>
<%}%>