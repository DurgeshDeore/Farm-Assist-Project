<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="classfile.Mylib"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<%@include file='head.jsp' %>
</head>
<body>
<%@include file='menu.jsp' %>
<%

if(request.getParameter("btnsave")!=null){
	String pname=request.getParameter("txtpname");
	String pprice=request.getParameter("txtpprice");
	String pdprice=request.getParameter("txtpdprice");
	String pstock=request.getParameter("txtstock");
	String pdesc=request.getParameter("ckeditor");
	String cid=request.getParameter("cmbcat");
	String txtfile=request.getParameter("txtfile");
	Mylib l1=new Mylib();
	l1.dml("insert into tblproduct(pname,pprice,pdprice,pstock,pdesc,cid,pimage)Values('"+pname+"','"+pprice+"','"+pdprice+"','"+pstock+"','"+pdesc+"','"+cid+"','"+txtfile+"')");
	%>
	<%
}

%>
<div class="row">
<div class="col-md-12">
<form method="post">
<table class="table">
<tr>
<Td>
Choose Category
</Td>
<tD>
<select name="cmbcat" class="form-control">
<%
Statement stmt=null;
Connection con=null;
ResultSet rs=null;
Mylib l1=new Mylib();
Class.forName("org.postgresql.Driver");
con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/"+l1.dbname,"postgres","postgres");
stmt=con.createStatement();
rs=stmt.executeQuery("select * from tblcategory");
while(rs.next()){
	%>
	<option value=<%out.println(rs.getString("cid")); %>><%out.println(rs.getString("cname")); %></option>
	<%
}
rs.close();
stmt.close();
con.close();

%>
</select>
</tD>
</tr>
<tR>
<td>
Product Name
</td>
<Td>
<input type="text" name="txtpname" class="form-control">
</Td>
</tR>
<tR>
<td>
Product Price
</td>
<Td>
<input type="text" name="txtpprice" class="form-control">
</Td>
</tR>
<tR>
<td>
Product Discount Price
</td>
<Td>
<input type="text" name="txtpdprice" class="form-control">
</Td>
</tR>
<tR>
<td>
Product Description
</td>
<Td>
<textarea class="ckeditor" id="ckeditor" name="ckeditor"></textarea>
</Td>
</tR>
<tR>
<td>
Product Stock
</td>
<Td>
<input type="text" name="txtstock" class="form-control">
</Td>
</tR>
<tR>
<td>
Product Image
</td>
<Td>
<input type="file" name="txtfile" class="form-control">
</Td>
</tR>

<tr>
<td>
<input type="submit" name="btnsave" id="btn" class="btn btn-success" value="Add Product">
</td>
</tr>
</table>
</form>
</div>
</div>
</body>
</html>