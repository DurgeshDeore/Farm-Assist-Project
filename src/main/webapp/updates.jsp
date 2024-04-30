<%@page import="classfile.Mylib"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
<%@include file='head.jsp' %>
</head>
<body>
<%@include file='header.jsp' %>
<%

Statement stmt=null;
Connection con=null;
ResultSet rs=null;
Class.forName("org.postgresql.Driver");
Mylib l1=new Mylib();
con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/"+l1.dbname,"postgres","postgres");
stmt=con.createStatement();
rs=stmt.executeQuery("select * from tblupdate");
%>
<table class="table">

<%
while(rs.next()){
%>

<tr>
<Td>
<h1>
 <%
 out.println(rs.getString("heading"));
 %></h1>
</Td>
<Td>
<p>
 <%
 out.println(rs.getString("desc"));
 %></p>
</Td>
</tr>

<%
}
%>
</table>
<%@include file='footer.jsp' %>
<br>
<br>

<br>

<br>

<br>

</body>
</html>