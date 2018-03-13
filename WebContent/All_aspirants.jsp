<%@page import="Model.user_data"%>
<%@page import="java.util.ArrayList"%>
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
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<%
	if(session.getAttribute("uname")!=null)
	{
%>
<table cellspacing="10">
<%
	
	//int id =Integer.parseInt(request.getParameter("id"));
	String uname = session.getAttribute("uname").toString();
	Dao obj = new Dao();
	ArrayList<user_data> aspirants = new ArrayList<user_data>();
	aspirants=obj.all_aspirants();
	
	if(aspirants.size()<1)
	{
		out.println("No Job Aspirants currently");
	}
	else
	{
%>
	<tr align="center">
		<th>Username
		<th>Password
		<th>Institute
		<th>Email
		<th>Resume
	</tr>
<%
		for(int i=0;i<aspirants.size();i++)
		{
			String path=obj.select_resume(aspirants.get(i).getUname());
%>
 
	<tr align="center">
		<td><%= aspirants.get(i).getUname() %></td>
		<td><%= aspirants.get(i).getPassword() %></td>
		<td><%= aspirants.get(i).getInstitute() %></td>
		<td><%= aspirants.get(i).getEmail() %></td>
		<td><a href="<%=path%>">resume</a></td>
		<td>
			<form action="delete_aspirant" method="post">
				<input type="submit" value="delete">
				<input type="hidden" name="id" value="<%=aspirants.get(i).getUname() %>" >
			</form>
		</td>
	</tr>

<%

		}
	}

%>
</table>
<%
	}
	else
	{
		response.sendRedirect("index.jsp");
	}
%>
</body>
</html>