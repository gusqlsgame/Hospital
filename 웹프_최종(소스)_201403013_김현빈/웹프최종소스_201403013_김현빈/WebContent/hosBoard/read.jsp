<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="board.HospitalDataBean"%>
<jsp:useBean id="HDB" class="board.HospitalDB" />
<%
	request.setCharacterEncoding("EUC-KR");
	int idx = Integer.parseInt(request.getParameter("idx"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	HDB.upCount(idx);//조회수 증가
	HospitalDataBean bean = HDB.getBoard(idx);//게시물 가져오기
	String title = bean.getTitle();
	String reg_date = bean.getReg_date();
	String content = bean.getContent();
	String filename = bean.getFilename();
	int filesize = bean.getFilesize();
	String id = (String) session.getAttribute("id");
	int count = bean.getCount();
	session.setAttribute("bean", bean);//게시물을 세션에 저장
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글보기</title>
</head>
<script type="text/javascript">
	function list() {
		document.listFrm.action = "main.jsp";
		document.listFrm.submit();
	}
	function update(idx) {
		document.updateFrm.idx.value = idx;
		document.updateFrm.pagefile.value = "./hosBoard/update";
		document.updateFrm.action = "main.jsp";
		document.updateFrm.submit();
	}
	function reply(idx) {
		document.replyFrm.idx.value = idx;
		document.replyFrm.pagefile.value = "./hosBoard/reply";
		document.replyFrm.action = "main.jsp";
		document.replyFrm.submit();
	}
	function del(idx) {
		document.delFrm.idx.value = idx;
		document.delFrm.pagefile.value = "./hosBoard/delete";
		document.delFrm.action = "main.jsp";
		document.delFrm.submit();
	}
	function down(filename) {
		document.downFrm.filename.value = filename;
		document.downFrm.submit();
	}
	function loginOk() {
		alert("로그인을 한 후에 시도해주세요.");
		return;
	}
</script>
<body>
	<!-- CONTENT -->
	<h3>글보기</h3>
	<table border="0" cellpadding="3" cellspacing="0" width=100%>
		<tr>
			<td align="center" bgcolor="#DDDDDD" width="10%">이 름</td>
			<td bgcolor="#FFFFE8"><%=id%></td>
			<td align="center" bgcolor="#DDDDDD" width=10%>등록날짜</td>
			<td bgcolor="#FFFFE8"><%=reg_date%></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DDDDDD">제 목</td>
			<td bgcolor="#FFFFE8" colspan="3"><%=title%></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DDDDDD">첨부파일</td>
			<td bgcolor="#FFFFE8" colspan="3">
				<%
					if (filename != null && !filename.equals("")) {
				%> <a href="javascript:down('<%=filename%>')"><%=filename%></a>
				&nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)
			</font> <%
 	} else {
 %> 등록된 파일이 없습니다.<%
 	}
 %>
			</td>
		</tr>
		<tr>
			<td colspan="4"><br /> <pre><%=content%> </pre><br /></td>
		</tr>
	</table>
	<hr />
	<input type="button"
		onClick="location.href = 'http://localhost:8080/Chapter12/main.jsp?pagefile=./hosBoard/list'"
		value="리스트">
	<%
		if (session.getAttribute("id") == null) {
	%>
	<input type="button" onClick="loginOk()" value="수정">
	<%
		} else {
	%><input type="button" onClick="javascript:update('<%=idx%>')"
		value="수정">
	<%
		}
	%>
	<%
		if (session.getAttribute("id") == null) {
	%>
	<input type="button" onClick="loginOk()" value="답변">
	<%
		} else {
	%><input type="button" onClick="javascript:reply('<%=idx%>')"
		value="답변">
	<%
		}
	%>
	<%
		if (session.getAttribute("id") == null) {
	%>
	<input type="button" onClick="loginOk()" value="삭제">
	<%
		} else {
	%><input type="button" onClick="javascript:del('<%=idx%>')" value="삭제">
	<%
		}
	%>
	<br>
	<form name="updateFrm" method="get">
		<input type="hidden" name="pagefile" value="./baord/update"> <input
			type="hidden" name="idx" value="<%=idx%>"> <input
			type="hidden" name="nowPage" value="<%=nowPage%>">
	</form>
	<form name="replyFrm" method="get">
		<input type="hidden" name="pagefile" value="./baord/reply"> <input
			type="hidden" name="idx" value="<%=idx%>"> <input
			type="hidden" name="nowPage" value="<%=nowPage%>">
	</form>
	<form name="delFrm" method="get">
		<input type="hidden" name="pagefile" value="./baord/delete"> <input
			type="hidden" name="idx" value="<%=idx%>"> <input
			type="hidden" name="nowPage" value="<%=nowPage%>">
	</form>
</body>
</html>