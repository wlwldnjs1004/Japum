<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.img-fixed {
  width: 120px;
  height: 120px;
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
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<div class="container drag-prevent">


<div class="row mt-4">
<div class="col">

<form class="d-flex mt-5" action="list">
	<!-- <select name="column" class="form-select w-25">
	<option value="work_paid">태그</option>
	<option value="work_">작가</option>
	<option value="">작품제목</option>
	</select> -->
  <input class="form-control me-2 input" type="search" placeholder="검색어 입력" name="keyword" aria-label="Search">
  <button class="btn btn-success text-nowrap" type="submit">검색</button>
</form>
</div>
</div>


<%-- 	<ul class="d-flex flex-wrap list-unstyled p-3 gap-4">
	  <c:forEach var="workDto" items="${list}">
    <li class="text-center" >
      <a href="detail?workNo=${workDto.workNo}">
        <img src="image?workNo=${workDto.workNo}" class="img-fixed">
      </a>
      <p class="mt-2 fw-bold">${workDto.workName}</p>
    </li>
  </c:forEach>
</ul> --%>


<table class="table table-borderless mb-5">
<tbody>
  <tr>
    <td>
    <c:forEach var="workDto" items="${list}">
      <ul class="list-group mt-4">
        <li class="list-group-item sd">
          <div class="row align-items-center mb-3 sdd" data-href="http://localhost:8080/work/detail?workNo=${workDto.workNo}">
            <div class="col-auto">
                    <a href="detail?workNo=${workDto.workNo}">
        <img src="image?workNo=${workDto.workNo}" class="img-fixed">
      </a>
            </div>
            <div class="col">
              <h5>      ${workDto.workName}</h5>
              <p class="text-muted"></p>
            </div>
          </div>
        </li>        
      </ul>
  </c:forEach>
    </td>
  </tr>
</tbody>

</table>

	<div class="row mt-4">
	<div class="col">
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/work/add">작품 등록</a>
	</div>
	</div>



</div>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>