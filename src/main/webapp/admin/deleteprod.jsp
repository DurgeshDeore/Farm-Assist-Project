<%@page import="classfile.Mylib"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file='head.jsp' %>
<%
Mylib l1=new Mylib();
l1.dml("delete from tblproduct where pid="+request.getParameter("id"));


%>
<script>
window.location.href="viewproduct.jsp";
</script>
</body>
</html>