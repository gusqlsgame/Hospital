<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="board.BoardBean"%>
<jsp:useBean id="bean" class="board.BoardBean" scope="session" />
<%
	String nowPage = request.getParameter("nowPage");
	String title = bean.getTitle();
	String content = bean.getContent();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시물 답글</title>
</head>
<body>
	<!-- CONTENT -->
	<h3>게시판 답변</h3>
	<form name="post" method="post" action="./board/replyPro.jsp">
		<table border="0">
			<tr>
				<td width="20%">제 목</td>
				<td width="80%"><input type="text" name="title" size="50"
					value="답변 : <%=title%>" maxlength="50"></td>
			</tr>
			<tr>
				<td width="20%">내 용</td>
				<td width="80%"><textarea name="content" rows="12" cols="50">
		<%=content%>========답변 글을 쓰세요.=======
</textarea></td>
			</tr>
			<tr>
				<td colspan="2" height="5"><hr /></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="답변등록" onClick="location.href='main.jsp?pagefile=./board/list'"> 
				<input type="reset" value="다시쓰기">
				<input type="button" value="뒤로" onClick="history.back()"></td>
			</tr>
		</table>
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
		<input type="hidden" name="ref" value="<%=bean.getRef()%>"> 
		<input type="hidden" name="pos" value="<%=bean.getPos()%>"> 
		<input type="hidden" name="depth" value="<%=bean.getDepth()%>">
	</form>
</body>
</html>