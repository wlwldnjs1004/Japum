<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link rel="stylesheet" href="/css/work/list.css">


<script>
	/* $(document).ready(function () {
	 $('.sdd').click(function () {
	 const url = $(this).data('href');
	 if (url) {
	 window.location.href = url;
	 }
	 });
	 }); */
</script>


<script src="${pageContext.request.contextPath}/js/work/add.js"></script>



<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>
<div class="container mt-5 drag-prevent">
  <c:forEach var="workDto" items="${list}">
    <div class="card mb-4 p-3 shadow-sm">
      <div class="row g-3 align-items-center sdd" data-href="detail?workNo=${workDto.workNo}">
        <!-- 썸네일 이미지 -->
        <div class="col-auto">
          <a href="detail?workNo=${workDto.workNo}">
            <img src="image?workNo=${workDto.workNo}" class="img-fixed">
          </a>
        </div>
        <!-- 텍스트 정보 -->
        <div class="col">
          <a href="detail?workNo=${workDto.workNo}" class="text-decoration-none text-dark">
            <h5 class="text-name mb-1">${workDto.workName}</h5>
            <p class="text-muted mb-1">${workDto.workSubtotal}</p>
            <small class="text-secondary">장르: ${workDto.workGenre} / 조회수: ??</small>
          </a>
        </div>
      </div>
    </div>
  </c:forEach>
</div>


<div class="container mt-5 drag-prevent">
  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4">
    <c:forEach var="workDto" items="${list}">
      <div class="col">
        <div class="card h-100 text-center shadow-sm">
          <a href="detail?workNo=${workDto.workNo}">
            <img src="image?workNo=${workDto.workNo}" class="img-fixed mt-3" alt="${workDto.workName}">
          </a>
          <div class="card-body">
            <h6 class="text-name text-truncate">${workDto.workName}</h6>
            <p class="text-muted small text-truncate">${workDto.workGenre}</p>
            <%-- <p class="mb-0">
              <i class="fa fa-heart text-danger"></i> ${workDto.likeCount}좋아요
              &nbsp;
              <i class="fa fa-eye text-primary"></i> ${workDto.viewCount}추천수
            </p> --%>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>







	<div class="row mt-4">
		<div class="col">
			<a class="btn btn-primary"
				href="${pageContext.request.contextPath}/work/add">작품 등록</a>
		</div>
	</div>



</div>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>