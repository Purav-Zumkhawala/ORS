<%@page import="Model.applicants"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload</title>
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
	/* int id = Integer.parseInt(request.getParameter("id"));
	Dao obj = new Dao();
	ArrayList<applicants> applicant = new ArrayList<applicants>();
	applicant = obj.view_applicants(id); */
	String uname=session.getAttribute("uname").toString();
	Dao obj = new Dao();
	int i=obj.resume_present(uname);
	if(i>0)
	{
%>
		<h3 align="center" style="margin-top: 100px;"> Resume already uploaded</h3>
		<h4 align="center">Would you like to delete the previous one and upload again</h4>
		<center>
			<form action="check_resume" method="post">
			
			<input type="radio" name="choice" value="yes" required="required">&nbsp;&nbsp; Yes
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="choice" value="no" required="required">&nbsp;&nbsp;No
			<br><br><br>
			<input type="submit"  value="Submit">
			</form>
		</center>	
<% 
	}	
	else
	{
%>
    <center>
        <form method="post" action="UploadServlet" enctype="multipart/form-data">
            <table>
            <tr>
            	<td>Select file to upload</td> 
            	<td>
            	<td><input type="file" name="uploadFile" /></td>
            </tr>
            <tr>
            	<td colspan="2">
            			<input type="submit" value="Upload" />	
            	</td>
            </table>
        </form>
    </center>
    <%
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