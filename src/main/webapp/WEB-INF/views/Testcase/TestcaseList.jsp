<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트케이스 목록</title>
</head>
<body>

	<h3>테스트케이스 목록 (문제번호: ${p_no})</h3>
	
	  <a href="<c:url value='/Testcase/WriteForm?p_no=${p_no}'/>">[테스트케이스 등록]</a>
	  <a href="<c:url value='/'/>">[메인]</a>
	
	<table border="1">
	  <tr>
	    <th>tc_no</th>
	    <th>샘플(tc_sample)</th>
	    <th>관리</th>
	  </tr>
	
	  <c:choose>
	    <c:when test="${empty list}">
	      <tr>
	        <td colspan="3">등록된 테스트케이스가 없습니다.</td>
	      </tr>
	    </c:when>
	    <c:otherwise>
	      <c:forEach items="${list}">
	        <tr>
	          <td>${tc.tc_no}</td>
	          <td>
	            <c:out value="${tc.tc_sample}"/>
	          </td>
	          <td>
	            <a href="<c:url value='/Testcase/UpdateForm?tc_no=${tc.tc_no}'/>">수정</a>
	            <a href="<c:url value='/Testcase/Delete?tc_no=${tc.tc_no}&p_no=${p_no}'/>">삭제</a>
	          </td>
	        </tr>
	      </c:forEach>
	    </c:otherwise>
	  </c:choose>
	</table>

</body>
</html>