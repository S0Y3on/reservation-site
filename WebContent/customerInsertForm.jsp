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
<title>��ȸ������</title>
</head>
<body style="background-color: #E6E6FA">
	<div id="wrap">
		<br><br><br><br><br><br>
		<font size="5" color="gray">��ȸ������</font>
		<form action="customerInsertPro.jsp" method="post">
			<table>
				<tr>
					<td id="title">���̵�</td>
					<td><input type="text" name="id" maxlength="20"></td>
				</tr>
				<tr>
					<td id="title">��й�ȣ</td>
					<td><input type="text" name="pwd" maxlength="20"><br></td>
				</tr>
				<tr>
				
					<td id="title">�г���</td>
					<td><input type="text" name="name" maxlength="20"><br></td>
				</tr>
				<tr>
					<td id="title">��ȭ��ȣ</td>
					<td><input type="text" name="tel" maxlength="20"><br></td>
				</tr>
				<br>

			</table>
			<br>
			<input type="submit" class="button" value="�Ϸ�">
		</form>
	</div>
</body>
</html>