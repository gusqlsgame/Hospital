<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="board.LogonDataBean"%>
<%@ page import="board.LogonDBBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ����</title>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		String passwd = request.getParameter("passwd");

		LogonDBBean manager = LogonDBBean.getInstance();
		//���̵�� ��й�ȣ�� �ش��ϴ� ������� ������ ��
		LogonDataBean m = manager.getMember(id, passwd);
		int check = manager.userCheck(id, passwd);

		try {//�� ����� ������ ȭ�鿡 ǥ��

			if (check == 1) {
	%>
	<center>
		<form name="regFrm" method="post" action="modifyPro.jsp">
			<table border=1>
				<tr>
					<td colspan="2" align=center><b><font size=5> ȸ������
								���������� </font></b></td>
				</tr>
				<tr>
					<td>���̵�</td>
					<td><input id="id" name="id" type="text" size="20"
						maxlength="50" value="<%=id%>"></td>
				<tr>
					<td>��й�ȣ</td>
					<td><input id="passwd" name="passwd" type="password" size="20"
						maxlength="16"></td>
				</tr>
				<tr>
					<td>�̸�</td>
					<td><input id="name" name="name" type="text" size="20"
						maxlength="10" value="<%=m.getName()%>"></td>
				</tr>
				<tr>
					<td>�ּ�</td>
					<td><input id="address" name="address" type="text" size="30"
						maxlength="50" value="<%=m.getAddress()%>"></td>
				</tr>
				<tr>
					<td>��ȭ��ȣ</td>
					<td><input id="tel" name="tel" type="text" size="20"
						maxlength="20" value="<%=m.getTel()%>"></td>
				</tr>
				<tr>
					<td colspan="2" align=center><input type="submit" value="����">
						<input type="button" onclick="javascript:location.href='main.jsp'"
						value="���"></td>
				</tr>
			</table>
		</form>
	</center>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("��й�ȣ�� üũ���ּ���");
		history.back();
	</script>

	<%
		}
		} catch (Exception e) {
		}
	%>
</body>
</html>