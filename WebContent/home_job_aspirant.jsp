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
	if(c.text=="Home")
	{
		document.getElementById('a').src="All_job_aspirant.jsp"
	}
	if(c.text=="My Jobs")
	{
		document.getElementById('a').src="applied.jsp"
	}
	if(c.text=="Logout")
	{
		window.location.href="logout.jsp";
	}
	if(c.text=="Search Jobs")
	{
		document.getElementById('a').src="search.jsp"
	}
	if(c.text=="Upload Resume")
	{
		document.getElementById('a').src="upload.jsp"
	}
	if(c.text=="Profile")
	{
		document.getElementById('a').src="user_profile_create.jsp"
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
    float: left;
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
	user_data u = obj.select_job_aspirant(uname);
	String institute=u.getInstitute();
	session.setAttribute("institute", institute);
	
%>
<ul>
  <li><a href="#" onclick="uvw(this)">Home</a></li>
  <li><a href="#" onclick="uvw(this)">Upload Resume</a></li>
  <li><a href="#" onclick="uvw(this)">Profile</a></li>
  <li><a href="#" onclick="uvw(this)">My Jobs</a></li>
  <li><a href="#" onclick="uvw(this)">Search Jobs</a></li>
  <li style="float:right"><a class="active" href="#" onclick="uvw(this)">Logout</a></li>
  <li style="float:right;
  			 display: block;
			 color: white;
			 text-align: center;
       		 padding: 14px 16px;
    		 text-decoration: none; ">Welcome <%= uname %> 
  </li>
</ul>
	
  <iframe src="All_job_aspirant.jsp" id="a" width="100%" height="703px" align="right"></iframe>
  
  <!-- style="background-image:url(images/bg1.jpg);background-size:cover;" -->
<%
	}
	else
	{
		response.sendRedirect("index.jsp");
	}
%>
</body>
</html>