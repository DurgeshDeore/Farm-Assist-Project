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

<title>view details</title>

<%@include file='head.jsp' %>
<%@include file='loginrestrict.jsp' %>
<style>
.prodimg{
height:350px;
width:280px;
}
#btn{
color: white ;
background-color: #f4cb1e;
border: black;
}
.table{
margin: 10px;
}
.detailscontainer{
padding:5%;

}
.imgdiv{
margin: 12px;
}
</style>
</head>
<body>
<%@include file='header.jsp' %>
<%@include file='menu.jsp' %>

<div class="detailscontainer">
	<%
	Statement stmt=null;
	Connection con=null;
	ResultSet rs=null;
	Class.forName("org.postgresql.Driver");
	Mylib l1=new Mylib();
	con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/"+l1.dbname,"postgres","postgres");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select * from tblproduct where pid="+request.getParameter("id"));
	%>
	<div class="row">
	<%
	while(rs.next()){
		%>
		<div class="imgdiv">
			<img class="prodimg" src="admin/images/<%out.println(rs.getString("pimage")); %>">
		</div>
		<div class="col-md-4">
		<table class="table">
		<!-- <tr>
		
		<tD colspan=2 align=center>
		<img class="prodimg" src="admin/images/<%out.println(rs.getString("pimage")); %>">
		</tD>
		</tr> -->
		<tr>
		<td>
		Product Name
		</td>
		<tD>
		<%out.println(rs.getString("pname")); %>
		</tD>
		</tr>
		<tr>
		<td>
		Product Price
		</td>
		<tD>
		₹<strike><%out.println(rs.getString("pprice")); %></strike>/-
		</tD>
		
		</tr>
		<tr>
		<td>
		Product Discount Price
		</td>
		<tD>
		₹<%out.println(rs.getString("pdprice")); %>/-
		</tD>
		</tr>
		<tr>
		<td>
		Product Description
		</td>
		<tD>
		<%out.println(rs.getString("pdesc")); %>
		</tD>
		</tr>
		<form method="post">
		<tr>
		<tD>
		Quantity
		</tD>
		<td>
		<select name="cmbqty" class="form-control">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		</select>
		</td>
		</tr>
		<tr>
		<td>
		<input type="submit" name="btnaddcart" value="Add To Cart" class="btn btn-primary" id="btn">
		</td>
		</tr>
		</form>
		</table></div>
		
		<%
	}
	rs.close();
	stmt.close();
	con.close();
	
	if(request.getParameter("btnaddcart")!=null){
		int qty=Integer.parseInt(request.getParameter("cmbqty"));
		//Mylib l1=new Mylib();
		//out.println("insert into tblcart(uid,pid,qty) values('"+session.getAttribute("uid")+"','"+request.getParameter("id")+"','"+qty+"')");
		
		Statement stmt1=null;
		Connection con1=null;
		ResultSet rs1=null;
		Class.forName("org.postgresql.Driver");
		con1=DriverManager.getConnection("jdbc:postgresql://localhost:5432/"+l1.dbname,"postgres","postgres");
		stmt1=con1.createStatement();
		rs1=stmt1.executeQuery("select * from tblproduct where pid="+request.getParameter("id"));
		
		if(rs1.next()){
			if(rs1.getInt("pstock")>=qty){
				l1.dml("insert into tblcart(uid,pid,qty,status) values('"+session.getAttribute("uid")+"','"+request.getParameter("id")+"','"+qty+"','0')");
				int total=rs1.getInt("pstock")-qty;
				l1.dml("update tblproduct set pstock='"+total+"' where pid='"+request.getParameter("id")+"'");
				%>
				<script>
				alert("Added to Cart");
				</script>
				<%
			}
			else{
				%>
				<script>
				alert("Out Of Stock");
				</script>
				<%
			}
		}
		rs.close();
		stmt.close();
		con.close();	
	}
	%>
</div>
</div>
<%@include file='footer.jsp' %>
</body>
</html>