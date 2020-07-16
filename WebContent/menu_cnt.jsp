<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%request.setCharacterEncoding("utf-8");
 %>
<html>
<head>
<style>
</style>
<meta charset="EUC-KR">
<title>Menu~~CoUnT~!</title>
</head>
<body>
<form action="./reservation.jsp" method="POST">
<h2>수량 선택</h2>
<%
String r_num = request.getParameter("r_no");
String [] m_name = request.getParameterValues("m_name");

if(r_num=="" || m_name==null){
	%><script type="text/javascript">alert("항목을 하나 이상 선택해주세요."); history.go(-1);</script>
<% } else{

for(int i=0; i<m_name.length; i++){
	%><%=m_name[i]%> : 
<select name="count">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    
</select><br><% 
}

%>

<h2>인원 수</h2>
<input type="text" name="people" /><br>

<h2>예약 날짜</h2>
<input type="datetime-local" name="r_date"><br>
<input type="hidden"  name="r_no" value="<%=r_num %>">
<%
for(int i=0;i<m_name.length;i++){
%>
<input type="hidden"  name="m_name" value="<%=m_name[i]%>">
<%
}

%>

<br>

<input type="submit" value="예약 하기"/>

<%
}

%>

</body>
</html>