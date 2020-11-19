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

	
		<%!
		
		static int qNo = 1;
		
		%>
 		
 		
 		<% 
 		
 		if(request.getSession().getAttribute("Restart")!=null){
 			Integer i = (Integer) request.getSession().getAttribute("Restart");
 			if(i==1){
 				qNo =1;
 				request.getSession().setAttribute("Restart",0);
 			}
 		}
 		
 		if(request.getSession().getAttribute("qzNm")!=null){

 		request.getSession().setAttribute("counter",qNo);		
                  		 
			if(qNo>5){
 								
				request.setAttribute("finished","Quiz successfully submitted");
				
				qNo=1;
				
				request.getSession().setAttribute("qzNm", null);
				
				RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
				
				rd.forward(request, response);
			}
 		
 		
			if(request.getSession().getAttribute("qzNm")!=null){
	
			String qzNm = (String)request.getSession().getAttribute("qzNm");
			
			request.getSession().setAttribute("qzNm", qzNm);
			
			}
 				
			out.print("<h2 style=\"color:green\">");
	 		out.print("  Question No. "+qNo);
	 		out.print("</h2>");
 		 		
 		out.print("<div class=\"insertBck\" > <br /> ");
 		 
 		out.print("<form method=\"post\" action=\"InsertQuestion\" > ");
 		
 		out.print("<label> Q) </label>");
 		out.print("<input style=\"width:85%;height:40px\" type=\"text\" name=\"Qstn\" required /> <br /> <br />");
 		
 		out.print("<label> a) </label>");
 		out.print("<input type=\"text\" style=\"width:50%;height:25px\" name=\"Option1\" required /> <br /> <br /> ");
 		
 		out.print("<label> b) </label>");
 		out.print("<input type=\"text\" style=\"width:50%;height:25px\" name=\"Option2\" required /> <br /> <br /> ");
 		
 		out.print("<label> c) </label>");
 		out.print("<input type=\"text\" style=\"width:50%;height:25px\" name=\"Option3\" required /> <br /> <br /> ");
 		
 		out.print("<label> d) </label>");
 		out.print("<input type=\"text\" style=\"width:50%;height:25px\" name=\"Option4\" required /> <br /> <br />");
 		
 		out.print("<label> Ans </label>");
 		out.print("<input type=\"text\" style=\"width:50%;height:25px\" name=\"ans\" required /> <br /> <br />");
 		
 		if(qNo<5){
 			out.print("<input type=\"submit\" value=\" Next \"  /> <br /> <br />");
 		} 
 		else {
 			out.print("<input type=\"submit\" value=\" Finish \"  /> <br /> <br />");
 		}
 		
 		out.print("</form> </div> ");
   		
 		qNo++;
 		
 		}
 		else {
 			response.sendRedirect("home.jsp");
 		}
 		
   		%>
   

</body>
</html>