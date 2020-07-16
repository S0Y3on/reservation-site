<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="pknu.it.RestaurantDataBean" %>
<%@ page import="pknu.it.RestaurantDBBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="restaurant" class="pknu.it.RestaurantDataBean"/>
<jsp:setProperty property="*" name="restaurant"/>
<%
//디비객체생성 dbPro
RestaurantDBBean dbPro=new RestaurantDBBean();
System.out.println("연결성공!!!!!!");
//int check =수정메서드호출 updateMember(member)
int check=dbPro.updateRestaurant(restaurant);
System.out.println(check);
//check==1 수정완료 main.jsp 이동
//check==0 비밀번호 틀림 뒤로이동
if(check==1){
 %>
 <script type="text/javascript">
 alert("수정완료");
 location.href="restaurantMain.jsp";
 </script>
 <%
}else{
 %>
 <script type="text/javascript">
 alert("비밀번호틀림");
 history.back();
 </script>
 <%
}
%>


</body>
</html>