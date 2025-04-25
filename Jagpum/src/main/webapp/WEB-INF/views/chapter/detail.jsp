<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>


<style>	
.drag-prevent{
    -ms-user-select: none;
    -moz-user-select: -moz-none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    user-select: none;
}
</style>


<div class="container">
	<div class="row mt-4">
		<div class="col-sm-12">
			<div class="">${chapterDto.chapterTitle}</div>
		</div>
	</div>

	<div class="row mt-4">
		<div class="col-sm-12">
			<div class="font-family drag-prevent" style="height: 400px;">
				${chapterDto.chapterDetail}</div>
		</div>
	</div>
	
	
	<div class="row mt-2">
	<div class="col-sm-12">
	
	</div>
	</div>
	
	<div class="row mt-3">
		<div class="col-sm-12">
			<div class="font-family drag-prevent" style="height: 100px;">
	<p>작가의 말</p>
	<hr>
			${chapterDto.chapterComment}
			
			</div>
		</div>
	</div>
	
		<div class="row mt-5 ">
		<div class="col-sm-12">
		<a class="btn btn-primary w-25"
		href="/work/detail?workNo=${chapterDto.workNo}">목록으로</a>
	<a href="/chapter/delete?chapterNo=${chapterDto.chapterNo}" class="btn btn-primary w-25">삭제 </a>
		<a href="/chapter/edit?chapterNo=${chapterDto.chapterNo}" class="btn btn-primary w-25">수정</a>
<c:if test="${sessionScope.userLevel=='관리자'}">
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
</c:if>		
	가격 변경
</button>

		</div>
		</div>
		
		
		
		
</div>



<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
</button> -->

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">편당 가격 금액 입력</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
     <input type="text" inputmode="numeric" name="chapterPrice" class="form-control" />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">변경</button>
      </div>
    </div>
  </div>
</div>


<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>