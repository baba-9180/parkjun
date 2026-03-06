<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>박준</title>
</head>
<body>

	메인페이지 입니다.
	
	<c:choose>
	    <c:when test="${not empty sessionScope.loginUser}">
	        ${sessionScope.loginUser.m_name}님 환영합니다.
	        <a href="<c:url value='/Member/Logout'/>">로그아웃</a>
	        <a href="<c:url value='/Member/MemberDetail'/>">내 정보 보기</a>
	    </c:when>
	    <c:otherwise>
	        <a href="<c:url value='/Member/MemberLoginForm'/>">로그인</a>
	        <a href="<c:url value='/Member/MemberWriteForm'/>">회원가입</a>
	    </c:otherwise>
	</c:choose>
	<a href="/Problem/ProblemList">문제리스트</a>
</body>
</html>