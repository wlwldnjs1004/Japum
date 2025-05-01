<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/css/work/list.css">


<script>
	/* var burger=$(".menu-trigger");
	 */
</script>

<style>
.text-names{
font-size: 16px !important;
 white-space: nowrap;
   width: 100px; /* 반드시 너비를 정해야 작동함 */
     overflow: hidden;  /* 넘치는 부분 숨기기 */
    text-overflow: ellipsis; /* 넘치면 "..."으로 표시 */
}
</style>



<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<div class="container drag-prevent">


	<form class="d-flex mt-5" action="list">
		<div class="input-group">
			<input class="form-control w-75" type="search" placeholder="검색어 입력"
				name="keyword" aria-label="Search">
			<button class="btn btn-success text-nowrap" type="submit">검색</button>
		</div>
	</form>




	<table
		class="table table-hover align-middle 
	table-borderless mb-5">
		<thead>
			<tr class="text-center">
				<th  style="width: 100px">이미지</th>
				<th style="width: 90px">제목</th>
				<th>작품소게</th>
				<th style="width: 100px">작성일</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach var="workDto" items="${list}">
			<tr>
				 <td class="text-center">
                <img src="https://placehold.co/100x100" class="rounded" style="width: 80px; height: 80px;">
              </td>
              <td class="text-center text-muted text-names"  >${workDto.workName}</td>
              <td class="text-start">
                <a href="/work/detail?workNo=${workDto.workNo}" class="text-dark text-decoration-none">
                  <span class="fw-semibold">${workDto.workSubtotal}</span>
                </a>
              </td>
              <td class="text-center text-muted">
                <fmt:formatDate value="${workDto.workWtime}" pattern="yyyy-MM-dd" />
              </td>
			</tr>
				</c:forEach>
		</tbody>
	</table>


	<div class="row mt-4">
		<div class="col">
			<a class="btn btn-primary"
				href="${pageContext.request.contextPath}/work/add">작품 등록</a>
		</div>
	</div>



</div>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>