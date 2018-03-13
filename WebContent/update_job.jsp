<%@page import="util.Dao"%>
<%@page import="Model.createjob_bean"%>
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

<%
	//String uname=session.getAttribute("uname").toString();
	createjob_bean crj = new createjob_bean();
	int id= Integer.parseInt(request.getParameter("id"));
	Dao obj = new Dao();
	crj=obj.select_update_jobs(id);
%>
<form action="updatejob" method="post">
<table>

	<tr>
		<td>Organization Name</td>
		<td>:</td>
		<td><%= crj.getInstitute() %></td>
	</tr>
	<tr>
		<td>Job Designation</td>
		<td>:</td>
		<td><%= crj.getProfile() %></td>
	</tr>
	
	<tr>
		<td>Working Preference</td>
		<td>:</td>
		<td>
				<input type="radio" name="jobtype"  value="Regular(In-office/On-field)">Regular(In-office/On-field)
		</td>	
		<td>
				<input type="radio" name="jobtype" value="Work from home">Work from home
		</td>
		
	</tr>
	
	<tr>
		<td>Location</td>
		<td>:</td>
		<td><input align="left" required="required" type="text" name="joblocation" placeholder="recommended city" size="50px" value="<%= crj.getLocation()%>"></td>
	</tr>
	
	<tr>
		<td>Part Time Preference</td>
		<td>:</td>
		<td>
				<input type="radio" name="part_time" value="Yes">Yes
		</td>	
		<td>	
				<input type="radio" name="part_time" value="No">No
		</td>
	</tr>
	
	<tr>
		<td>No of Openings</td>
		<td>:</td>
		<td><input align="left" required="required" type="text" name="num_openings" placeholder="type no of people you want to hire" size="50px" value="<%= crj.getOpenings()%>"></td>
	</tr>
	
	<tr>
		<td>Responsibility</td>
		<td>:</td>
		<td><%= crj.getResponsibility() %></td>
	</tr>
	
	<tr>
		<td>Salary</td>
		<td>:</td>
		<td><input required="required" type="text" name="salary" size="50" maxlength="7" placeholder="Ex:50000" value="<%= crj.getSalary()%>"></td>
	</tr>
	<tr>
		<td>
		
					<input type="hidden" name="id" value="<%= crj.getId() %>" >
					<input type="submit" value="update">
		</td>
	</tr>
</table>
</form>
<%
	}
	else
	{
		response.sendRedirect("index.jsp");
	}
%>
</body>
</html>