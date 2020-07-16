<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="pknu.it.CustomerDataBean"%>
<%@ page import="pknu.it.CustomerDBBean"%>
<!DOCTYPE html>
<html>
<head>
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
	background-color: #FFC0CB;
	border: none;
	color: white;
	padding: 30px, 60px;
	font-size: 20px;
	text-align: center;
	border-radius: 5px;
}
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body style="background-color: #E6E6FA">
	<%
		//���� �� ��������
	String id = (String) session.getAttribute("id");
	//���ǰ� ������ loginForm.jsp�̵�
	if (id == null) {
		response.sendRedirect("loginForm.jsp");
	}
	//���ü���� dbPro
	CustomerDBBean dbPro = new CustomerDBBean();
	//�ڹٺ� member=getMember(id)�޼��� ȣ��
	CustomerDataBean customer = dbPro.getCustomer(id);
	%>
	<div id="wrap"><br><br><br><br><br><br>
		<font size="5" color="gray">ȸ������Ȯ�� �� ����</font> <br><br>
		<form action="customerUpdatePro.jsp" method="post">
			<table>
				<tr>
					<td id="title">���̵�</td>
					<td><%=customer.getId()%> <input type=hidden name="id" value="<%=customer.getId()%>"><br></td>
				</tr>
				<tr>
					<td id="title">��й�ȣ</td>
					<td><input type="password" name="pwd"><br></td>
				</tr>
				<tr>
					<td id="title">�г���</td>
					<td><input type="text" name="name"
						value="<%=customer.getName()%>"><br></td>
				</tr>
				<tr>
					<td id="title">��ȭ��ȣ</td>
					<td><input type="text" name="tel"
						value="<%=customer.getTel()%>"><br></td>
				</tr>
			</table>
			<br> 
			<input type="submit" class="button" value="ȸ������">&nbsp;&nbsp;
			<input type="button" class="button" value="�α׾ƿ�" onclick="location.href='logout.jsp'">
		</form>
	</div>
</body>
</html>