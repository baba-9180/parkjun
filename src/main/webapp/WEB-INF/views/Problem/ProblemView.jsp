<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제 상세</title>
</head>
<body>
	
	<h2>문제 상세</h2>
	
	<table border="1">
	    <tr>
	        <th>문제번호</th>
	        <td>${problem.p_no}</td>
	    </tr>
	
	    <tr>
	        <th>제목</th>
	        <td>${problem.p_title}</td>
	    </tr>
	
	    <tr>
	        <th>내용</th>
	        <td>${problem.p_content}</td>
	    </tr>
	
	    <tr>
	        <th>난이도</th>
	        <td>${problem.p_level}</td>
	    </tr>
	
	    <tr>
	        <th>제한시간</th>
	        <td>${problem.p_time} 분</td>
	    </tr>
	
	    <tr>
	        <th>등록일</th>
	        <td>${problem.p_date}</td>
	    </tr>
	</table>
	<a href="<c:url value='/Problem/ProblemUpdateForm?p_no=${problem.p_no}'/>">문제 수정</a>
	<a href="<c:url value='/Problem/ProblemDelete?p_no=${problem.p_no}'/>">문제 삭제</a>
	<a href="<c:url value='/Problem/ProblemList'/>">목록</a>
	<a href="<c:url value='/Testcase/List?p_no=${problem.p_no}'/>">
	    테스트케이스 관리
	</a>
	<h3>코드 제출</h3>
	<form method="post" action="/Submission/Submit">	
		<input type="hidden" name="p_no" value="${problem.p_no}">
		언어
		<select name="language">
			<option value="java">Java</option>
			<option value="python">Python</option>
		</select>
		코드
		<textarea name="code"></textarea>
		<input type="submit" value="제출">
	</form>

</body>
</html>