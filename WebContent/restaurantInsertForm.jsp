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
	border-radius: 10px;
}
</style>
<meta charset="EUC-KR">
<title>�Ĵ�ȸ������</title>
</head>
<div id="wrap">
	<br> <br> <br> <br> <br> <br> 
	<font size="5" color="gray">�Ĵ�ȸ������</font> <br><br>
	<body style="background-color: #E6E6FA">
		<form action="restaurantInsertPro.jsp" method="post">
			<table>
				<tr>
					<td id="title">���̵�</td>
					<td><input type="text" name="id" maxlength="20"><br></td>
				</tr>
				<tr>
					<td id="title">��й�ȣ</td>
					<td><input type="text" name="pwd" maxlength="20"><br></td>
				</tr>
				<tr>
					<td id="title">�Ĵ��̸�</td>
					<td><input type="text" name="name" maxlength="20"><br></td>
				</tr>
				<tr>
					<td id="title">���θ��ּ�</td>
					<td><input type="text" name="address" maxlength="20"><br></td>
				</tr>
				<tr>
					<td id="title">��ȭ��ȣ</td>
					<td><input type="text" name="tel" maxlength="20"><br></td>
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
					<td><input type="number" name="table" maxlength="20"><br></td>
				</tr>
			</table>
			<br><input type="submit" class="button" value="����"> <br>
		</form>
</div>
</body>
</html>