<%@page import="classfile.Mylib"%>

<html>
<head>
<meta charset="UTF-8">
<title>Payment</title>
<%@include file='head.jsp' %>
<%@include file='loginrestrict.jsp' %>

</head>
<body>
<%@include file='header.jsp' %>
<div class="divcontainer">
<div class="paymentcontainercod">
<form method="post">
<select class="form-control" name="cmbpayment">
<option value="cod">CASH ON DELIVERY
</option>
<input type="submit" id="btn" value="Conform Order" name="btnpay">

</form>
</div>
<%
if(request.getParameter("btnpay")!=null){
	String pay=request.getParameter("cmbpayment");
	Mylib l1=new Mylib();
	l1.dml("update tblcart set status='1' , tpayment='"+pay+"' where status='0' and uid="+session.getAttribute("uid"));
	%>
	<script>
		alert("Order has been placed");
	</script>
	<% 
}
%>
</div>
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