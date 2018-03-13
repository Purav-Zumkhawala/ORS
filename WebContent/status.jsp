<%@page import="Model.status"%>
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

	Dao obj = new Dao();
	status s = new status();
	s=obj.return_status(Integer.parseInt(request.getParameter("id")), request.getParameter("uname"));
	
%>
<form action="status" method="post">

	<h3> Status </h3>
	<table>
	
	
		<tr> 
			<td colspan="2"><b>Telephone</b></td>
		</tr>
		<%
			if(s.getTel().equalsIgnoreCase("call pending"))
			{
		%>
				<tr>
					<td>Success<input type="radio" name="tel" value="success">
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rejected<input type="radio" name="tel" value="rejected">
				</tr>
		<%
			}
			else if(s.getTel().equalsIgnoreCase("rejected"))
			{
		%>
		
				<tr>
					<td>Success<input type="radio" name="tel" value="success">
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rejected<input type="radio" name="tel" value="rejected" checked>
				</tr>
		<%
			}
			else if(s.getTel().equalsIgnoreCase("success"))
			{		
		%>
		
				<tr>
					<td>Success<input type="radio" name="tel" value="success" checked>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rejected<input type="radio" name="tel" value="rejected" >
				</tr>
		
		<%
			}
		%>
		<tr>
			<td>&nbsp;
		</tr>
		<tr>
			<td>&nbsp;
		</tr>
				
	<!--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->
		
		<tr> 
			<td colspan="2"><b>Personal Interview</b></td>
		</tr>
		<%
			if(s.getTel().equalsIgnoreCase("success") && s.getPi().equalsIgnoreCase("----"))
			{		
		%>
				<tr>
					<td>Success<input type="radio" name="pi" value="success">
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rejected<input type="radio" name="pi" value="rejected" >
				</tr>
		
		<%
			}
			else if(s.getPi().equalsIgnoreCase("success") && s.getTel().equalsIgnoreCase("success"))
			{
		
		%>
		
				<tr>
					<td>Success<input type="radio" name="pi" value="success" checked>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rejected<input type="radio" name="pi" value="rejected" >
				</tr>
		<%
			}
			else if(s.getPi().equalsIgnoreCase("rejected"))
			{
		%>
				<tr>
					<td>Success<input type="radio" name="pi" value="success" >
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rejected<input type="radio" name="pi" value="rejected" checked>
				</tr>
		<%
			}		
			else
			{
		%>
				<tr>
					<td>Success<input type="radio" name="pi" value="success" disabled="disabled">
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rejected<input type="radio" name="pi" value="rejected" disabled="disabled">
				</tr>
		<%
			}
				
		%>
		<tr>
			<td>&nbsp;
		<tr>
				<tr>
			<td>&nbsp;
		<tr>
		
		
	<!--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->
	
		<tr> 
			<td colspan="2"><b>HR Interview</b></td>
		</tr><%
		if(s.getPi().equalsIgnoreCase("success") && s.getHr().equalsIgnoreCase("----"))
		{		
		%>
		
			<tr>
				<td>Success<input type="radio" name="hr" value="success" >
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rejected<input type="radio" name="hr" value="rejected" >
			</tr>
		<%
		}
		else if(s.getHr().equalsIgnoreCase("success") && s.getPi().equalsIgnoreCase("success"))
		{
			
		%>
			<tr>
				<td>Success<input type="radio" name="hr" value="success"  checked>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rejected<input type="radio" name="hr" value="rejected" >
			</tr>
		<%
		}
		else if(s.getHr().equalsIgnoreCase("rejected"))
		{
		%>
			<tr>
				<td>Success<input type="radio" name="hr" value="success" >
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rejected<input type="radio" name="hr" value="rejected" checked>
			</tr>
		<%
		}	
		else
		{
		%>	<tr>
				<td>Success<input type="radio" name="hr" value="success" disabled="disabled">
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rejected<input type="radio" name="hr" value="rejected" disabled="disabled">
			</tr>
		<%
		}
		%>
	</table>
	<br>
	<br>
	<input type="hidden" name="uname" value="<%=request.getParameter("uname")%>">
	<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
	<input type="submit" value="Submit">
	
	</form>
</body>
</html>