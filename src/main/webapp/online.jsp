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
<%@include file='menu.jsp' %>
<div class="divcontainer">

<div class="paymentcontainer">
<form method="post">
<img id="qrimg" src="images/PhonePeQR_Bank Of Maharashtra.png">
<select class="form-control" name="cmbpayment">
<option value="Online">ONLINE
</option>
<input type="submit" id="btn" value="Conform Payment" name="btnpay">

</select>

</form>
</div>
<%
if(request.getParameter("btnpay")!=null){
	String pay=request.getParameter("cmbpayment");
	Mylib l1=new Mylib();
	l1.dml("update tblcart set status='1' , tpayment='"+pay+"' where status='0' and uid="+session.getAttribute("uid"));
	%>
	<script>
		alert("Payment Successfully done");
	</script>
	<% 
}

%>
</div>
<%@include file='footer.jsp' %>
</body>
</html>