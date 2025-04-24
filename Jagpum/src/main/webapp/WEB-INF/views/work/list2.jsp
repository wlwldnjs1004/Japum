<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<style>
.work-list {
  list-style: none;
  padding: 0;
  margin: 0;
}
.work-card {
  background-color: #f9f9f9;
  border-radius: 8px;
  padding: 10px;
  box-shadow: 0 0 6px rgba(0,0,0,0.1);
  transition: transform 0.2s;
}
.work-card:hover {
  transform: scale(1.03);
}
</style>

<div class="container">
	<ul class="work-list d-flex flex-row flex-nowrap overflow-auto gap-4 p-3">
		<c:forEach var="workDto" items="${list}">
			<li class="work-card text-center" style="min-width: 300px;">
				<a href="detail?workNo=${workDto.workNo}">
					<img src="image?workNo=${workDto.workNo}" width="300" class="img-fluid rounded">
				</a>
				<p class="mt-2 fw-bold">${workDto.workName}</p>
			</li>
		</c:forEach>
	</ul>
</div>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>