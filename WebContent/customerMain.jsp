<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
//���ǰ� ��������
String id=(String)session.getAttribute("id");
//���ǰ��� ������ loginForm.jsp�̵�
if(id==null){
 response.sendRedirect("loginForm.jsp");
}
%>
<%=id %>���� �α����ϼ̽��ϴ�.<br>
<a href="logout.jsp">�α׾ƿ�</a><br>
<a href="customerUpdateForm.jsp">ȸ������������Ȯ��</a><br>
<input type="button" value="�����ϱ�" onclick="location.href='reservation.jsp'">
�� �մ��̴�!!! �����Ҳ��� !!!!
</body>
</html>