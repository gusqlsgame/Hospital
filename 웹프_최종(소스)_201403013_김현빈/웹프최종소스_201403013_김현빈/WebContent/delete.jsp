<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원탈퇴하기</title>
</head>
<body>
	<center>
		<table border=1>
			<form name="regFrm" method="post" action="deletePro.jsp">
				<tr>
					<td colspan="2" align=center><b><font size=5> 회원탈퇴
						</font></b></td>
				</tr>
				<tr>
				<td>비밀번호</td>
			<td><input id="passwd" name="passwd" type="password" size="20"
				placeholder="6~16자 숫자/문자" maxlength="16"></td>
			</tr>
			<tr>
				<td colspan="2" align=center><input type="submit" value="탈퇴"></td>
			</tr>
			<tr>
				<td colspan="2" align=center><input type="button"
					onClick="javascript:location.href='main.jsp'" value="취소"></td>
			</tr>
		</table>
		</form>
	</center>
</body>
</html>