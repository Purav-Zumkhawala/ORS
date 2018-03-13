<%@page import="java.io.PrintWriter"%>
<%@page import="util.Dao"%>
<%@page import="Model.createjob_bean"%>
<%@page import="java.util.ArrayList"%>
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
<h3 align="center" > All Jobs</h3>
<%
	PrintWriter out1 = response.getWriter();
	String uname=session.getAttribute("uname").toString();
	ArrayList<createjob_bean> jobs = new ArrayList<createjob_bean>(); 
	Dao obj = new Dao(); 
	jobs=obj.select_job();
	if(jobs.size()<1)
	{
		out1.println("No jobs currently");
	}
	else
	{
		for(int i=0;i<jobs.size();i++)
		{
%>
<table>
	<tr>
		<td>Organization Name</td>
		<td>:</td>
		<td><%= jobs.get(i).getInstitute() %></td>
	</tr>
	
	<tr>
		<td>Job Designation</td>
		<td>:</td>
		<td><%= jobs.get(i).getProfile() %></td>
	</tr>
	
	<tr>
		<td>Working Preference</td>
		<td>:</td>
		<td><%= jobs.get(i).getJobtype() %></td>
	</tr>
	
	<tr>
		<td>Location</td>
		<td>:</td>
		<td><%= jobs.get(i).getLocation() %></td>
	</tr>
	
	<tr>
		<td>Part Time Preference</td>
		<td>:</td>
		<td><%= jobs.get(i).getPart_time() %></td>
	</tr>
	
	<tr>
		<td>No of Openings</td>
		<td>:</td>
		<td><%= jobs.get(i).getOpenings() %></td>
	</tr>
	
	<tr>
		<td>Responsibility</td>
		<td>:</td>
		<td><%= jobs.get(i).getResponsibility() %></td>
	</tr>
	
	<tr>
		<td>Salary</td>
		<td>:</td>
		<td><%= jobs.get(i).getSalary() %></td>
	</tr>
	<tr>
		<td>
			<form action="deletejob" method="post">
				<input type="submit" value="delete">
				<input type="hidden" name="id" value="<%=jobs.get(i).getId() %>" >
			</form>
		</td>
	</tr>
</table>
<hr>	
<%

	}
}
%>
<%
	}
	else
	{
		response.sendRedirect("index.jsp");
	}
%>
</body>
</html>