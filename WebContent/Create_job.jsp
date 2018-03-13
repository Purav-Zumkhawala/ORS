<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Create Job</title>
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
<form action="createjob" method="post">
	<br>
	<b>Select primary profile*</b>
	<table width=25%>
		<tr align="left">
			<td>
				<input required="required" type="radio" name="profile" value="Business Development" >Business Development
			</td>	
			<td>
				<input type="radio" name="profile" value="Web Development">Web Development
			</td>
		</tr>	
	
		<tr align="left">
			<td>
				<input type="radio" name="profile" value="Content Writing">Content Writing
			</td>	
			<td>
				<input type="radio" name="profile" value="Graphic Design">Graphic Design
			</td>
		</tr>
		
		
		<tr align="left">
			<td>
				<input type="radio" name="profile" value="Marketing">Marketing
			</td>	
			<td>
				<input type="radio" name="profile" value="Human Resources(HR)">Human Resources(HR)
			</td>
		</tr>
		
		
		<tr align="left">
			<td>
				<input type="radio" name="profile" value="Law/Legal">Law/Legal
			</td>	
			<td>
				<input type="radio" name="profile" value="Operations">Operations
			</td>
		</tr>
		
		<tr align="left">
			<td>
				<input type="radio" name="profile" value="Manager"> Manager
			</td>	
			<td>
				<input type="radio" name="profile" value="other">other
			</td>
		</tr>
	</table>
	
	<br>
	<b>Type of Job*</b>
	<table width=25%>
		<tr align="left">
			<td>
				<input c type="radio" name="jobtype"  value="Regular(In-office/On-field)">Regular(In-office/On-field)
			</td>	
			<td>
				<input type="radio" name="jobtype" value="Work from home">Work from home
			</td>
		</tr>
	</table>
	
	<br>
	<b>Job Location*</b><br>
		<input align="left" required="required" type="text" name="joblocation" placeholder="recommended city" size="50px">
	
	<br>
	<br>
	<b>Is Part Time Allowed*</b>
	<table width=25%>
		<tr align="left">
			<td>
				<input type="radio" name="part_time" value="Yes">Yes
			</td>	
			<td>	
				<input type="radio" name="part_time" value="No">No
			</td>
		</tr>
	</table>
	
	<br>
	<b>Number Of Job Openings*</b><br>
		<input align="left" required="required" type="text" name="num_openings" placeholder="type no of people you want to hire" size="50px">
	<br>	
 
	<br>
	<b>Responsibility</b><br>
		<textarea rows="4" cols="50" required="required" maxlength="100" name="job_description"></textarea>
		
	<br><br>
	<b>Initial Salary per Annum</b><br>
		<input required="required" type="text" name="salary" size="50" maxlength="7" placeholder="Ex:50000">
	
	<br><br>
		<input type="submit" value="Create Job">

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