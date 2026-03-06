<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트케이스 수정</title>
</head>
<body>

<h3>테스트케이스 수정</h3>

<form method="post" action="<c:url value='/Testcase/Update'/>">

  <table border="1" cellpadding="6" cellspacing="0">
    <tr>
      <th>tc_no</th>
      <td>${tc.tc_no}</td>
    </tr>

    <tr>
      <th>문제번호(p_no)</th>
      <td>${p_no}</td>
    </tr>

    <tr>
      <th>입력(tc_input)</th>
      <td>
        <textarea name="tc_input" rows="8" cols="80" required><c:out value="${tc.tc_input}"/></textarea>
      </td>
    </tr>

    <tr>
      <th>출력(tc_output)</th>
      <td>
        <textarea name="tc_output" rows="8" cols="80" required><c:out value="${tc.tc_output}"/></textarea>
      </td>
    </tr>

    <tr>
      <th>샘플(tc_sample)</th>
      <td>
        <input type="text" name="tc_sample" size="80" value="<c:out value='${tc.tc_sample}'/>"/>
      </td>
    </tr>

    <tr>
      <td colspan="2">
        <input type="submit" value="수정 저장"/>
        <input type="button" value="목록" onclick="location.href='<c:url value='/Testcase/List?p_no=${p_no}'/>'"/>
      </td>
    </tr>
  </table>
</form>

</body>
</html>