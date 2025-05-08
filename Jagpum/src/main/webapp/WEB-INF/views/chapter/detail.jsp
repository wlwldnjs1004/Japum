<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>



<link rel="stylesheet" href="/css/chapter/detail.css">


<div class="container drag-prevent">

    <!--아이콘-->
    <div class="text-center text-bar" style="display: none">
      <div class="div-Line text-center">
        <i class="fa-solid fa-up-long "></i>
      </div>
    </div>

    <div class="text-center text-bar-down" style="display: none">
      <div class="div-Line text-center">
        <i class="fa-solid fa-down-long"></i>
      </div>
    </div>

	<div class="row mt-4">
		<div class="col-sm-12">
			<div class="font-size-title">${chapterDto.chapterTitle}</div>
		</div>
	</div>
	<hr class="mt-3">
	<div class="row mt-4">
		<div class="col-sm-12">
			<div class="font-family drag-prevent dds " >
				<div  style="line-height:100%;word-space:normal; "
				class="font-size">${chapterDto.chapterDetail}
				<div style="height:200px;"></div></div> 
				</div>
		</div>
	</div>
	
	<div class="row mt-2">
	<div class="col-sm-12">
	</div>
	</div>
	
	
	<div class="row mt-4">
		<div class="col-sm-12">
	<label class="font-size-title">작가의 말</label>
	<hr>
		
			<div class="font-family drag-prevent dds mt-2" >
 			<div style="line-height:100%;word-space:normal; "
 			class="font-size">${chapterDto.chapterComment} 
			<div style="height:20px;">
			</div>
			</div> 
			</div>
		</div>
	</div>


		<div class="row mt-5 ">
		<div class="col-sm-12 hidden-table">
		<a class="btn btn-primary w-25 btn-json hidden-table-no"
		href="/work/detail?workNo=${chapterDto.workNo}">목록으로</a>
	<a href="/chapter/delete?chapterNo=${chapterDto.chapterNo}" class="btn btn-primary w-25 btn-json">삭제 </a>
		<a href="/chapter/edit?chapterNo=${chapterDto.chapterNo}" class="btn btn-success w-25 btn-json">수정</a>
			<c:if test="${sessionScope.userLevel=='관리자'}">
			<button type="button" class="btn btn-primary btn-json" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
			가격 변경
		</button>
			</c:if>
			<a class="btn btn-primary " href="/chapter/detail?chapterNo=${nextChapter.chapterNo}">다음화</a>
				
		</div>
		</div>
		
		
				<div class="row mt-5 ">
		<div class="col-sm-12 hidden-table-no">
		<a class="btn btn-primary w-25 btn-sm"
		href="/work/detail?workNo=${chapterDto.workNo}">목록으로</a>
	<a href="/chapter/delete?chapterNo=${chapterDto.chapterNo}" class="btn btn-primary  btn-sm w-25 ">삭제 </a>
		<a href="/chapter/edit?chapterNo=${chapterDto.chapterNo}" class="btn btn-success w-25 btn-sm">수정</a>
			<c:if test="${sessionScope.userLevel=='관리자'}">
			<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
			가격 변경
		</button>
			</c:if>		
		<a class="btn btn-primary btn-sm" href="/chapter/detail?chapterNo=${nextChapter.chapterNo}">다음화</a>
		
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


</div>

<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
</button> -->
<!-- Modal -->

<%-- <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">편당 가격 금액 입력</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
	<input type="hidden" name="workNo" value="${chapterDto.workNo}"/>
     <input type="text" inputmode="numeric" name="chapterPrice" class="form-control" />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">변경</button>
      </div>
    </div>
  </div>
</div>
 --%>
<div style="height:50px;"></div>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>