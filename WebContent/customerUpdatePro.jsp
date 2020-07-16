<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="pknu.it.CustomerDataBean" %>
<%@ page import="pknu.it.CustomerDBBean" %>
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
//액션태그 자바빈 객체생성 member
//액션태그 폼 => 자바빈 저장
%>
<jsp:useBean id="customer" class="pknu.it.CustomerDataBean"/>
<jsp:setProperty property="*" name="customer"/>
<%
//디비객체생성 dbPro
CustomerDBBean dbPro=new CustomerDBBean();
//int check =수정메서드호출 updateMember(member)
int check=dbPro.updateCustomer(customer);
System.out.println("수정확인");
System.out.println(check);
//check==1 수정완료 main.jsp 이동
//check==0 비밀번호 틀림 뒤로이동
if(check==1){
 %>
 <script type="text/javascript">
 alert("수정완료");
 location.href="customerMain.jsp";
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