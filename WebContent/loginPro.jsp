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
//id passwd ��������
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
System.out.println(id);
System.out.println(passwd);
//����۾� ��ü ���� dbPro
//int check=�޼��� userCheck(id,passwd) 1,0,-1����
CustomerDBBean dbpro = new CustomerDBBean();
int check = dbpro.userCheck(id,passwd);
//check==1 ���ǻ���"id" �̵� main.jsp
//check==0 ��й�ȣƲ�� �ڷ��̵�
//check==-1 ���̵���� �ڷ��̵�
System.out.println(check);
int roleCheck = dbpro.roleCheck(id);
//roleCheck==1 ��
//rolecheck==0 �Ĵ�
System.out.println(roleCheck);
if(check==1 && roleCheck==1){
 session.setAttribute("id", id);
 %>
 <script type="text/javascript">
 alert("�α��ο� �����Ͽ����ϴ� :)"); // �α��� ����
 location.href="customerMain.jsp";
 </script>
 <%
} else if(check==1 && roleCheck==0){
	 session.setAttribute("id", id);
	 %>
	 <script type="text/javascript">
	 alert("�α��ο� �����Ͽ����ϴ� :)"); // �α��� ����
	 location.href="restaurantMain.jsp";
	 </script>
	 <%
}else{
 %><script type="text/javascript">
 alert("���̵�� ��й�ȣ�� �ٽ� Ȯ�����ּ��� :(");
 history.back();
 </script>
 <%
}
%>

</body>
</html>