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
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="customer" class="pknu.it.CustomerDataBean"/>
<jsp:setProperty property="*" name="customer" />
���̵�:<jsp:getProperty property="id" name="customer"/><br>
�н�����:<jsp:getProperty property="pwd" name="customer"/><br>
�г���:<jsp:getProperty property="name" name="customer"/><br>
��ȭ��ȣ:<jsp:getProperty property="tel" name="customer"/><br>
<% 
CustomerDBBean dbPro = new CustomerDBBean();

String id = customer.getId();
int idCheck = dbPro.idCheck(id); //idCheck==0 �����ϴ� ���̵�, ==1 ���� ���̵�

if(customer.getId()==null || customer.getPwd()==null || customer.getName()==null || customer.getTel()==null){
	%><script type="text/javascript">alert("��� �׸��� �Է����ּ���."); location.href="customerInsertForm.jsp";</script>
<% } else{
	if(idCheck==0){
		%><script type="text/javascript">
		alert("�̹� �����ϴ� ���̵��Դϴ�.");
		location.href="customerInsertForm.jsp";
		</script><%
	} else if(idCheck==1){
			dbPro.insertCustomer(customer);
			%><script type="text/javascript">
	 		alert("ȸ������ �Ǿ����ϴ�.");
	 		location.href="loginForm.jsp";
	 		</script><%
		} 
} %>


</body>
</html>