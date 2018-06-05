<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="board.LogonDBBean"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	//id는 사용자가 회원가입을 하기위해서 입력한 아이디
	String id = request.getParameter("id");
	//DB처리빈인 LogonDBBean클래스의 객체를 얻어낸다.
	LogonDBBean manager = LogonDBBean.getInstance();
	//사용자가 입력한 id값을 가지고 LogonDBBean클래스의 confirm()메소드 호출
	//중복아이디 체크 confirm()메소드의 실행결과로 check에는 1또는 -1값이 리턴 됨
	int check = manager.confirm(id);
	if (check == 1) {
		out.println(id + "는 이미 존재하는 ID입니다.<p>");
	} 
	else if(check == -1 && id !=null) {
		out.println(id + "는 사용 가능 합니다.<p>");
	}
	else
		out.println("아이디를 입력하세요.<p>");
%>
<a href="#" onClick="self.close()">닫기</a>