<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp" />

<style>
.aa {
	color: black;
	text-decoration: none;
}
</style>
<ul>
<li class="list-group-item">
<a href="/admin/work/add" class="aa">E북 등록</a>
</li>
<!-- <li class="list-group-item">
<a href="/admin/chapter/edit" class="aa">가격 설정</a>
</li> -->
<li class="list-group-item">
<a href="/admin/member/list" class="aa">회원 목록</a>
</li>
</ul>




<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp" />






