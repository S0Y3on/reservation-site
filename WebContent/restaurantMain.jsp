<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style>
#wrap {
	margin-left: auto;
	magin-right: auto;
	text-align: center;
}

.button {
	background-color: #FFC0CB;
	border: none;
	color: white;
	padding: 30px, 60px;
	font-size: 20px;
	text-align: center;
	border-radius: 10px;
}
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body style="background-color: #E6E6FA">
<%
//���ǰ� ��������
String id=(String)session.getAttribute("id");
//���ǰ��� ������ loginForm.jsp�̵�
if(id==null){
 response.sendRedirect("loginForm.jsp");
}
%>
<div id="wrap">
<%=id %>���� �α����ϼ̽��ϴ�.<br>


<input type="button" class="button" value="�α׾ƿ�" onclick="location.href='logout.jsp'"> <br>
<input type="button" class="button" value="ȸ������������Ȯ��" onclick="location.href='restaurantUpdateForm.jsp'"><br>
<input type="button" class="button" value="�޴�����" onclick="location.href='menuManage.jsp'">
<input type="button" class="button" value="�������" onclick="location.href='reservation_res.jsp'">
�� �Ĵ��̴�!!! �������� !!!!
</div>
</body>
</html>