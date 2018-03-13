<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">

function abc() 
 { 
    var result = document.querySelector('input[name="searchtype"]:checked').value;
    /* document.write(result); */
    if(result=="on"){

    	document.getElementById("a").removeAttribute('disabled');
    	document.getElementById("b").setAttribute('disabled', true);
    	document.getElementById("c").setAttribute('disabled', true);
    	document.getElementById("location").setAttribute('value','location');
    }
}

function bca() 
{ 
   var result = document.querySelector('input[name="searchtype"]:checked').value;
   /* document.write(result); */
   if(result=="on"){

   	document.getElementById("b").removeAttribute('disabled');
   	document.getElementById("a").setAttribute('disabled', true);
   	document.getElementById("c").setAttribute('disabled', true);
   	document.getElementById("salary").setAttribute('value','salary');
   }
}

function cab() 
{ 
   var result = document.querySelector('input[name="searchtype"]:checked').value;
   /* document.write(result); */
   if(result=="on")
   {

   	document.getElementById("c").removeAttribute('disabled');
   	document.getElementById("a").setAttribute('disabled', true);
   	document.getElementById("b").setAttribute('disabled', true);
   	document.getElementById("profile").setAttribute('value','profile');
   	
   }
}


</script>
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
<!-- <form action="search" method="post"> -->
<form action="search_result.jsp"> 
<table>
			<tr>
				<td><input type="radio" name="searchtype" onclick="abc();" id="location"></td>
				<td>Search By Location</td>
			</tr>
			<tr>
				<td></td>
				<td><input id="a" type="text" name="search_location" placeholder="Search Location" size="30px" disabled="disabled"></td>
			</tr>
			

			<tr>
				<td><input type="radio" name="searchtype" onclick="bca();" id="salary"></td>
				<td>Search By Salary</td>
			</tr>
			<tr>
				<td></td>
				<td><input id="b" type="text" name="search_salary" placeholder="Minimum Salary prefered" size="30px" disabled="disabled"></td>
			</tr>
			
			<tr>
				<td><input type="radio" name="searchtype" onclick="cab();" id="profile"></td>
				<td>Search By Profile</td>
			</tr>
			<tr>
				<td></td>
				<td><input id="c" type="text" name="search_profile" placeholder="Profile" size="30px" disabled="disabled"></td>
			</tr>
			<tr>
				<td>&nbsp;
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="submit" value="submit">
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