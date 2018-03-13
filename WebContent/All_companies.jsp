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
	ArrayList<user_data> companies = new ArrayList<user_data>();
	companies=obj.all_companies();
	
	if(companies.size()<1)
	{
		out.println("No Job Aspirants currently");
	}
	else
	{
%>
	<tr align="center">
		<th>Username
		<th>Password
		<th>Organization
		<th>Email
		
	</tr>
<%
		for(int i=0;i<companies.size();i++)
		{
			
%>
 
	<tr align="center">
		<td><%= companies.get(i).getUname() %></td>
		<td><%= companies.get(i).getPassword() %></td>
		<td><%= companies.get(i).getInstitute() %></td>
		<td><%= companies.get(i).getEmail() %></td>
		
		<td>
			<form action="delete_company" method="post">
				<input type="submit" value="delete">
				<input type="hidden" name="id" value="<%=companies.get(i).getUname() %>" >
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