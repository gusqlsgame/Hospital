<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- MENU -->
	<center>
	<input type = "button" value ="홈화면" onclick ="location.href = 'main.jsp'">
	<input type = "button" value ="병원 소개" onclick ="location.href = 'http://localhost:8080/Chapter12/main.jsp?pagefile=./hosBoard/list'">
	<input type = "button" value ="병원 후기 게시판" onclick ="location.href = 'http://localhost:8080/Chapter12/main.jsp?pagefile=./board/list'">
	</center>
	<!-- END MENU -->
</body>
</html>