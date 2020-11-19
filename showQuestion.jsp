<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Quiz </title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<%! 
	
	static int qNo=1;
	static int total=0;
		
	%>
	
	<div class="topNv" >
	
	<a href="home.jsp" class="topBtn" > Home </a>
	
	</div> <br />
	
	<%
	
	if(request.getSession().getAttribute("Restart")!=null){
		Integer i = (Integer) request.getSession().getAttribute("Restart");
		if(i==1){
			qNo =1;
			total=0;
			request.getSession().setAttribute("Restart",0);
		}
	}
	
	String qzNm;
	
	if(request.getSession().getAttribute("qzNm")!=null){
		qzNm = (String) request.getSession().getAttribute("qzNm");
	}else{
		qzNm = request.getParameter("qzNm");
		 request.getSession().setAttribute("qzNm",qzNm);
	}
	
	if(request.getSession().getAttribute("correctAns")!=null){
		Integer i = (Integer) request.getSession().getAttribute("correctAns");
		total += i;
		String marks = Integer.toString(total);
		request.getSession().setAttribute("Score", marks);
	}

	
	if(qNo>5){
		response.sendRedirect("result.jsp");
	}
	
	
	
	out.print("<div class=\"Qb\" >");
	out.print("<h2 style=\"text-align:center;background-color:black\" >");
	out.print(qzNm);
	out.print("</h2>");
	out.print("<br/>");
	
	
	 try {
			
		 	Class.forName("com.mysql.jdbc.Driver"); 
		 	String host = "jdbc:mysql://localhost:3306/quizdb";
		 	Connection conn =DriverManager.getConnection(host,"root","");
			
			PreparedStatement ps=conn.prepareStatement("select * from QuizQuestion where QuizName='"+qzNm+"' AND QID="+qNo+" ");
			
			ResultSet rs=ps.executeQuery();
		
			if(rs.next()){
				String qs = rs.getString("Question");
				String option1 = rs.getString("Option1");
				String option2 = rs.getString("Option2");
				String option3 = rs.getString("Option3");
				String option4 = rs.getString("Option4");
				String ans = rs.getString("Answer");
				request.getSession().setAttribute("Ans",ans);
				
				 out.print("<form action=\"CheckQuestion\" method=\"POST\"  >");
				
				 
				 out.print("<label> Q"+qNo+") </label>");
				 out.print("<label>");
				 out.print(qs);
				 out.print("</label>");
				 out.print("<br /><br />");
				 
			     out.print("<input type=\"radio\" name=\"ans\" value='"+option1+"' required />");
			     out.print("<label>");
				 out.print(option1);
				 out.print("</label>");
				 out.print("<br /><br />");
				 
				 out.print("<input type=\"radio\" name=\"ans\" value='"+option2+"' required />");
			     out.print("<label>");
				 out.print(option2);
				 out.print("</label>");
				 out.print("<br /><br />");
				 
				 out.print("<input type=\"radio\" name=\"ans\" value='"+option3+"' required />");
			     out.print("<label>");
				 out.print(option3);
				 out.print("</label>");
				 out.print("<br /><br />");
				 
				 out.print("<input type=\"radio\" name=\"ans\" value='"+option4+"' required />");
			     out.print("<label>");
				 out.print(option4);
				 out.print("</label>");
				 out.print("<br /><br />");
				 
				 if(qNo<=4){
			     out.print("<input type=\"submit\"  value=\"Next\" />");
			     out.print("<br/>");
				 }else{
					 out.print("<input type=\"submit\"  value=\"Result\" />");
				     out.print("<br/>");
				 }
			     
				 out.print("</form>");			 
				 out.print("<br/>");
				
				 qNo++;
				 
			}
			else {
				
			}
			
		PreparedStatement ps1=conn.prepareStatement("select * from QuizInfo where QuizName='"+qzNm+"' ");
		ResultSet rs1=ps1.executeQuery();
			
			if(rs1.next()){
				
				String Author = rs1.getString("QuizAuthor");
				if(!Author.equals(null)){
				out.print("<div class=\"authorInfo\" > Prepared by: "+Author+ "</div>");
				}
			}
			
			conn.close();
	 }
	 catch(Exception e){e.printStackTrace();}
	 
	 out.print("</div>");
	 
	
	%>
	
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>