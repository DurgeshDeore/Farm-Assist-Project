<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
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
<title>login</title>
<%@include file='head.jsp' %>
</head>
<body>
<%@include file='header.jsp' %>
<%@include file='menu.jsp' %>
<br>
<br>

<%
if(request.getParameter("btnlogin")!=null){
	
	String pass=request.getParameter("txtpass");
	String email=request.getParameter("txtemail");
	Mylib l1=new Mylib();
	if(l1.exists("select * from tbluser where email='"+email+"' and upass='"+pass+"'")){
		session.setAttribute("email",email);
		
Statement stmt=null;
Connection con=null;
ResultSet rs=null;
Class.forName("org.postgresql.Driver");
//Mylib l1=new Mylib();
con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/"+l1.dbname,"postgres","postgres");
stmt=con.createStatement();
rs=stmt.executeQuery("select * from tbluser where email='"+session.getAttribute("email")+"'");
while(rs.next()){
	session.setAttribute("uid",rs.getInt("uid"));
	session.setAttribute("uname",rs.getString("uname"));
	
}
rs.close();
stmt.close();
con.close();
%>

		<script>
			alert("Login Success");
			window.location.href="index.jsp";
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
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
<form method="post">
<table class="table">


<tr>
<td>
Email
</td>
<td>
<input type="text" name="txtemail"  pattern="^[a-z]*[0-9]*@[a-z]*[0-9]*\.[a-z]{2,3}$" required class="form-control">
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
<td colspan=2 align=center>
<input type="submit" name="btnlogin" value="Login" id="btn" class="btn btn-success">
</td>
</tr>
</table>
</form>
</div>
<div class="col-md-3"></div>
</div>

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