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
//���ü���� dbPro
RestaurantDBBean dbPro=new RestaurantDBBean();
System.out.println("���Ἲ��!!!!!!");
//int check =�����޼���ȣ�� updateMember(member)
int check=dbPro.updateRestaurant(restaurant);
System.out.println(check);
//check==1 �����Ϸ� main.jsp �̵�
//check==0 ��й�ȣ Ʋ�� �ڷ��̵�
if(check==1){
 %>
 <script type="text/javascript">
 alert("�����Ϸ�");
 location.href="restaurantMain.jsp";
 </script>
 <%
}else{
 %>
 <script type="text/javascript">
 alert("��й�ȣƲ��");
 history.back();
 </script>
 <%
}
%>


</body>
</html>