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
//한글처리
request.setCharacterEncoding("utf-8");
//패키지 member 파일이름 MemberDataBean
//멤버변수 id passwd name reg_date

//액션태그 useBean 이동 객체 생성 member
//액션태그 setProperty 폼=>자바빈저장
%>
<jsp:useBean id="restaurant" class="pknu.it.RestaurantDataBean"/>
<jsp:setProperty property="*" name="restaurant" />
아이디:<jsp:getProperty property="id" name="restaurant"/><br>
패스워드:<jsp:getProperty property="pwd" name="restaurant"/><br>
식당이름:<jsp:getProperty property="name" name="restaurant"/><br>
전화번호:<jsp:getProperty property="tel" name="restaurant"/><br>
주소:<jsp:getProperty property="address" name="restaurant"/><br>
식당구분:<%=restaurant.getRclass() %><br>
좌석수:<jsp:getProperty property="table" name="restaurant"/><br>
<%
//디비작업 패키지 member 파일이름 MemberDBBean
//객체생성 dbPro
String id = restaurant.getId();
RestaurantDBBean dbPro = new RestaurantDBBean();
int idCheck = dbPro.idCheck(id); //idCheck==0 존재하는 아이디, ==1 없는 아이디
System.out.println(idCheck);
//메서드 insertMember(member)
if(restaurant.getId()==null || restaurant.getPwd()==null || restaurant.getName()==null || restaurant.getTel()==null
||restaurant.getAddress()==null || restaurant.getTable()<=0 || restaurant.getRclass()==null ){
	%><script type="text/javascript">alert("모든 항목을 입력해주세요."); location.href="restaurantInsertForm.jsp";</script>
<% } else{
if(idCheck==0){
	%><script type="text/javascript">
	alert("이미 존재하는 아이디입니다.");
	location.href="restaurantInsertForm.jsp";
	</script><%
} else if(idCheck==1){
dbPro.insertRestaurant(restaurant);
//이동 회원가입성공 loginForm.jsp
%><script type="text/javascript">
 alert("회원가입 성공!!");
 location.href="loginForm.jsp";
 </script><%}
}
%>

</body>
</html>