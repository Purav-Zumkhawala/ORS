<%@page import="Model.user_data"%>
<%@page import="util.Dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">

function uvw(c)
{	
	if(c.text=="Create Job")
	{
		document.getElementById('a').src="Create_job.jsp"
	}
	if(c.text=="Home")
	{
		document.getElementById('a').src="All_job_company.jsp"
	}
	if(c.text=="My Jobs")
	{
		document.getElementById('a').src="my_jobs.jsp"
	}
	if(c.text=="Logout")
	{
		window.location.href="logout.jsp";
	}
}

</script>
</head>

<style>
body {
	margin: 0;
	padding: 0;
	
}
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
	Dao obj = new Dao();
	user_data u = obj.select_company(uname);
	String institute=u.getInstitute();
	session.setAttribute("institute", institute);
	
%>
<ul>
  <li><a href="#" onclick="uvw(this)">Home</a></li>
  <li><a href="#" onclick="uvw(this)">Create Job</a></li>
  <li><a href="#" onclick="uvw(this)">My Jobs</a></li>
  <li style="float:right"><a class="active" href="#" onclick="uvw(this)">Logout</a></li>
  <li style="float:right;
  			 display: block;
			 color: white;
			 text-align: center;
       		 padding: 14px 16px;
    		 text-decoration: none; ">Welcome <%= uname %> 
  </li>
</ul>


   <iframe src="All_job_company.jsp" align="right" width="100%" height="703px" id="a"></iframe>
<%
	}
	else
	{
		response.sendRedirect("index.jsp");
	}
  %>
  
  <!-- <iframe src="index.html" align="middle" width="59%" height="699" id="b" scrolling="no"></iframe>
  <iframe src="1q.html" align="right" width="20%" height="699" id="c" scrolling="no"></iframe>
 -->

</body>
</html>