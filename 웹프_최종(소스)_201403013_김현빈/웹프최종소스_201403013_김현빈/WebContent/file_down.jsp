<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>
<%
	String fileName = request.getParameter("file_name");
	String savePath = "upload";
	ServletContext context = getServletContext();
	String sDownloadPath = context.getRealPath(savePath);
	String sFilePath = sDownloadPath + "\\" + fileName;
	byte b[] = new byte[4096];
	File oFile = new File(sFilePath);
	FileInputStream in = new FileInputStream(sFilePath);
	String sMimeType = getServletContext().getMimeType(sFilePath);
	System.out.println("sMimeType>>" + sMimeType);
	//octet-steam�� 8��Ʈ�� �� �Ϸ��� �����͸� ���մϴ�. �������� ���� ���� ������ �ǹ�
	if (sMimeType == null)
		sMimeType = "application/octet-stream";
	response.setContentType(sMimeType);
	// �ѱ� ���ε� (�� �κ��� �ѱ� ���ϸ��� ������ ���� ������ �ݴϴ�.)
	String sEncoding = new String(fileName.getBytes("euc-kr"), "8859_1");
	//�̺κ��� ��� ���� ��ũ�� Ŭ������ �� �ٿ�ε� ȭ���� ��µǰ� ó���ϴ� �κ��Դϴ�.
	ServletOutputStream out2 = response.getOutputStream();
	int numRead;
	//����Ʈ �迭 b�� 0������ numRead�� ���� �������� ���
	while ((numRead = in.read(b, 0, b.length)) != -1) {
		out2.write(b, 0, numRead);
	}
	out2.flush();
	out2.close();
	in.close();
%>