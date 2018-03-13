<%@page import="Model.applied_job"%>
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
	ArrayList<applied_job> jobs = new ArrayList<applied_job>();
	jobs=obj.select_jobapplied(uname);
	
	if(jobs.size()<1)
	{
		out.println("No jobs currently");
	}
	else
	{
%>
	<tr align="center">
		<th>Date
		<th>Company
		<th>Profile
		<th>Salary
	</tr>
<%
		for(int i=0;i<jobs.size();i++)
		{
%>
 
	<tr align="center">
		<td><%= jobs.get(i).getDate() %></td>
		<td><%= jobs.get(i).getInstitute() %></td>
		<td><%= jobs.get(i).getProfile() %></td>
		<td><%= jobs.get(i).getSalary() %></td>
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