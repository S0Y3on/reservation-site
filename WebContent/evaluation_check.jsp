<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
h1 {text-align: center;}
p {text-align: center;}
a { text-decoration:none } 

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Evaluation list!</title>
</head>
<body>
<h1>식당평가 LIST</h1>
<table style="border:1px solid red;width:60%;height:100px;margin:auto;text-align:center;">
	<tr> <th> 메뉴이름 <th> 평가점수 <th> 평가 <th> 식당이름  </tr>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201712048", "201712048");


String sqlStr = "select * from Evaluation";

PreparedStatement st = conn.prepareStatement(sqlStr);
ResultSet rs = st.executeQuery();


while(rs.next()){
	String e_no = rs.getString("evaluation_no");
	String r_no = rs.getString("reservation_no");
	String r_menu = rs.getString("reservation_menu");
	String e_score = rs.getString("evaluation_score");
	String e_data = rs.getString("evaluation_data");
	String r_name = rs.getString("restaurant_name");
	if(e_data == null || e_data.equalsIgnoreCase("null")){
		e_data = "";
	}
	%>
	<tr> <td><a href="./evaluation_edit.jsp?e_no=<%=e_no%>"><%=r_menu%></a>  <td> <%=e_score%> <td> <%=e_data%> <td> <%=r_name%></tr>
	<%
}



%>
<br>
<p>
<a href="./reservation.jsp">예약페이지 돌아가기</a><br><br>
</p>
</body>
</html>