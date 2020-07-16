<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<%request.setCharacterEncoding("utf-8");
 %>
 <html>
<head>
<title>Save~</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201712028", "201712028");

String r_no = request.getParameter("r_no");
String r_menu = request.getParameter("r_menu");
String e_data = request.getParameter("e_data");
String e_score = request.getParameter("e_score");
String r_name = request.getParameter("r_name");

String searchQuery = "select max(evaluation_no) from evaluation";
PreparedStatement st3 = conn.prepareStatement(searchQuery);
ResultSet rs3 = st3.executeQuery();
      
String e_no = null;
while(rs3.next()){
   e_no = rs3.getString("max(evaluation_no)");
}

String sqlStr = "insert into evaluation values (?,?,?,?,?,?)";

PreparedStatement st = conn.prepareStatement(sqlStr);
st.setInt(1, Integer.parseInt(e_no)+1);
st.setInt(2, Integer.parseInt(r_no));
st.setString(3, r_menu);
st.setInt(4, Integer.parseInt(e_score));
st.setString(5, e_data);
st.setString(6, r_name);

ResultSet rs = st.executeQuery();


%>
<p>저장 되었습니다.
<br>
<a href="./reservation.jsp">예약페이지 돌아가기</a><br>
<a href="./evaluation_check.jsp">식당 평가 목록보기</a><br>

</p>

</body>
</html>