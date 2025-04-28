<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.img-fixed {
  width: 160px;
  height: 160px;
  border-radius: 10px;
}


.drag-prevent{
    -ms-user-select: none;
    -moz-user-select: -moz-none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    user-select: none;
}
</style>


<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<div class="container drag-prevent">


	<ul class="d-flex flex-wrap list-unstyled p-3 gap-4">
	  <c:forEach var="workDto" items="${list}">
    <li class="text-center" >
      <a href="detail?workNo=${workDto.workNo}">
        <img src="image?workNo=${workDto.workNo}" class="img-fixed">
      </a>
      <p class="mt-2 fw-bold">${workDto.workName}</p>
    </li>
  </c:forEach>
</ul>

	<div class="row mt-4">
	<div class="col">
	<a class="btn btn-primary " href="${pageContext.request.contextPath}/work/add">작품 등록</a>
	</div>
	</div>



<form class="d-flex mt-5" action="list"  >
  <input class="form-control me-2" type="search" placeholder="검색어 입력" name="keyword" aria-label="Search">
  <button class="btn btn-outline-success text-nowrap" type="submit">검색</button>
</form>

</div>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>