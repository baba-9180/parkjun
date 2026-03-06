<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트케이스 등록</title>
</head>
<body>

	<h3>테스트케이스 등록 (문제번호: ${p_no})</h3>

	<form method="post" action="<c:url value='/Testcase/Write'/>">
		<input type="hidden" name="p_no" value="${p_no}"/>

		<table border="1">
			<tr>
				<th>입력(tc_input)</th>
				<td>
					<textarea name="tc_input"></textarea>
				</td>
		    </tr>
		
		    <tr>
				<th>출력(tc_output)</th>
				<td>
					<textarea name="tc_output"></textarea>
				</td>
		    </tr>
		
			<tr>
				<th>샘플(tc_sample)</th>
				<td>
		        	<input type="text" name="tc_sample"/>
				</td>
	    	</tr>
	
		    <tr>
				<td>
					<input type="submit" value="등록"/>
				<input type="button" value="목록" onclick="location.href='<c:url value='/Testcase/List?p_no=${p_no}'/>'"/>
				</td>
		    </tr>
		</table>
	</form>
</body>
</html>