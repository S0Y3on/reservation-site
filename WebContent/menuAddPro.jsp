<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
    
<%@ page import="pknu.it.RestaurantDataBean"%>
<%@ page import="pknu.it.RestaurantDBBean"%>
<!DOCTYPE html>
<%  
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201712048", "201712048");

String title = request.getParameter("title");
String price = request.getParameter("price");
String id=(String)session.getAttribute("id");
int r_no = 0;

if(title=="" || price==""){
	%><script type="text/javascript">alert("모든 항목을 채워주세요"); history.go(-1);</script>
<% } else{

if(id != null){
	   String sqlStr1 = "select * from Restaurant where id=?";
	   PreparedStatement st1 = conn.prepareStatement(sqlStr1);
	   st1.setString(1, id);
	   ResultSet rs1 = st1.executeQuery();
	   while(rs1.next()){
		   r_no = rs1.getInt("restaurant_no");
	   }
	}

System.out.println(r_no);

String sqlStr = "insert into menu values(?,?,?)";
PreparedStatement st = conn.prepareStatement(sqlStr);

st.setInt(1, r_no);
st.setString(2,title);
st.setString(3,price);


ResultSet rs = st.executeQuery();
}
%>
추가되었습니다. <br>

</body>
</html>