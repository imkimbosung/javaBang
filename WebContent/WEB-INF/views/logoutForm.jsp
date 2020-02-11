<!-- page directive 라 한다. JSP파일 상단에 항상 들어간다 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>
<script type="text/javascript">
	alert("로그아웃 되었습니다.");

	<c:if test="${!empty b_id}">
		location.replace("/javaBang/buyer/homeForm.do");
	</c:if>

	<c:if test="${!empty s_id}">
		location.replace("/javaBang/seller/ownerHomeForm.do");
	</c:if>

	<c:if test="${!empty m_id}">
		location.replace("/javaBang/master/homeForm.do");
	</c:if>

	<c:if test="${!empty r_id}">
	location.replace("/javaBang/realtor/proHome.do");
</c:if>
</script>
