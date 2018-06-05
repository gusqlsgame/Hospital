<%@ page language="java" contentType="text/html;
charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String tel = request.getParameter("tel");
	Timestamp register = new Timestamp(System.currentTimeMillis());
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement("INSERT INTO member VALUES (null,?,?,?,?,?,?)");
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		pstmt.setTimestamp(3, register);
		pstmt.setString(4, name);
		pstmt.setString(5, address);
		pstmt.setString(6, tel);
		int result = pstmt.executeUpdate();
		if (result != 0) {
			out.println("<script>");
			out.println("location.href='loginForm.jsp'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("location.href='joinForm.jsp'");
			out.println("</script>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>