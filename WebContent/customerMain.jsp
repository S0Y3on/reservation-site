<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
//세션값 가져오기
String id=(String)session.getAttribute("id");
//세션값이 없으면 loginForm.jsp이동
if(id==null){
 response.sendRedirect("loginForm.jsp");
}
%>
<%=id %>님이 로그인하셨습니다.<br>
<a href="logout.jsp">로그아웃</a><br>
<a href="customerUpdateForm.jsp">회원정보수정및확인</a><br>
<input type="button" value="예약하기" onclick="location.href='reservation.jsp'">
난 손님이다!!! 예약할꺼임 !!!!
</body>
</html>