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
//�ѱ�ó��
request.setCharacterEncoding("utf-8");
//�׼��±� �ڹٺ� ��ü���� member
//�׼��±� �� => �ڹٺ� ����
%>
<jsp:useBean id="customer" class="pknu.it.CustomerDataBean"/>
<jsp:setProperty property="*" name="customer"/>
<%
//���ü���� dbPro
CustomerDBBean dbPro=new CustomerDBBean();
//int check =�����޼���ȣ�� updateMember(member)
int check=dbPro.updateCustomer(customer);
System.out.println("����Ȯ��");
System.out.println(check);
//check==1 �����Ϸ� main.jsp �̵�
//check==0 ��й�ȣ Ʋ�� �ڷ��̵�
if(check==1){
 %>
 <script type="text/javascript">
 alert("�����Ϸ�");
 location.href="customerMain.jsp";
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