<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="board.LogonDBBean"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	//id�� ����ڰ� ȸ�������� �ϱ����ؼ� �Է��� ���̵�
	String id = request.getParameter("id");
	//DBó������ LogonDBBeanŬ������ ��ü�� ����.
	LogonDBBean manager = LogonDBBean.getInstance();
	//����ڰ� �Է��� id���� ������ LogonDBBeanŬ������ confirm()�޼ҵ� ȣ��
	//�ߺ����̵� üũ confirm()�޼ҵ��� �������� check���� 1�Ǵ� -1���� ���� ��
	int check = manager.confirm(id);
	if (check == 1) {
		out.println(id + "�� �̹� �����ϴ� ID�Դϴ�.<p>");
	} 
	else if(check == -1 && id !=null) {
		out.println(id + "�� ��� ���� �մϴ�.<p>");
	}
	else
		out.println("���̵� �Է��ϼ���.<p>");
%>
<a href="#" onClick="self.close()">�ݱ�</a>