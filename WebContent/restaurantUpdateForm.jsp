<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="pknu.it.RestaurantDataBean"%>
<%@ page import="pknu.it.RestaurantDBBean"%>
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
	RestaurantDBBean dbPro = new RestaurantDBBean();
	//�ڹٺ� member=getMember(id)�޼��� ȣ��
	RestaurantDataBean restaurant = dbPro.getRestaurant(id);
	%>
	<div id="wrap"><br><br><br><br>
		<font size="5" color="gray">ȸ������Ȯ�� �� ����</font> <br> <br>
		<form action="restaurantUpdatePro.jsp" method="post">
			<table>
				<tr>
					<td id="title">���̵�</td>
					<td><%=restaurant.getId()%> <input type=hidden name="id"
						value="<%=restaurant.getId()%>"><br></td>
				</tr>
				<tr>
					<td id="title">��й�ȣ</td>
					<td><input type="password" name="pwd"><br></td>
				</tr>
				<tr>
					<td id="title">�г���</td>
					<td><input type="text" name="name"
						value="<%=restaurant.getName()%>"><br></td>
				</tr>
				<tr>
					<td id="title">���θ��ּ�</td>
					<td><input type="text" name="addr"
						value="<%=restaurant.getAddress()%>"><br></td>
				</tr>
				<tr>
					<td id="title">��ȭ��ȣ</td>
					<td><input type="text" name="tel"
						value="<%=restaurant.getTel()%>"><br></td>
				</tr>
				<tr>
					<td id="title">�Ĵ籸��</td>
					<td><input type="radio" name="rclass" value="korea-food" checked>�ѽ� 
					    <input type="radio" name="rclass" value="japan-food" checked>�Ͻ� 
					    <input type="radio" name="rclass" value="china-food" checked>�߽� <br> 
					    <input type="radio" name="rclass" value="usa-food" checked>��� 
					    <input type="radio" name="rclass" value="school-food" checked>�н�
						<input type="radio" name="rclass" value="fast-food" checked>�н�ƮǪ��<br></td>
				</tr>
				<tr>
					<td id="title">�¼���</td>
					<td><input type="number" name="table"
						value="<%=restaurant.getTable()%>"><br></td>
				</tr>
				</table>
				<br>
				<input type="submit" class="button" value="��������">&nbsp;&nbsp;
				<input type="button" class="button" value="�α׾ƿ�" onclick="location.href='logout.jsp'">
				</form>
				</div>
</body>
</html>