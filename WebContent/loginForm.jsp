<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="pknu.it.CustomerDBBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���</title>
<style>

#wrap {
	margin-left: auto;
	magin-right: auto;
	text-align: center;
}

table {
	margin-left: auto;
	margin-right: auto;

}
.button {
	background-color:#FFC0CB;
	border:none;
	color: white;
	padding: 30px, 60px;
	font-size: 20px;
	text-align: center;
	border-radius: 5px;
}
</style>
</head>

<body style="background-color:#E6E6FA">
<% 
	String id;
	if (session.getAttribute("id") != null) {
	id = "���ǰ� ����";
	} else {
	id = "���ǰ� ����";
	}
%>

	 
	<div id="wrap">
		<br><br><br><br><br><br> <br> <b><font size="6" color="gray">ȯ���մϴ� :) </font></b> <br>
		<font size="4" color="gray">�Ĵ� ���� ���񽺸� ���� �α����� �ʿ��մϴ�.</font>
		<br> <br>
		<form action="loginPro.jsp" method="post">
			<table>
				<tr>
					<td id="title">���̵�</td>
					<td><input type="text" name="id" maxlength="20"><br></td>
				</tr>
				<tr>
					<td id="title">��й�ȣ</td>
					<td><input type="text" name="passwd" maxlength="20"><br></td>
				</tr>
			</table>
			
			<br> <input type="submit" class="button" value="�α���" >
				 <input type="button" class="button" value="ȸ������"
				onclick="location.href='customer-restaurantChoose.jsp'"> <br>
		</form>
	</div>

</body>
</html>