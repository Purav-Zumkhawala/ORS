<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">

function uvw(c)
{	
	if(c.text=="Jobs")
	{
		document.getElementById('a').src="All_job_admin.jsp"
	}
	if(c.text=="Job Aspirants")
	{
		document.getElementById('a').src="All_aspirants.jsp"
	}
	if(c.text=="Companies")
	{
		document.getElementById('a').src="All_companies.jsp"
	}
	if(c.text=="Logout")
	{
		window.location.href="logout.jsp";
	}
	
}

</script>

</head>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover:not(.active) {
    background-color: #111;
}

.active {
    background-color: #4CAF50;
}

li {
    border-right: 1px solid #bbb;
}

li:last-child {
    border-right: none;
}
body {
	margin: 0;
	padding: 0;
	
}

</style>

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
	String uname=session.getAttribute("uname").toString();
%>
<ul>
  <li><a href="#" onclick="uvw(this)">Jobs</a></li>
  <li><a href="#" onclick="uvw(this)">Job Aspirants</a></li>
  <li><a href="#" onclick="uvw(this)">Companies</a></li>
  <li style="float:right"><a class="active" href="#" onclick="uvw(this)">Logout</a></li>
  <li style="float:right;
  			 display: block;
			 color: white;
			 text-align: center;
       		 padding: 14px 16px;
    		 text-decoration: none; ">Welcome &nbsp;<%= uname %>
  </li>
</ul>


   <iframe src="All_job_admin.jsp" align="right" width="100%" height="703px" id="a"></iframe>
  <%
	}
	else
	{
		response.sendRedirect("index.jsp");
	}
%>
</body>
</html>