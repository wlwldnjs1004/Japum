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

@media ( max-width :479px){
.text-names{
font-size: 15px !important;
 white-space: nowrap;
   width: 80px; /* 반드시 너비를 정해야 작동함 */
     overflow: hidden;  /* 넘치는 부분 숨기기 */
    text-overflow: ellipsis; /* 넘치면 "..."으로 표시 */
}
.text-tltle{
font-size: 13px !important;
 white-space: nowrap;
   width: 60px; /* 반드시 너비를 정해야 작동함 */
     overflow: hidden;  /* 넘치는 부분 숨기기 */
    text-overflow: ellipsis; /* 넘치면 "..."으로 표시 */
}
}
@media (max-width: 768px) {
  .desktop-only {
    display: none;
  }
}
.sssds {
  border: 2px solid bdc3c7 !important; /* Bootstrap 기본 파랑 (#0d6efd) */
}
.search-input {
	height: 46px;
}

.search-input{
 border-radius: none ;
 outline:none ;
}

</style>


<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<div class="container drag-prevent mb-3">

	
	<form class="d-flex mt-3" action="list">
		<div class="input-group">
			<input  class="form-control w-75 search-input " type="search"  name="keyword" aria-label="Search">
			<button class="btn btn-success text-nowrap search-input" type="submit">검색</button>
		</div>
	</form>	




<table class="table table-hover align-middle mb-5  table-striped"  style="width: 100%;">
		<thead>
			<tr class="text-center">
				<th style="width: 60px">랭킹</th>
				<th  style="width: 20px">이미지</th>
				<th style="width: 50px">제목</th>
				<th style="width:100px;">작품소게</th>
				<th style="width: 100px" class="desktop-only ">작성일</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach var="workDto" items="${list}"  varStatus="loop">
			<tr>
				<td class="text-center">    <label>${loop.index + 1}</label> <!-- 0부터 시작하므로 +1 --></td>
				 <td class="text-center">
            	<img src="image?workNo=${workDto.workNo}" class="rounded" style="width: 80px; height: 80px;">
              </td>
              <td class="text-center text-muted text-names"  >${workDto.workName}</td>
              <td class="text-start">
                <a href="/work/detail?workNo=${workDto.workNo}" class="text-dark text-decoration-none ellipsis">
                  <span class="fw-semibold text-tltle">${workDto.workSubtotal}</span>
                </a>
              </td>
              <td class="text-center text-muted desktop-only ">
                <fmt:formatDate value="${workDto.workWtime}" pattern="yyyy-MM-dd" />
              </td>
			</tr>
				</c:forEach>
		</tbody>
	</table>
	<div class="row mt-4 text-center">
		<div class="col">
			<a class="btn btn-primary w-50 "
				href="${pageContext.request.contextPath}/work/add" >작품 등록</a>
		
		</div>
	</div>
	
	
<section class="text-line text-center mt-4">

 	<div class="container mt-5">
  <div class="d-flex flex-wrap justify-content-start gap-4">
	<c:forEach var="workDto" items="${list}"  varStatus="loop">
    <a href="/work/detail?workNo=${workDto.workNo}" class="text-a item-box text-dark mb-5">
      <div class="text-center">
        <img src="image?workNo=${workDto.workNo}" class="img-fixed-ms">
        <label class="text-name-ms mt-1">${workDto.workName}</label>
        <label class="text-name-ms mt-1">${workDto.workSubtotal}</label>
      </div>
    </a>
    	</c:forEach>
    <!-- 원하는 만큼 복붙 -->
 </div>
</div> 
</section>

	
	
	
<div style="height: 50px;"></div>
<!-- <div class="mt-4 text-center">
  <img src="https://placehold.co/800x300?text=event banner" alt="이벤트 배너" 
  class="img-fluid rounded" style="width:235px; height:250px;">
</div> -->




</div>
<div style="height: 100px;"></div>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>