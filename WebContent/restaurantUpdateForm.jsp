<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="pknu.it.RestaurantDataBean"%>
<%@ page import="pknu.it.RestaurantDBBean"%>
<!DOCTYPE html> 
<html>
<head>
<style>
#wrap {
	margin-left: auto;
	magin-right: auto;
	text-align: center;
}

table {
	margin-left: auto;
	margin-right: auto;
}

.button {
	background-color: #FFC0CB;
	border: none;
	color: white;
	padding: 30px, 60px;
	font-size: 20px;
	text-align: center;
	border-radius: 5px;
}
</style>
<meta charset="EUC-KR">
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
	//디비객체생성 dbPro
	RestaurantDBBean dbPro = new RestaurantDBBean();
	//자바빈 member=getMember(id)메서드 호출
	RestaurantDataBean restaurant = dbPro.getRestaurant(id);
	%>
	<div id="wrap"><br><br><br><br>
		<font size="5" color="gray">회원정보확인 및 수정</font> <br> <br>
		<form action="restaurantUpdatePro.jsp" method="post">
			<table>
				<tr>
					<td id="title">아이디</td>
					<td><%=restaurant.getId()%> <input type=hidden name="id"
						value="<%=restaurant.getId()%>"><br></td>
				</tr>
				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="pwd"><br></td>
				</tr>
				<tr>
					<td id="title">닉네임</td>
					<td><input type="text" name="name"
						value="<%=restaurant.getName()%>"><br></td>
				</tr>
				<tr>
					<td id="title">도로명주소</td>
					<td><input type="text" name="addr"
						value="<%=restaurant.getAddress()%>"><br></td>
				</tr>
				<tr>
					<td id="title">전화번호</td>
					<td><input type="text" name="tel"
						value="<%=restaurant.getTel()%>"><br></td>
				</tr>
				<tr>
					<td id="title">식당구분</td>
					<td><input type="radio" name="rclass" value="korea-food" checked>한식 
					    <input type="radio" name="rclass" value="japan-food" checked>일식 
					    <input type="radio" name="rclass" value="china-food" checked>중식 <br> 
					    <input type="radio" name="rclass" value="usa-food" checked>양식 
					    <input type="radio" name="rclass" value="school-food" checked>분식
						<input type="radio" name="rclass" value="fast-food" checked>패스트푸드<br></td>
				</tr>
				<tr>
					<td id="title">좌석수</td>
					<td><input type="number" name="table"
						value="<%=restaurant.getTable()%>"><br></td>
				</tr>
				</table>
				<br>
				<input type="submit" class="button" value="정보수정">&nbsp;&nbsp;
				<input type="button" class="button" value="로그아웃" onclick="location.href='logout.jsp'">
				</form>
				</div>
</body>
</html>