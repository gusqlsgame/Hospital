<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		String id = (String) session.getAttribute("id");
		request.setCharacterEncoding("euc-kr");
		if (session.getAttribute("id") == null) {
	%><center>
		<h1>
			빈스 병원 홈페이지
			<h1>
	</center>
	<form action="loginForm.jsp" method="post">
		<input type="submit" value=" 로그인 "> 
		<input type="button" value="회원가입" onclick="location.href = 'joinForm.jsp?pagefile=join'">
	</form>
	<%
		} else { //세션이 설정되지 않은 경우
	%>
	<center>
		<h1>
			빈스 병원 홈페이지
			<h1>
	</center>
	<form action="logout.jsp" method="post">
		<%=session.getAttribute("id")%>님 로그인하셨습니다. 
		<input type="submit" value=" 로그아웃 "> 
		<input type="button" value="회원정보수정" onclick="location.href = 'modify.jsp'"> 
		<input type="button" value="회원탈퇴" onclick="location.href = 'delete.jsp'">
		<%
			if (id.equals("admin")) {
		%>
		<input type="button" value="관리자모드 접속(회원 목록 보기)" onclick="location.href='member_list.jsp'">
		<%
			}
		%>
	</form>
	<%
		}
	%>

</body>
</html>