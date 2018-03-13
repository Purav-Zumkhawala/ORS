<%@page import="Model.applicants"%>
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
<%
	int id = Integer.parseInt(request.getParameter("id"));
	Dao obj = new Dao();
	ArrayList<applicants> applicant = new ArrayList<applicants>();
	applicant = obj.view_applicants(id);
	/* String path=obj.select_resume(); */
	if(applicant.size()< 1)
	{
		out.println("No applicants Available");
	}
	else
	{
%>
<table cellspacing="10">
<center>
	<tr align="center">
		<th>Job Id
		<th>Username
		<th>Institute
		<th>Email
		<th>Resume
		<th>Current Status
	</tr>
<%
		for(int i=0;i<applicant.size();i++)
		{
			String path=obj.select_resume(applicant.get(i).getUname());
			String status=obj.select_status(applicant.get(i).getId(), applicant.get(i).getUname());
%>
 
	<tr align="center">
		<td><%= applicant.get(i).getId() %></td>
		<td><%= applicant.get(i).getUname() %></td>
		<td><%= applicant.get(i).getInstitute() %></td>
		<td><%= applicant.get(i).getEmail() %></td>
		<td><a href="<%=path%>">resume</a></td>
		<%-- <td><input type="hidden" name="uname" value="<%= applicant.get(i).getUname() %>"> --%>
		<td><a href="user_profile_for_company.jsp?uname=<%= applicant.get(i).getUname()%>&id=<%= applicant.get(i).getId() %>"><%= status %></a></td>
		
		
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