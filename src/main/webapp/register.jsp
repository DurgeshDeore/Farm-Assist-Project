<%@page import="classfile.Mylib"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#btn{
color: white ;
background-color: #f4cb1e;
border: black;
margin: 10px;
}
</style>
<title>Register</title>
<%@include file='head.jsp' %>

</head>
<body>
<%@include file='header.jsp' %>
<%@include file='menu.jsp' %>
<br>
<br>

<%
if(request.getParameter("btnsave")!=null){
	String name=request.getParameter("txtname");
	String pass=request.getParameter("txtpass");
	String email=request.getParameter("txtemail");
	String gender=request.getParameter("rbgender");
	String dob=request.getParameter("txtdob");
	String phone=request.getParameter("txtphone");
	Mylib l1=new Mylib();
	l1.dml("insert into tbluser(uname,upass,email,gender,dob,phone)values('"+name+"','"+pass+"','"+email+"','"+gender+"','"+dob+"','"+phone+"')");
	%>
	<script>
	alert("Registration Success");
	window.location.href="login.jsp";
	</script>
	<%
}

%>
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
<form method="post">
<table class="table">
<tr>
<td>
Name
</td>
<td>
<input type="text" name="txtname" pattern="^[a-z]*$"  required class="form-control">
</td>
</tr>
<tr>
<td>
Password
</td>
<td>
<input type="password" name="txtpass" required class="form-control">
</td>
</tr>
<tr>
<td>
Email
</td>
<td>
<input type="email" pattern="^[a-z]*[0-9]*@[a-z]*[0-9]*\.[a-z]{2,3}$" name="txtemail" required class="form-control">
</td>
</tr>
<tr>
<td>
Phone
</td>
<td>
<input type="text" name="txtphone" pattern="\d{10}" required class="form-control">
</td>
</tr>
<tr>
<td>
Gender
</td>
<td>
<input type="radio" name="rbgender" value="Male" checked="checked">Male&nbsp;
<input type="radio" name="rbgender" value="Female">Female&nbsp;
<input type="radio" name="rbgender" value="Transgender">Transgender&nbsp;
</td>
</tr>
<tr>
<td>
DOB
</td>
<td>
<input type="date" name="txtdob" required class="form-control">
</td>
</tr>
<tr>
<td colspan=2 align=center>
<input type="submit" name="btnsave" value="Create Account" id="btn" class="btn btn-success">
</td>
</tr>
</table>
</form>
</div>
<div class="col-md-3"></div>
</div>

<br>

<%@include file='footer.jsp' %>
</body>
</html>