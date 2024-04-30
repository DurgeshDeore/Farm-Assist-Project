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
<%@include file='menu.jsp' %>
<%

Statement stmt=null;
Connection con=null;
ResultSet rs=null;
Class.forName("org.postgresql.Driver");
Mylib l1=new Mylib();
con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/"+l1.dbname,"postgres","postgres");
stmt=con.createStatement();
rs=stmt.executeQuery("select * from tblproduct");
%>
<a href="addproduct.jsp"><input type="button" value="Add Product" class="btn btn-warning"></a>
<table class="table">
<Tr>
<td>
Product Name
</td>
<td>
Product Price
</td>
<td>
Product Discount Price
</td>
<td>
Product Stock
</td>
</Tr>
<%
while(rs.next()){
%>

<tr>
<Td>
 <%
 out.println(rs.getString("pname"));
 %>
</Td>
<Td>
 <%
 out.println(rs.getString("pprice"));
 %>
</Td>
<Td>
 <%
 out.println(rs.getString("pdprice"));
 %>
</Td>
<Td>
 <%
 out.println(rs.getString("pstock"));
 %>
</Td>
<Td>
<a href="deleteprod.jsp?id=<%out.println(rs.getString("pid"));%>"><input type="button" value="Delete" class="btn btn-danger"></a>
</Td>
</tr>

<%
}
%>
</table>
</body>
</html>