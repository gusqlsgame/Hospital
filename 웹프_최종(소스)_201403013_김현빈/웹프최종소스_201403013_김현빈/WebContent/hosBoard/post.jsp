<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�۾���</title>
<script>
	function postcheck() {
		if (document.postFrm.title.value == "") {
			alert("������ �Է��� �ּ���.");
			document.postFrm.title.focus();
			return;
		}
		else if(document.postFrm.title.value[0] == ' '){
			alert("������ �������� ������ �� �����ϴ�.");
			document.postFrm.title.focus();
			return;
		}
		
		if (document.postFrm.content.value == "") {
			alert("������ �Է��� �ּ���.");
			document.postFrm.content.focus();
			return;
		}
		document.postFrm.submit();
	}
</script>
</head>
<body>
	<%
		String name = null;
		String pass = null;
		if (session.getAttribute("id") != null) {
			name = (String) session.getAttribute("id");
		}
		if (session.getAttribute("pass") != null) {
			pass = (String) session.getAttribute("pass");
		}
	%>
	<!-- CONTENT -->
	<h3>�Խ��� �۾���</h3>
	<form name="postFrm" method="post" action="./hosBoard/postPro.jsp"
		enctype="multipart/form-data">
		<table border="0" width="100%" align="center">
			<tr>
				<td width="20%">�� ��</td>
				<td width="80%"><input type="text" name="title" size="50"
					maxlength="30"></td>
			</tr>
			<tr>
				<td width="20%">�� ��</td>
				<td width="80%"><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td width="20%">����ã��</td>
				<td width="80%"><input type="file" name="filename" size="50"
					maxlength="50"></td>
			</tr>
			<tr>
				<td>����Ÿ��</td>
				<td>HTML<input type=radio name="contentType" value="HTTP">&nbsp;&nbsp;&nbsp;
					TEXT<input type=radio name="contentType" value="TEXT" checked>
				</td>
			</tr>

			<tr>
				<input type="hidden" name="name" size="50" maxlength="30"
					value="<%=name%>">
				<input type="hidden" name="pass" size="50" maxlength="30"
					value="<%=pass%>">
				</td>
			</tr>

			<tr>
				<td colspan="2"><hr /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="���"
					onClick="postcheck()"> <input type="reset" value="�ٽþ���">
					<input type="button" value="����Ʈ"
					onClick="javascript:location.href='main.jsp?pagefile=./hosBoard/list'"></td>
			</tr>
		</table>
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
		<!-- request.getRemoteAddr()�� ���� ip ��ȯ -->
	</form>
</body>
</html>