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
<title>Bill</title>
<%@include file='head.jsp' %>
</head>
<body>
<%@include file='header.jsp' %>
<div class="divcontainer">
<table class="table">
<tr>
<Td>
Name
</Td>
<td>
<%out.println(session.getAttribute("uname")); %>
</td>
</tr>
<tr>
<Td>
Email
</Td>
<td>
<%out.println(session.getAttribute("email")); %>
</td>
</tr>
<tr>
<Td>
Address
</Td>
<td>
<%out.println(request.getParameter("id")); %>
</td>
</tr>
</table>
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
	rs=stmt.executeQuery("select * from tblcart,tblproduct where tblcart.pid=tblproduct.pid and tblcart.uid="+session.getAttribute("uid"));
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
		</tr>
		
		<%
		
	}
	%>
	<tr>
	<td>
	Total
	</td>
	<td>
	<% out.println(totalamt+""); %>
	</td>
	</tr>
	
	<tR>
	<tD>
	Total After Tax
	</tD>
	<td>
	<% out.println(totalamt+8/100*totalamt+""); %>
	</td>
	</tR>
	<%

}
catch(Exception ex){
	
}

%>
</table>
<form method="post">
<table>
<hr>
<tr>
<tD>
<bold>Select Payment type</bold>
<!--</tD>
<td>
  <select class="form-control" name="cmbpayment">
<option value="Online">Online</option>
<option value="COD">COD</option>
</select>

</td>
</tr>-->
<a href="cod.jsp"> COD 
	</a>
<a href="online.jsp"> Online 
</a>
</td>
</tr>
</table>
</form>

<%
if(request.getParameter("btnpay")!=null){
	String pay=request.getParameter("cmbpayment");
	Mylib l1=new Mylib();
	l1.dml("update tblcart set status='1' , tpayment='"+pay+"' where status='0' and uid="+session.getAttribute("uid"));
}

%>
</div>
<%@include file='footer.jsp' %>
</body>
</html>