<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
<jsp:useBean id="bean" class="board.BoardBean" scope="session" />
<jsp:useBean id="upBean" class="board.BoardBean" />
<jsp:setProperty property="*" name="upBean" />
<%
	String nowPage = request.getParameter("nowPage");	
		String url = "../main.jsp?pagefile=./board/read&nowPage=" + nowPage + "&idx=" + upBean.getIdx();
		response.sendRedirect(url);
%>
