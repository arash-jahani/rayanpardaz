<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="ie6 ielt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7 ielt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html lang="en"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<title>Paper Stack</title>
<link rel="stylesheet" type="text/css" href="../files/CssStyle/loginStyle.css" />

</head>
<body>
<%
    String username=request.getParameter("Username");
    String password=request.getParameter("Password");
    if((username !=null)&&(password!=null)){
        Cookie usercook=new Cookie("username", username);
        Cookie passcook=new Cookie("password", password);
        response.addCookie(usercook);
        response.addCookie(passcook);
        response.sendRedirect("admin.jsp");
    }else{%>
    <section class="container">
        <article id="content">
            <form method="Post" action="login.jsp">
			<h1>Login Form</h1>
			<div>
				<input type="text" placeholder="Username" name="Username" required="" id="username" />
			</div>
			<div>
				<input type="password" placeholder="Password" required="" name="Password" id="password" />
			</div>
			<div>
				<input type="submit" value="Log in"/>
			</div>
	</form><!-- form -->		
        </article><!-- content -->
    </section><!-- container -->
  <% }%>
</body>
</html>