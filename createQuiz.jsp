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
	
	<div class="topNv" >
	
	<a href="home.jsp" class="topBtn" > Home </a>
	
	</div> <br />
	
	<%
	
	if(request.getSession().getAttribute("QuizExists")!=null){
		String msg = (String) request.getSession().getAttribute("QuizExists");
		out.print("<div class=\"ErrorMsg\" >"+msg+"</div>");
		request.getSession().setAttribute("QuizExists",null);
	}
	
	out.print("<div class=\"Register\" > ");
	
	out.print("<form method=\"POST\" action=\"CreateQuiz\" > <br /> ");
	
	out.print("<label> Subject </label> <br /> ");
	
	out.print("<input type=\"text\" name=\"Subject\" required /> <br />");
	
	out.print("<label> Quiz Name </label> <br />");
	
	out.print("<input type=\"text\" name=\"QuizName\" required /> <br />  <br />");
	
	out.print("<input type=\"submit\" value=\" Create \" /> <br /> <br />");
	
	out.print("</form> </div> ");
	
	%>
	
	<!-- <jsp:include page="footer.jsp"></jsp:include>   --> 
	

</body>
</html>