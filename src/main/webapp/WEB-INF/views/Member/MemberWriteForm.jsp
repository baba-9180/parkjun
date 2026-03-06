<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>박준 회원가입</title>
</head>
<body>
	<form name="member" method="post" action="/Member/MemberWrite">
		<table>
			<tr>
				<td>
					아이디:
				</td>
				<td>
					<input type="text" name = "m_id" placeholder = "아이디를 입력해주세요">
				</td>
			</tr>
			<tr>
				<td>
					비밀번호:
				</td>
				<td>
					<input type ="password" name = "m_pw" placeholder = "비밀번호를 입력해주세요">
				</td>
			</tr>
			<tr>
				<td>
					비밀번호 확인:
				</td>
				<td>
					<input type = "password" name = "m_pwc">	
				</td>
			</tr>
			<tr>
				<td>
					닉네임:
				</td>
				<td>
					<input type = "text" name = "m_name">
				</td>
			</tr>
			<tr>
				<td>
					성별
				</td>
				<td>
					남자<input type ="radio" value = "남자" name = "m_sex">
					여자<input type = "radio" value = "여자" name = "m_sex">
				</td>
			</tr>
			<tr>
				<td>
					이메일:
				</td>
				<td>
					<input type = "text" name = "m_email">
				</td>
			</tr>
			<tr>
				<td>
					전화번호:
				</td>
				<td>
					<input type ="text" name = "m_tel">
				</td>
			</tr>
			<tr>
				<td>
					<input type = "submit" value = "회원가입">
				</td>
				<td>
					<input type = "reset" value = "다시 작성">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>