<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
	String id = "";
	try {
		id = (String) session.getAttribute("id");
		if (id == null || id.equals("")) {
%>
<html>
<head>
<title>회원관리 시스템 로그인 페이지</title>
</head>
<body>
	<form name="loginform" action="loginPro.jsp" method="post">
		<center>
			<table border=1>
				<tr>
					<td colspan="2" align=center><b><font size=5>로그인 페이지</font></b></td>
				</tr>
				<tr>
					<td>아이디 :</td>
					<td><input type="text" name="id" /></td>
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td><input type="password" name="pass" /></td>
				</tr>
				<tr>
					<td colspan="2" align=center><a
						href="javascript:loginform.submit()">로그인</a>&nbsp;&nbsp; <a
						href="joinForm.jsp">회원가입</a></td>
				</tr>
			</table>
		</center>
	</form>
	<%
		} else {
	%>
	<b><%=id%></b>님이 로그인 하셨습니다.
	<form method="post" action="logout.jsp">
		<input type="submit" value="로그아웃">
	</form>
	<%
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>