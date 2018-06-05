<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>


<script language=JavaScript type="text/javascript" src="scipt.js" charset="utf-8"></script>



<script language=JavaScript type="text/javascript" charset="utf-8">
	function idCheck(id) {
		frm = document.regFrm;
		if (id == "") {
			alert("아이디를 입력해 주세요.");
			frm.id.focus();
			return;
		}
		url = "confirm.jsp?id=" + id;
		window.open(url, "IDCheck", "width=300,height=150");
	}
</script>
</head>
<body>
	<center>
		<form name="regFrm" method="post" action="registerPro.jsp">
			<table border=1>
				<tr>
					<td colspan="2" align=center><b>
					<font size=5> 회원가입페이지</font></b></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input id="id" name="id" type="text" size="20" maxlength="50" placeholder="ID입력해주세요" autofocus> 
					<input type="button" value="ID중복확인" onClick="idCheck(this.form.id.value)"></td>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input id="passwd" name="passwd" type="password" size="20"
						placeholder="6~16자 숫자/문자" maxlength="16"></td>
				</tr>
				<tr>
					<td>비밀번호 재입력</td>
					<td><input id="repass" name="repass" type="password" size="20"
						placeholder="비밀번호재입력" maxlength="16"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input id="name" name="name" type="text" size="20"
						placeholder="홍길동" maxlength="10"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input id="address" name="address" type="text" size="30"
						placeholder="주소 입력" maxlength="50"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input id="tel" name="tel" type="text" size="20"
						placeholder="전화번호 입력" maxlength="20"></td>
				</tr>
				<tr>
					<td colspan="2" align=center>
						<input type="button" value="가입하기" onClick="inputCheck()">
						<input type="button" value="되돌아가기" onClick="history.back();">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>