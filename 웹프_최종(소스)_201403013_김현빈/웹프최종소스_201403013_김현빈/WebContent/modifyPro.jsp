<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="board.LogonDBBean"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%-- 7~9����: ������ ������ ������ �����������ü�� ����--%>
<jsp:useBean id="member" class="board.LogonDataBean">
<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<%
	LogonDBBean manager = LogonDBBean.getInstance();
	//ȸ������ ���� ó�� �޼ҵ� ȣ�� �� ���� ��Ȳ�� ��ȯ
	int check = manager.updateMember(member);
%>
<script type="text/javascript">
	alert("������ ���� �Ͽ����ϴ�.");
	location.href = "main.jsp";
</script>
