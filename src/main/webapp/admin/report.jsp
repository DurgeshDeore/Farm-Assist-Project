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
<style>
#btn{
color: white ;
background-color: #f4cb1e;
border: black;
margin: 10px;
padding:2px;
border-radius:5%;

}
</style>
<title>Reports</title>
<%@include file='head.jsp' %>
</head>
<body>

<%@include file='menu.jsp' %>

<table class="table">
<tr>
<Td>
Name
</Td>
<tD>
Email
</tD>
<tD>
Phone
</tD>
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
	rs=stmt.executeQuery("select * from tblcart,tblproduct,tbluser where tbluser.uid=tblcart.uid and tblcart.pid=tblproduct.pid  and status>=1");
	while(rs.next()){
		%>
		<tr>
		<tD><%out.println(rs.getString("uname"));%></tD>
		<tD><%out.println(rs.getString("email"));%></tD>
		<tD><%out.println(rs.getString("phone"));%></tD>
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
		
		<a href="status.jsp?id=<%out.println(rs.getString("cartid"));%>">
		<input type="submit" name="btnsave" id="btn"  value="Get Report">
		</a>
		</td>
		<tD><%out.println(rs.getInt("status"));%></tD>
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

</body>
</html>