<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제 수정</title>
</head>
<body>

<h3>문제 수정</h3>

	<form method="post" action="<c:url value='/Problem/ProblemUpdate'/>">

  		<table border="1">

	    	<tr>
		      	<th>문제번호(p_no)</th>
		      	<td>${problem.p_no}</td>
		    </tr>
		
		    <tr>
	      		<th>제목(p_title)</th>
	      		<td>
				<input type="text" name="p_title" size="80" value="<c:out value='${problem.p_title}'/>" required />
	      		</td>
	    	</tr>
	
	    	<tr>
	      		<th>내용(p_content)</th>
	      		<td>
	        		<textarea name="p_content" rows="12" cols="80"><c:out value="${problem.p_content}"/></textarea>
	      		</td>
	    	</tr>
	
	    	<tr>
	      		<th>난이도(p_level)</th>
	      		<td>
	        		<select name="p_level" required>
						<option value="">선택</option>
						<option value="1"   <c:if test="${problem.p_level=='★☆☆☆☆'}">selected</c:if>>★☆☆☆☆</option>
						<option value="2"   <c:if test="${problem.p_level=='★★☆☆☆'}">selected</c:if>>★★☆☆☆</option>
						<option value="3"     <c:if test="${problem.p_level=='★★★☆☆'}">selected</c:if>>★★★☆☆</option>
						<option value="4" <c:if test="${problem.p_level=='★★★★☆'}">selected</c:if>>★★★★☆</option>
						<option value="5"  <c:if test="${problem.p_level=='★★★★★'}">selected</c:if>>★★★★★</option>
			        </select>
				</td>
	    	</tr>
	
	    	<tr>
	      		<th>제한시간(분)(p_time)</th>
	      		<td>
	        		<input type="number" name="p_time"value="${problem.p_time}"/>
	      		</td>
	    	</tr>
	
	    	<tr>
	      		<td colspan="2">
	        		<input type="submit" value="수정 저장" />
	        		<input type="button" value="상세" onclick="location.href='<c:url value='/Problem/ProblemView?p_no=${problem.p_no}'/>'" />
	        		<input type="button" value="목록" onclick="location.href='<c:url value='/Problem/ProblemList'/>'" />
	      		</td>
	    	</tr>

  		</table>
	</form>

</body>
</html>