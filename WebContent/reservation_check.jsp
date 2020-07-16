<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
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
<title>Reservation ChecK!</title>
</head>
<body>

<%

Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201712048", "201712048");

String id=(String)session.getAttribute("id");
int customer_no = 0;

if(id != null){
	   String sqlStr1 = "select * from Customer where id=?";
	   PreparedStatement st1 = conn.prepareStatement(sqlStr1);
	   st1.setString(1, id);
	   ResultSet rs1 = st1.executeQuery();
	   while(rs1.next()){
		   customer_no = rs1.getInt("customer_no");
	   }
	}



%>
<h1>예약 확인</h1>



	<%
	String sqlStr = "select reservation_no, reservation_date, restaurant_name, reservation_menu,reservation_price from Restaurant natural join reservation where customer_no = ?";
	
	PreparedStatement st = conn.prepareStatement(sqlStr);
	st.setInt(1,customer_no);
	ResultSet rs = st.executeQuery();
	if(!rs.next()){
		%><a>고객님은 아직 예약하지 않으셨습니다.</a><br><%
	}
	else{
		%>
		<table style="border:1px solid red;width:60%;height:100px;margin:auto;text-align:center;">
		<tr><th> 예약 일시  <th> 식당 이름 <th> 메뉴 <th> 가격 <th> 평가하기 </tr>
		<%
		while(true){
			String r_no = rs.getString("reservation_no");
			String r_date = rs.getString("reservation_date");
			String r_name = rs.getString("restaurant_name");
			String r_menu = rs.getString("reservation_menu");
			String r_price = rs.getString("reservation_price");
			%>
			<tr><td> <%=r_date%> <td> <%=r_name%> <td> <%=r_menu%> <td> <%=r_price%> 
			<td><p><a href="./reservation_evaluation.jsp?r_menu=<%=r_menu%>&r_no=<%=r_no%>&r_name=<%=r_name%>"style="color: red">♥</a> </p></tr>
			<%
		      if(!rs.next()) break;

		}
		
	}

	%>
<p><a href="./reservation.jsp"style="color: pink">예약 페이지 돌아가기</a></p>
</body>
</html>