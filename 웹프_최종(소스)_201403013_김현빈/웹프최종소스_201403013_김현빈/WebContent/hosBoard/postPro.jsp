<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="HDB" class="board.HospitalDB" />
<%
	HDB.insertBoard(request);

	response.sendRedirect("../main.jsp?pagefile=./hosBoard/list");
%>