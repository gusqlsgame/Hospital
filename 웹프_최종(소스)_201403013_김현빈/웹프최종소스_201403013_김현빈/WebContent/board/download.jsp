<%@ page contentType="application;charset=euc-kr"%>
<%@page import="board.BoardBean"%>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
<%
	bMgr.downLoad(request, response, out, pageContext);
%>