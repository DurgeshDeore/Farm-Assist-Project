<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<%@include file='head.jsp' %>
<style>
.weather{
margin-top:30px;
margin-left:30px;
margin-right:auto;
height:300px;
width:340px;
}
#adsimg{
height:180px;
width:180px;
}
</style>
</head>
<body>
<%@include file='header.jsp' %>

<div class="weather">
	<iframe src="https://api.wo-cloud.com/content/widget/?geoObjectKey=383160&language=en&region=IN&timeFormat=HH:mm&windUnit=kmh&systemOfMeasurement=metric&temperatureUnit=celsius" name="CW2" scrolling="no" width="290" height="318" frameborder="0" style="border: 1px solid #10658E;border-radius: 8px"></iframe>
</div>
<%@include file='ads.jsp' %>
<%@include file='footer.jsp' %>
</body>
</html>