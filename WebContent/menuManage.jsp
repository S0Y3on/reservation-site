<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #E6E6FA">
	<%
		//세션 값 가져오기
	String id = (String) session.getAttribute("id");
	//세션값 없으면 loginForm.jsp이동
	if (id == null) {
		response.sendRedirect("loginForm.jsp");
	}
	%>
	<div id="wrap"><br><br><br><br><br><br><br><br><br><br><br><br>
		<input type="button" class="button" value="메뉴조회" onclick="location.href='menuInfo.jsp'">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" class="button" value="메뉴추가" onclick="location.href='menuAddForm.jsp'">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" class="button" value="메뉴수정" onclick="location.href='menuUpdateForm.jsp'">
	</div>
</body>
</html>