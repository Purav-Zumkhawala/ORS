<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> 
<html lang="en" class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <title>Login and Registration Form</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="demo.css" />
        <link rel="stylesheet" type="text/css" href="style.css" />
		<link rel="stylesheet" type="text/css" href="animate-custom.css" />
    </head>
    <body>
     <%
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
	%>
	<%
	if(session.getAttribute("uname")==null)
	{
 	%>
        <div class="container">
            <!-- Codrops top bar -->
            <header>
                <h1 style="color:ivory">Login and Registration Form </h1>
				<!--
				<nav class="codrops-demos">
					
						<span>Click <strong>"Join us"</strong> to see the form switch</span> 
					
					<a href="index3.html" class="current-demo">Demo 3</a>
				
				</nav>
				-->
            </header>
            <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                      
                        <div id="register" class="animate form">
                            <form  action="register" method="post" autocomplete="on"> 
                                <h1> Sign up </h1> 
                                
                                <p> 
                                    	<label for="usertypesignup" class="utype" data-icon="u">User</label>
                                		<select name="usertypesignup">
  											<option value="job_aspirant" selected="selected">Job Aspirant</option>
											<option value="company">Company</option>
										</select>
                                </p>
                                
                                
                                <p> 
                                    <label for="institutenamesignup" class="uname" data-icon="u">Institution / College Name</label>
                                    <input id="institutenamesignup" name="institutenamesignup" required="required" type="text" placeholder="myinstitutestark690" />
                                </p>
                              
                                
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">Your username</label>
                                    <input id="usernamesignup" name="usernamesignup" required="required" type="text" placeholder="mysuperusername690" />
                                </p>
                                
                                
                                <p> 
                                    <label for="emailsignup" class="youmail" data-icon="e" > Your email</label>
                                    <input id="emailsignup" name="emailsignup" required="required" type="email" placeholder="mysupermail@mail.com"/> 
                                </p>
                                <p> 
                                    <label for="passwordsignup" class="youpasswd" data-icon="p">Your password </label>
                                    <input id="passwordsignup" name="passwordsignup" required="required" type="password" placeholder="eg. X8df!90EO"/>
                                </p>
                                <p> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="p">Please confirm your password </label>
                                    <input id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="eg. X8df!90EO"/>
                                </p>
                                <p class="signin button"> 
									<input type="submit" value="Sign up"/> 
								</p>
                                <p class="change_link">  
									Already a member ?
									<a href="#tologin" class="to_register"> Login </a>
								</p>
                            </form>
                        </div>
							
							
						<div id="login" class="animate form">
							<form  action="verify" method="post" autocomplete="on"> 
                                <h1>Log in</h1> 
                                
                                <p> 
                                    	<label for="usertypelogin" class="utype" data-icon="u">User</label>
                                		<select name="usertypelogin">
  											<option value="job_aspirant" selected="selected">Job Aspirant</option>
											<option value="company">Company</option>
											<option value="admin">Admin</option>
										</select>
                                </p>
                                
                                <p> 
                                    <label for="username" class="uname" data-icon="u" > Your username </label>
                                    <input id="username" name="usernamelogin" required="required" type="text" placeholder="myusername"/>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> Your password </label>
                                    <input id="password" name="passwordlogin" required="required" type="password" placeholder="eg. X8df!90EO" /> 
                                </p>
                                <p class="keeplogin"> 
									<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
									<label for="loginkeeping">Keep me logged in</label>
								</p>
                                <p class="login button"> 
                                    <input type="submit" value="Login" /> 
								</p>
                                <p class="change_link">
									Not a member yet ?
									<a href="#toregister" class="to_register">Join us</a>
								</p>
                            </form>
                        </div>
                    </div>
                </div>  
            </section>
        </div>
        
        <%
	}
	else
	{
		String abc=session.getAttribute("abcd").toString();
		if(abc.equals("aspirant"))
			response.sendRedirect("home_job_aspirant.jsp");
		else if(abc.equals("company"))
			response.sendRedirect("home_company.jsp");
		else if(abc.equals("admin"))
			response.sendRedirect("home_admin.jsp");
	}
%>
    </body>
</html>