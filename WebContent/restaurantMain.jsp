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
	background-color: #FFC0CB;
	border: none;
	color: white;
	padding: 30px, 60px;
	font-size: 20px;
	text-align: center;
	border-radius: 10px;
}
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body style="background-color: #E6E6FA">
<%
//세션값 가져오기
String id=(String)session.getAttribute("id");
//세션값이 없으면 loginForm.jsp이동
if(id==null){
 response.sendRedirect("loginForm.jsp");
}
%>
<div id="wrap">
<%=id %>님이 로그인하셨습니다.<br>


<input type="button" class="button" value="로그아웃" onclick="location.href='logout.jsp'"> <br>
<input type="button" class="button" value="회원정보수정및확인" onclick="location.href='restaurantUpdateForm.jsp'"><br>
<input type="button" class="button" value="메뉴관리" onclick="location.href='menuManage.jsp'">
<input type="button" class="button" value="예약관리" onclick="location.href='reservation_res.jsp'">
난 식당이다!!! 돈벌꺼임 !!!!
</div>
</body>
</html>