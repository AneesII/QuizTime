<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
</head>
<body>

</body>

<%

session.invalidate();
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", 0);

%>
<jsp:forward page="index.jsp"></jsp:forward>

</html>