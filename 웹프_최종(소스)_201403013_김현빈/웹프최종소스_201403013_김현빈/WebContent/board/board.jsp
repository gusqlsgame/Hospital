<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판</title>
<link rel="stylesheet" href="../css/style.css" type="text/css" />
</head>
<body>

	<!-- CONTENT -->
	<h3>게시판</h3>
	<table>
		<colgroup>
			<col width="10%" />
			<col width="60%" />
			<col width="15%" />
			<col width="15%" />
		</colgroup>
		<tr>
			<th scope="col">글번호</th>
			<th scope="col">글제목</th>
			<th scope="col">글쓴이</th>
			<th scope="col">날짜</th>
		</tr>
		<tr>
			<td>1</td>
			<td>안녕하세요.</td>
			<td>test</td>
			<td>2017-11-02</td>
		</tr>
		<tr>
			<td>2</td>
			<td>안녕하세요.</td>
			<td>test</td>
			<td>2017-11-02</td>
		</tr>
		<tr>
			<td>3</td>
			<td>안녕하세요.</td>
			<td>test</td>
			<td>2017-11-02</td>
		</tr>
		<tr>
			<td>4</td>
			<td>안녕하세요.</td>
			<td>test</td>
			<td>2017-11-02</td>
		</tr>
		<tr>
			<td>5</td>
			<td>안녕하세요.</td>
			<td>test</td>
			<td>2017-11-02</td>
		</tr>
		<tr>
			<td>6</td>
			<td>안녕하세요.</td>
			<td>test</td>
			<td>2017-11-02</td>
		</tr>
		<tr>
			<td>7</td>
			<td>안녕하세요.</td>
			<td>test</td>
			<td>2017-11-02</td>
		</tr>
		<tr>
			<td>8</td>
			<td>안녕하세요.</td>
			<td>test</td>
			<td>2017-11-02</td>
		</tr>
		<tr>
			<td>9</td>
			<td>안녕하세요.</td>
			<td>test</td>
			<td>2017-11-02</td>
		</tr>
		<tr>
			<td>10</td>
			<td>안녕하세요.</td>
			<td>test</td>
			<td>2017-11-02</td>
		</tr>
	</table>
	<div class="paging">
		<ol>
			<li>[이전]</li>
			<li><strong>1</strong></li>
			<li>2</li>
			<li>3</li>
			<li>4</li>
			<li>5</li>
			<li>6</li>
			<li>7</li>
			<li>8</li>
			<li>9</li>
			<li>10</li>
			<li>[다음]</li>
		</ol>
	</div>
	<div class="boardSearch">
		<select id="select">
			<option value="" selected="selected">제목</option>
			<option value="">날짜</option>
		</select> <input type="text" id="txt" /> <input type="button" value="검색" />
	</div>

</body>
</html>