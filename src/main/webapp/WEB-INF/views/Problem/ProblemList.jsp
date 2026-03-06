<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제 목록</title>
</head>
<body>

	<h2>문제 목록</h2>
	
	<table border="1">
		<tr>
		    <th>번호</th>
		    <th>제목</th>
		    <th>난이도</th>
		    <th>제한시간</th>
		</tr>
		
		<c:forEach var="problem" items="${list}">
			<tr>
				<td>${problem.p_no}</td>
				<td>
					<a href="/Problem/ProblemView?p_no=${problem.p_no}">
					${problem.p_title}
					</a>
				</td>
				
				<td>${problem.p_level}</td>
				
				<td>${problem.p_time}분</td>
				
			</tr>
		</c:forEach>
		
	</table>
	<a href = "/Problem/ProblemWriteForm">문제 작성</a>
</body>
</html>