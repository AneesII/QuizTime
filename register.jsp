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
	
	out.print("<div class=\"Register\" >");
	
	out.print("<form method=\"post\" action=\"Register\" >");
	
	out.print("<label> Name </label> <br />");
	
	out.print("<input type=\"text\" name=\"Name\" required maxlength=60 /> <br /> <br />");
	
	out.print("<label> Email </label> <br />");
	
	out.print("<input type=\"email\" name=\"Email\" required maxlength=60 /> <br /> <br />");
	
	out.print("<label> Username </label> <br />");
	
	out.print("<input type=\"text\" name=\"Id\" required maxlength=60 /> <br /> <br />");
	
	out.print("<label> Password </label> <br />");
	
	out.print("<input type=\"password\" name=\"pswd\" required maxlength=60 /> <br /> <br />");
	
	out.print("<input type=\"radio\" name=\"Type\" required value=\"Teacher\" /> ");
	
	out.print("<label> Teacher </label>");
	
	out.print("<input type=\"radio\" name=\"Type\" required value=\"Student\" />");
	
	out.print("<label> Student </label> <br /> <br />");
	
	out.print("<input type=\"submit\" value=\" Register \" /> <br /> <br /> ");
	
	out.print("</form> </div>");
	
	%>

</body>
</html>