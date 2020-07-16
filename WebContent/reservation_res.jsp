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
int res_no = 0;

if(id != null){
   String sqlStr = "select * from Restaurant where id=?";
   PreparedStatement st = conn.prepareStatement(sqlStr);
   st.setString(1, id);
   ResultSet rs = st.executeQuery();
   while(rs.next()){
      res_no = rs.getInt("restaurant_no");
   }
}

%>
<h1>예약 확인</h1>



   <%
   String sqlStr = "select reservation_no, reservation_date, restaurant_name, reservation_menu,reservation_price from Restaurant natural join reservation where restaurant_no = ?";
   
   PreparedStatement st = conn.prepareStatement(sqlStr);
   st.setInt(1,res_no);
   ResultSet rs = st.executeQuery();
   if(!rs.next()){
      %><a>해당 식당에는 예약이 없습니다. </a><br><%
   }
   else{
      %>
      <table style="border:1px solid red;width:60%;height:100px;margin:auto;text-align:center;">
      <tr><th> 예약 일시  <th> 식당 이름 <th> 메뉴 <th> 가격 </tr>
      <%
      while(true){
         String r_no = rs.getString("reservation_no");
         String r_date = rs.getString("reservation_date");
         String r_name = rs.getString("restaurant_name");
         String r_menu = rs.getString("reservation_menu");
         String r_price = rs.getString("reservation_price");
         %>
         <tr><td> <%=r_date%> <td> <%=r_name%> <td> <%=r_menu%> <td> <%=r_price%> 
         </tr>
         <%
         if(!rs.next()) break;

      }
      
   }

   %>
<p><a href="./evaluation_res.jsp"style="color: pink">식당 평가 확인하기</a></p>

</body>
</html>