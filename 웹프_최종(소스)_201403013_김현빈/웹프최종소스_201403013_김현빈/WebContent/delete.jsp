<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ��Ż���ϱ�</title>
</head>
<body>
	<center>
		<table border=1>
			<form name="regFrm" method="post" action="deletePro.jsp">
				<tr>
					<td colspan="2" align=center><b><font size=5> ȸ��Ż��
						</font></b></td>
				</tr>
				<tr>
				<td>��й�ȣ</td>
			<td><input id="passwd" name="passwd" type="password" size="20"
				placeholder="6~16�� ����/����" maxlength="16"></td>
			</tr>
			<tr>
				<td colspan="2" align=center><input type="submit" value="Ż��"></td>
			</tr>
			<tr>
				<td colspan="2" align=center><input type="button"
					onClick="javascript:location.href='main.jsp'" value="���"></td>
			</tr>
		</table>
		</form>
	</center>
</body>
</html>