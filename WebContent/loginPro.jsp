<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="pknu.it.CustomerDBBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
//id passwd 가져오기
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
System.out.println(id);
System.out.println(passwd);
//디비작업 객체 생성 dbPro
//int check=메서드 userCheck(id,passwd) 1,0,-1인지
CustomerDBBean dbpro = new CustomerDBBean();
int check = dbpro.userCheck(id,passwd);
//check==1 세션생성"id" 이동 main.jsp
//check==0 비밀번호틀림 뒤로이동
//check==-1 아이디없음 뒤로이동
System.out.println(check);
int roleCheck = dbpro.roleCheck(id);
//roleCheck==1 고객
//rolecheck==0 식당
System.out.println(roleCheck);
if(check==1 && roleCheck==1){
 session.setAttribute("id", id);
 %>
 <script type="text/javascript">
 alert("로그인에 성공하였습니다 :)"); // 로그인 성공
 location.href="customerMain.jsp";
 </script>
 <%
} else if(check==1 && roleCheck==0){
	 session.setAttribute("id", id);
	 %>
	 <script type="text/javascript">
	 alert("로그인에 성공하였습니다 :)"); // 로그인 성공
	 location.href="restaurantMain.jsp";
	 </script>
	 <%
}else{
 %><script type="text/javascript">
 alert("아이디와 비밀번호를 다시 확인해주세요 :(");
 history.back();
 </script>
 <%
}
%>

</body>
</html>