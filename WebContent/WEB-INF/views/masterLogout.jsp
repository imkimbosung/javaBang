<!-- page directive 라 한다. JSP파일 상단에 항상 들어간다 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	alert("관리자만 볼 수 있는 화면입니다. 관리자 로그인을 해주세요.");
	location.replace("/javaBang/master.do");
</script>
