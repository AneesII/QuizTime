<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Quiz </title>
<link rel="stylesheet" type="text/css" href="style.css">
<link href="Content/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
	
	 <jsp:include page="header.jsp"></jsp:include>
	
		
	
	<%
	
	
		if(request.getSession().getAttribute("qzNm")!=null){
		request.getSession().setAttribute("qzNm",null);
		}
		
		if(request.getAttribute("finished")!=null){
		   out.print("<h4>");
		out.print(request.getAttribute("finished"));
		  out.print("</h4>");
		}
		
		if(request.getSession().getAttribute("Type")!=null){
			
			String type = (String) request.getSession().getAttribute("Type");
				
				if(type.equals("Teacher")){
				out.print("<div  class = \"topnv\">");
				out.print("<a class=\"topBtn\" href=\"createQuiz.jsp\"> Create Quiz </a>"); 
				out.print("<br /></div>");
				}
				
				else if(type.equals("Student")){
					out.print("<div  class = \"topnv\">");
					out.print("<div class=\"topBtn\" > QuizTime </div>"); 
					out.print("<br /></div>");
				}
				
				
				
			}
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver"); 
		 	String host = "jdbc:mysql://localhost:3306/quizdb";
		 	Connection conn =DriverManager.getConnection(host,"root","");
			
			PreparedStatement ps = conn.prepareStatement("select * from QuizInfo");
			
			ResultSet rs = ps.executeQuery();
			
			out.print("<div class=\"quizMenu\" >");
			
			out.print("<div class=\"row\"> ");
			
			ArrayList<String> QNm = new ArrayList<String>();
        	
        	while(rs.next()){
        			        	
	        QNm.add(rs.getString("QuizName"));
	        
        	}
        	
        	int size = QNm.size();
        	
        	int sizeHalf = size/2;
        
        	out.print("<div class=\"col-sm-6\"> ");
        
        	for(int i=0;i<sizeHalf;i++){
        	
        	out.print("<br />");
	        out.print("<form action=\"showQuestion.jsp\" method=\"POST\"  >");  
	        out.print("<input type=\"submit\" name=\"qzNm\"  value=\""+QNm.get(i)+"\" />");
	        out.print("</form>");
	        
        	}
	        
	        out.print("</div> ");
        	
        	out.print("<div class=\"col-sm-6\"> ");
            
        	for(int i=sizeHalf;i<size;i++){
        	
        	out.print("<br />");
	        out.print("<form action=\"showQuestion.jsp\" method=\"POST\"  >");  
	        out.print("<input type=\"submit\" name=\"qzNm\"  value=\""+QNm.get(i)+"\" />");
	        out.print("</form>");
	        
        	}
	        
	        out.print("</div> ");
	        

 		out.print("</div>");       
 
        out.print("</div>");
	 
	 }
			catch(Exception e){
					e.printStackTrace();
			}
		 
		 request.getSession().setAttribute("Restart",1);
	
	%>
	
	 <jsp:include page="footer.jsp"></jsp:include>  	
	
			<script src="Content/Jquery.js"></script>
		
			<script src="Content/js/bootstrap.min.js"></script>

</body>
</html>