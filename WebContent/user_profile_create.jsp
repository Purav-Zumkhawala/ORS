<%@page import="Model.user_profile"%>
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
		Dao obj = new Dao();
		int i=obj.profile_present(session.getAttribute("uname").toString());
		if(i==0)
		{
%>

<form action="profile" method="post">

		<b>First Name:</b>
	<br>	
		<input type="text" name="fname" placeholder="Ex. Rahul" required="required" size="40px">
		<br><br>
	
	
	<b>Last Name:</b>
	<br>	
		<input type="text" name="lname" placeholder="Ex. Patel" required="required" size="40px">
	<br><br>
	
		<b>City:</b>
		
	
	<br>	
		<input type="text" name="city" placeholder="Ex. Rajkot" required="required" size="40px">
	<br><br>
	
		<b>State:</b>
		
	
	<br>	
		<input type="text" name="state" placeholder="Ex. Goa" required="required" size="40px">
	<br>
	<br>
	<b>Address</b><br>
		<textarea rows="4" cols="31" required="required" maxlength="100" name="address"></textarea>
		<br>
		<br>
	
		<b>Sex:</b>
		
	<br>
		 <input type="radio" name="sex" value="male" required="required" >Male
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	 
			 <input type="radio" name="sex" value="female">Female
		
	<br>
	<br>
	<br>
		<b>Mobile No. :</b>

	<br>
		<input type="text" name="mobileno" placeholder="Ex. 9845123546" required="required" size="40px">
		<br>
		<br>
		<input type="submit" value="Submit" name="submit">
	
</form>

	<%
		}
		else
		{
			user_profile profile=obj.select_profile(session.getAttribute("uname").toString());
	%>
	
	
			<form action="profile" method="post">

			<b>First Name:</b>
		<br>	
			<input type="text" name="fname" value="<%= profile.getFname()%>" placeholder="Ex. Rahul" required="required" size="40px">
			<br><br>
		
		
		<b>Last Name:</b>
		<br>	
				<input type="text" name="lname" value="<%= profile.getLname()%>" placeholder="Ex. Patel" required="required" size="40px">
		<br><br>
		
			<b>City:</b>
			
		
		<br>	
			<input type="text" name="city"  value="<%= profile.getCity()%>"placeholder="Ex. Rajkot" required="required" size="40px">
		<br><br>
		
			<b>State:</b>
			
		
		<br>	
			<input type="text" name="state" value="<%= profile.getState()%>"placeholder="Ex. Goa" required="required" size="40px">
		<br>
		<br>
		<b>Address</b><br>
			<textarea rows="4" cols="31" required="required" maxlength="100" name="address"><%=profile.getAddress() %></textarea>
			<br>
			<br>
		
			<b>Sex:</b>
			
		<br>
		<%
			if(profile.getSex().equalsIgnoreCase("male"))
			{
		%>
			<input type="radio" name="sex" value="male" required="required" checked>Male
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	 
				 <input type="radio" name="sex" value="female">Female
			<% 			
			}
			else
			{
			%>
			 <input type="radio" name="sex" value="male" required="required" >Male
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	 
			<input type="radio" name="sex" value="female" checked>Female
		<%		
			}
		
		%>
			
		<br>
		<br>
		<br>
			<b>Mobile No. :</b>

		<br>
			<input type="text" name="mobileno" value="<%= profile.getMobileno()%>" placeholder="Ex. 9845123546" required="required" size="40px">
			<br>
			<br>
			<input type="submit" value="Update" name="submit">
		
	</form>
<%
		}
	}
	else
	{
		response.sendRedirect("index.jsp");
	}
%>
</body>
</html>