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
//�ѱ�ó��
request.setCharacterEncoding("utf-8");
//��Ű�� member �����̸� MemberDataBean
//������� id passwd name reg_date

//�׼��±� useBean �̵� ��ü ���� member
//�׼��±� setProperty ��=>�ڹٺ�����
%>
<jsp:useBean id="restaurant" class="pknu.it.RestaurantDataBean"/>
<jsp:setProperty property="*" name="restaurant" />
���̵�:<jsp:getProperty property="id" name="restaurant"/><br>
�н�����:<jsp:getProperty property="pwd" name="restaurant"/><br>
�Ĵ��̸�:<jsp:getProperty property="name" name="restaurant"/><br>
��ȭ��ȣ:<jsp:getProperty property="tel" name="restaurant"/><br>
�ּ�:<jsp:getProperty property="address" name="restaurant"/><br>
�Ĵ籸��:<%=restaurant.getRclass() %><br>
�¼���:<jsp:getProperty property="table" name="restaurant"/><br>
<%
//����۾� ��Ű�� member �����̸� MemberDBBean
//��ü���� dbPro
String id = restaurant.getId();
RestaurantDBBean dbPro = new RestaurantDBBean();
int idCheck = dbPro.idCheck(id); //idCheck==0 �����ϴ� ���̵�, ==1 ���� ���̵�
System.out.println(idCheck);
//�޼��� insertMember(member)
if(restaurant.getId()==null || restaurant.getPwd()==null || restaurant.getName()==null || restaurant.getTel()==null
||restaurant.getAddress()==null || restaurant.getTable()<=0 || restaurant.getRclass()==null ){
	%><script type="text/javascript">alert("��� �׸��� �Է����ּ���."); location.href="restaurantInsertForm.jsp";</script>
<% } else{
if(idCheck==0){
	%><script type="text/javascript">
	alert("�̹� �����ϴ� ���̵��Դϴ�.");
	location.href="restaurantInsertForm.jsp";
	</script><%
} else if(idCheck==1){
dbPro.insertRestaurant(restaurant);
//�̵� ȸ�����Լ��� loginForm.jsp
%><script type="text/javascript">
 alert("ȸ������ ����!!");
 location.href="loginForm.jsp";
 </script><%}
}
%>

</body>
</html>