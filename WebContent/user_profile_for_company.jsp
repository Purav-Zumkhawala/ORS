<%@page import="Model.user_profile"%>
<%@page import="util.Dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		
		Dao obj1 = new Dao();
		user_profile profile = new user_profile();
		profile=obj1.select_profile(request.getParameter("uname"));
		if(profile==null)
		{
			out.println("profile not present currently");
		}
		else
		{
%>
<table width="100%">
<tr>
<td>
<center>
	<h3> Profile </h3>
	<table>
		<tr>
			<td>First Name</td>
			<td>:</td>
			<td><%=profile.getFname() %></td>
		</tr>
		
		<tr>
			<td>&nbsp;
		<tr>
		
		
		<tr>
			<td>Last Name</td>
			<td>:</td>
			<td><%=profile.getLname()%></td>
		</tr>
		
		
		<tr>
			<td>&nbsp;
		<tr>
		
		
		<tr>
			<td>City</td>
			<td>:</td>
			<td><%=profile.getCity() %></td>
		</tr>
		
		<tr>
			<td>&nbsp;
		<tr>
		
		
		<tr>
			<td>State</td>
			<td>:</td>
			<td><%=profile.getState() %></td>
		</tr>
		
		<tr>
			<td>&nbsp;
		<tr>
		
		
		<tr>
			<td>Gender</td>
			<td>:</td>
			<td><%=profile.getSex() %></td>
		</tr>
		
		<tr>
			<td>&nbsp;
		<tr>
		
		
		<tr>
			<td>Address</td>
			<td>:</td>
			<td><%=profile.getAddress() %></td>
		</tr>
		
		<tr>
			<td>&nbsp;
		<tr>
		
		
		<tr>
			<td>Mobile No.</td>
			<td>:</td>
			<td><%=profile.getMobileno() %></td>
		</tr>

	</table>
 </center>
 </td>


<td>
<%@ include file="status.jsp" %>
</td>
</tr>
</table>
<%
	}
		%>
</body>
</html>