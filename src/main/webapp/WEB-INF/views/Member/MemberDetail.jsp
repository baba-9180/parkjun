<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>박준</title>
</head>
<body>
	<h2>회원 상세 정보</h2>

	<table border="1">
		<tr>
			<td>회원번호</td>
			<td>${member.m_no}</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>${member.m_id}</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>${member.m_name}</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>${member.m_sex}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${member.m_email}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${member.m_tel}</td>
		</tr>
		<tr>
			<td>가입일</td>
			<td><fmt:formatDate value="${member.m_date}" pattern="yyyy년 M월 d일 HH시 mm분"/></td>
		</tr>
		<tr>
			<td>권한</td>
			<td>${member.m_role}</td>
		</tr>
	</table>
	
	<br>
	<br>
	<br>
	<a href="/Member/MemberUpdateForm?m_no=${member.m_no}">
		<button>회원 수정</button>
	</a>
	
	<a href="/Member/MemberDelete?m_no=${member.m_no}" onclick="return confirm('정말 삭제하시겠습니까?');">
		<button>회원 삭제</button>
	</a>
	
	<a href="/">
	<button>메인으로</button>
	</a>
</body>
</html>