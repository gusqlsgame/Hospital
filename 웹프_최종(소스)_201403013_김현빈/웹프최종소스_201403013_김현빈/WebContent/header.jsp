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
			�� ���� Ȩ������
			<h1>
	</center>
	<form action="loginForm.jsp" method="post">
		<input type="submit" value=" �α��� "> 
		<input type="button" value="ȸ������" onclick="location.href = 'joinForm.jsp?pagefile=join'">
	</form>
	<%
		} else { //������ �������� ���� ���
	%>
	<center>
		<h1>
			�� ���� Ȩ������
			<h1>
	</center>
	<form action="logout.jsp" method="post">
		<%=session.getAttribute("id")%>�� �α����ϼ̽��ϴ�. 
		<input type="submit" value=" �α׾ƿ� "> 
		<input type="button" value="ȸ����������" onclick="location.href = 'modify.jsp'"> 
		<input type="button" value="ȸ��Ż��" onclick="location.href = 'delete.jsp'">
		<%
			if (id.equals("admin")) {
		%>
		<input type="button" value="�����ڸ�� ����(ȸ�� ��� ����)" onclick="location.href='member_list.jsp'">
		<%
			}
		%>
	</form>
	<%
		}
	%>

</body>
</html>