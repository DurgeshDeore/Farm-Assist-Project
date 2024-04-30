<%@page import="classfile.Mylib"%>
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
}

</style>
<title>Admin panel</title>
<%@include file='head.jsp' %>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<%
if(request.getParameter("btnlogin")!=null){
	String id=request.getParameter("txtid");
	String pass=request.getParameter("txtpass");
	Mylib l1=new Mylib();
	if(l1.exists("select * from tbladmin where id='"+id+"' and pass='"+pass+"'")){
		session.setAttribute("id",id);
		%>
		<script>
		window.location.href="addcategory.jsp";
		</script>
		<%
}
	else{
		%>
		<script>
		alert("Invalid Credentials");
		</script>
		<%
	}
}

%>

<center><h1>Admin Panel</h1></center>
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
<form method="post">
<table class="table">
<tr>
<td>
Admin ID
</td>
<td>
<input type="text" name="txtid" class="form-control">
</td>
</tr>
<tr>
<td>
Password
</td>
<td>
<input type="password" name="txtpass" class="form-control">
</td>
</tr>
<Tr>
<td>
<input type="submit" name="btnlogin" value="Login" id="btn" class="btn btn-success">
</td>
</Tr>
</table>

</form>
</div>
</div>

</body>
</html>