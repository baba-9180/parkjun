<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>

<h3>회원 정보 수정</h3>

<form name="MemberUpdateForm" method="post" action="/Member/MemberUpdate">

    <table border="1">
        <tr>
            <td>아이디</td>
            <td>
                <input type="text" name="m_id" value="${update.m_id}" >
            </td>
        </tr>

        <tr>
            <td>새 비밀번호</td>
            <td>
                <input type="password" name="m_pw" placeholder="변경 시에만 입력">
            </td>
        </tr>

        <tr>
            <td>닉네임</td>
            <td>
                <input type="text" name="m_name" value="${update.m_name}">
            </td>
        </tr>

        <tr>
            <td>이메일</td>
            <td>
                <input type="text" name="m_email" value="${update.m_email}">
            </td>
        </tr>

        <tr>
            <td>전화번호</td>
            <td>
                <input type="text" name="m_tel" value="${update.m_tel}">
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <input type="submit" value="수정하기">
                <input type="button" value="취소하기" onclick="location.href='/Member/MemberDetail'">
            </td>
        </tr>
    </table>
</form>

</body>
</html>