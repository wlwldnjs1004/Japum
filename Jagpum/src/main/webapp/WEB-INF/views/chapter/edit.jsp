<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<script src="${pageContext.request.contextPath}/js/chapter/edit.js"></script>



<style>
  
</style>
<!--  초기값 넣기-->
<!-- <script>
$(function(){
$(".chapterDetail").val("${chapterDto.chapterDetail}");
 $(".chapterComment").val("${chapterDto.chapterComment}");
});
</script>
 -->

  <!-- summernote cdn -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.js"></script>

<link rel="stylesheet" href="/css/chapter/add.css">


<div class="container-lg">

	<form  action="edit" method="Post" class="p-3 rounded">

<input type="hidden" name="chapterNo" value="${chapterDto.chapterNo}" />
	<input type="hidden" name="workNo" value="${chapterDto.workNo}"/>


	<div class="row mt-3 mb-3">
	<div class="col">
		<div class="bg-dark text-light p-4 rounded">
		<h1>수정창</h1>
		<p>수정을 하는곳</p>
		</div>
	</div></div>

		<div class="row mt-5">
			<div class="col-sm-12">
				<input type="text" name="chapterTitle" class="form-control"
					value="${chapterDto.chapterTitle}">
			</div>
		</div>
		<p class="fs-6">* 글 번호는 자동으로 생성됩니다. 소제목에 회차 번호를 입력하시면 중복 표기될 수
			있습니다.</p>
		<div class="row mt-5">
			<div class="col-sm-12">
				<textarea name="chapterDetail" class="form-control" rows="11">${chapterDto.chapterDetail}</textarea>
			</div>
		</div>
		
		<div class="row mt-4">
			<div class="col-sm-12">
				<textarea type="text" name="chapterComment" class="form-control" rows="6">${chapterDto.chapterComment}</textarea>
			</div>
		</div>
		

		<div class="row mt-5">
			<div class="col text-end">
				<button class="btn btn-primary " type="submit">등록</button>
		<a href="/work/detail?workNo=${chapterDto.workNo}" class="btn btn-primary ">돌아가기</a>
			</div>
			
		</div>s
<div class="row">
<div class="col">
</div></div>		
		
		
	</form>
</div>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>