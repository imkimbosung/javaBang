<!-- page directive 라 한다. JSP파일 상단에 항상 들어간다 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	alert("로그인된 회원만 볼 수 있는 화면입니다.  로그인 화면으로 이동합니다.");
	location.replace("/javaBang/buyer/loginForm.do");
</script>
