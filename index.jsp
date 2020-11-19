<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Quiz </title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

	<marquee><img style="margin-left:10%" src="pics/B3.jpg" width=40% height=100px alt="Image" /></marquee>
	
	<br /> <br />
	
	<%
	
	if(request.getSession().getAttribute("ErrorMsg")!=null){
		String msg = (String) request.getSession().getAttribute("ErrorMsg");
		out.print("<div class=\"ErrorMsg\" >"+msg+"</div>");
	}
	
	request.getSession().setAttribute("ErrorMsg",null);
	
	out.print("<div class=\"Login\" > <br /> ");
	
	out.print("<form method=\"post\" action=\"Login\" >");
	
	out.print("<label> Username </label> <br />");
	
	out.print("<input type=\"text\" name=\"Name\" maxlength=60 required /> <br />");
	
	out.print("<label> Password </label> <br />");
	
	out.print("<input type=\"password\" name=\"pswd\" maxlength=60 required /> <br /> <br />");
	
	out.print("<input type=\"submit\" value=\" login \" /> <br /> <br />");
	
	out.print("</form> </div>");
	
	%>
	
	<div class="Login" >
	
	<br /> <br />
	If you don't have an account then first create an account
	
	<a href="register.jsp" > click here </a> .
	
	</div>
	
	
	
	
	

</body>
</html>