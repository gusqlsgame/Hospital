<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="board.LogonDBBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �����ϱ�</title>
<script type="text/javascript">
	function m_sub() {
		if (document.regFrm.passwd.value == "" ) {
			alert("��й�ȣ�� �Է��� �ּ���.");
			document.regFrm.passwd.focus();
			return;
		}
		document.regFrm.submit();
	}
</script>
</head>
<body>
<%
String passwd = request.getParameter("passwd");
%>
	<center>
		<form name="regFrm" method="post" action="modifyForm.jsp">
			<table border=1>
				<tr>
					<td colspan="2" align=center><b><font size=5>
								ȸ���������� </font></b></td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input id="passwd" name="passwd" type="password" size="20"
						placeholder="6~16�� ����/����" maxlength="16"></td>
				</tr>
				<tr>
					<td colspan="2" align=center>
					<input type="button" onClick="m_sub()" value="����">
				</tr>
			</table>
	</center>
	</form>
</body>
</html>