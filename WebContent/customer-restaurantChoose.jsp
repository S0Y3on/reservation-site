<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style>
#wrap {
	margin-left: auto;
	magin-right: auto;
	text-align: center;
}

.button {
	background-color:#FFC0CB;
	border:none;
	color: white;
	padding: 30px, 60px;
	font-size: 50px;
	text-align: center;
	border-radius: 10px;
}
</style>
<meta charset="EUC-KR">
<title>회원가입</title>
</head>
<body style="background-color:#E6E6FA">
<br><br><br><br><br><br><br><br><br><br><br><br>
<div id="wrap">
<input type="button" class="button" value="식당회원가입" onclick="location.href='restaurantInsertForm.jsp'"> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="button" value="고객회원가입" onclick="location.href='customerInsertForm.jsp'"><br>
</div>
</body>
</html>