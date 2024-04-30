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

<title>Post</title>
<%@include file='head.jsp' %>
</head>
<body>
<%@include file='menu.jsp' %>
<%

if(request.getParameter("btnpost")!=null){
	String pcaption=request.getParameter("ckeditor");
	//String cid=request.getParameter("cmbcat");
	out.prinln(session.getAttribute("uid"));
	String txtfile=request.getParameter("txtfile");
	Mylib l1=new Mylib();
	l1.dml("insert into tblpost(caption,postimg)Values('"+pcaption+"','"+txtfile+"')");
	%>
	<script>
	alert("Post uploaded");
	
	</script>
	<%
}

%>
<div class="row">
<div class="col-md-12">
<form method="post">
<table class="table">

<tR>
<td>
Caption
</td>
<Td>
<textarea class="ckeditor" id="ckeditor" name="ckeditor"></textarea>
</Td>
</tR>

<tR>
<td>
Post Image
</td>
<Td>
<input type="file" name="txtfile" class="form-control">
</Td>
</tR>

<tr>
<td>
<input type="submit" name="btnpost" id="btn" class="btn btn-success" value="Post">
</td>
</tr>
</table>
</form>
</div>
</div>
</body>
</html>