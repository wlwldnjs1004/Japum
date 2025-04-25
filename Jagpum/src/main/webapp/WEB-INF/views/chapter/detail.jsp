<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
		</div></div>
		
		
		
		
</div>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>