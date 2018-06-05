<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="board.LogonDBBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>정보 수정하기</title>
<script type="text/javascript">
	function m_sub() {
		if (document.regFrm.passwd.value == "" ) {
			alert("비밀번호를 입력해 주세요.");
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
								회원정보수정 </font></b></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input id="passwd" name="passwd" type="password" size="20"
						placeholder="6~16자 숫자/문자" maxlength="16"></td>
				</tr>
				<tr>
					<td colspan="2" align=center>
					<input type="button" onClick="m_sub()" value="수정">
				</tr>
			</table>
	</center>
	</form>
</body>
</html>