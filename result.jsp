<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Online Quiz </title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<div  class = "topnv">
				
		<a class="topBtn" href="home.jsp"> Home </a> 
		
	<br />
				
	</div> 

	<%
	
	out.print("<br /> <div class=\"rslt\" > <hr /> ");
	out.print("<h2> BUITEMS </h2>");
	String score;
	
	if(request.getSession().getAttribute("qzNm")!=null){
		String qzNm = (String) request.getSession().getAttribute("qzNm");
		out.print("<hr/> ");
		out.print("<h3>");
		out.print(qzNm+" Quiz");
		out.print("</h3>");
		
	}
	
	if(request.getSession().getAttribute("Name")!=null){
		String nm = (String) request.getSession().getAttribute("Name");
		out.print("<h3>");
		out.print(nm);
		out.print("</h3>");
		
	}
	
	if(request.getSession().getAttribute("Score")!=null){
	
		score = (String) request.getSession().getAttribute("Score");

		out.print("Obtained Marks \t"+score+"<br/>");
		
		out.print("Total Marks \t 5");
		
	/*	out.print("<table border=0  >");
		
		out.print(" <tr> ");
		
		out.print(" <td> Obtained Marks </td> ");
		out.print(" <td> "+score+" </td> ");
		
		out.print(" </tr> ");
		
		out.print(" <tr> ");
		
		out.print(" <td> Total Marks </td> ");
		out.print(" <td> 5 </td> ");
		
		out.print(" </tr> ");

		out.print("</table>");
		
	*/
		out.print("<br />");
		out.print("<br />");
		out.print("<br />");
		out.print("<br /> <hr/>");
		
	}
	
/*
	else if(request.getSession().getAttribute("Marks")!=null){
		
		score = (String) request.getSession().getAttribute("Marks");

		out.print("<h1>");
		out.print(" Marks = ");
		out.print(score);
		out.print(" / 10 ");
		out.print("</h2>");
		out.print("<br />");
		
	}
	
*/
	out.print("</div>");
	
	request.getSession().setAttribute("Restart",1);
	
	%>



</body>
</html>