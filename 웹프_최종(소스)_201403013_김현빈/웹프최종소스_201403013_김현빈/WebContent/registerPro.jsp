<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="board.LogonDBBean"%>
<%@ page import="java.sql.Timestamp"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="member" class="board.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<%
	//������ ���� �Ѿ���� �ʴ� �������� ���Գ�¥�� ���� ����������� ����
	member.setReg_date(new Timestamp(System.currentTimeMillis()));
	LogonDBBean manager = LogonDBBean.getInstance();
	//����ڰ� �Է��� ����������� ��ü�� ������ ȸ������ ó�� �޼ҵ�ȣ��
	int result = manager.insertMember(member);
	if (result == 1) {
%>
<script type="text/javascript">
	alert("ȸ�������� �Ͽ����ϴ�.");
	location.href = "loginForm.jsp";
</script>
<%
	} else if (result == 2) {
%>
<script type="text/javascript">
	alert("ID�� üũ���ּ���");
	history.back();
</script>
<%
	}
%>

