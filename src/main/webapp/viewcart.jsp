<%@page import="classfile.Mylib"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>view cart</title>
<%@include file='head.jsp' %>
<style>
#btn{
color: white ;
background-color: #f4cb1e;
border: black;
margin: 10px;
}

</style>
</head>
<body>
<%@include file='header.jsp' %>
<%@include file='menu.jsp' %>

<div class="divcontainer">
<table class="table">
<tr>
<TD>
Product Id
</TD>
<td>
Product Name
</td>
<Td>
Product Price
</Td>
<tD>
Quantity
</tD>
<td>
Total
</td>
</tr>

<%
try{
	Double totalamt=0.0;
	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	Class.forName("org.postgresql.Driver");
	Mylib l1=new Mylib();
	con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/"+l1.dbname,"postgres","postgres");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select * from tblcart,tblproduct where tblcart.pid=tblproduct.pid and tblcart.uid="+session.getAttribute("uid")+" and status='0'");
	while(rs.next()){
		%>
		<tr>
		<tD><%out.println(rs.getString("pid"));%></tD>
		<tD><%out.println(rs.getString("pname"));%></tD>
		<tD><%out.println(rs.getString("pdprice"));%></tD>
		<tD><%out.println(rs.getString("qty"));%></tD>
		<td>
		<%
		Double d1=Double.parseDouble(rs.getString("pdprice"));
		Double d2=Double.parseDouble(rs.getString("qty"));
		out.println(d1*d2);
		totalamt=totalamt+(d1*d2);
		%>
		</td>
		<td>
		<a href="delete.jsp?id=<%out.println(rs.getString("cartid"));%>">
		<input type=submit id="btn" value="Remove" class="btn btn-danger"></input>
		</a>
		</td>
		</tr>
		
		<%
		
	}
	%>
	<tR>
	<tD>
	Total
	</tD>
	<td>
	<% out.println(totalamt+""); %>
	</td>
	</tR>
	<%

}
catch(Exception ex){
	
}

%>

</table>

<a href="address.jsp" >
<input type=submit id="btn" value="Select Address" id="btn"></input>
</div>
</a>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<br>

<%@include file='footer.jsp' %>
</body>
</html>