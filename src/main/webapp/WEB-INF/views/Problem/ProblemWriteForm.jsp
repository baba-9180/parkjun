<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제 등록</title>
</head>
<body>

<h3>문제 등록</h3>

<form method="post" action="<c:url value='/Problem/ProblemWrite'/>">
  <table border="1">

    <tr>
      <th>제목(p_title)</th>
      <td>
        <input type="text" name="p_title"/>
      </td>
    </tr>

    <tr>
      <th>내용(p_content)</th>
      <td>
        <textarea name="p_content"></textarea>
      </td>
    </tr>

    <tr>
      <th>난이도(p_level)</th>
      <td>
        <select name="p_level">
          <option value="">선택</option>
          <option value="★☆☆☆☆">★☆☆☆☆</option>
          <option value="★★☆☆☆">★★☆☆☆</option>
          <option value="★★★☆☆">★★★☆☆</option>
          <option value="★★★★☆">★★★★☆</option>
          <option value="★★★★★">★★★★★</option>
        </select>
      </td>
    </tr>

    <tr>
      <th>제한시간(분)(p_time)</th>
      <td>
        <input type="number" name="p_time"/>
      </td>
    </tr>

    <tr>
      <td colspan="1">
        <input type="submit" value="등록" />
        <input type="button" value="목록" onclick="location.href='<c:url value='/Problem/ProblemList'/>'" />
        <input type="button" value="메인" onclick="location.href='<c:url value='/'/>'" />
      </td>
    </tr>

  </table>
</form>

</body>
</html>