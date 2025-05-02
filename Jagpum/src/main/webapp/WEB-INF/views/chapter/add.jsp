<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/chapter/add.js"></script>


<style>
.sss{
	font-size: 20px;
}
</style>


<link href="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.snow.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.js"></script>

<!-- summernote cdn -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.js"></script>

<link rel="stylesheet" href="/css/chapter/add.css">


<div class="container">

	<!-- 작품 미리보기 -->
	<div class="container mt-4 my-2">
		<div class="row align-items-center">
			<div class="col-md-3 text-center a">
				<img src="/work/image?workNo=${workDto.workNo}"
					class="img-fluid rounded " >
			</div>
			<div class="col-md-9">
				<h3 class="fw-bold">${workDto.workName}</h3>
				<p class="mb-1">
					<strong>태그:</strong> ${workDto.workPrefer}
				</p>
				<p class="mb-1">
					<strong>작품 설명:</strong> 
					${workDto.workSubtotal}
				</p>
				<p class="text-muted">
					<strong>작성자:</strong> ${workDto.workId}
				</p>
			</div>
		</div>
	</div>
	<hr>
	
	
	<form action="add" method="Post" class="needs-validation">
		<input type="hidden" name="workNo" value="${workNo}" maxlength="180">

		<div class="row mt-4">
			<div class="col-sm-12">
				<input type="text" name="chapterTitle" class="form-control"
					placeholder="소제목을 입력해주세요. (최대 60자 까지 입력가능)">
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">필수조건입니다</div>
			</div>
		</div>
		
		
		<div class="row mt-3">
			<div class="col">
				<p class="fs-6">* 글 번호는 자동으로 생성됩니다. 소제목에 회차 번호를 입력하시면 중복 표기될 수 있습니다.</p>
			</div>
		</div>
		
		
		<div class="row mt-5">
			<div class="col-sm-12">
				<textarea name="chapterDetail" class="form-control text-text"
					 rows="11"></textarea>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">필수조건입니다</div>
			</div>
		</div>

		<div class="row mt-5 my-4">
			<div class="col-sm-12">
				<textarea type="text" name="chapterComment" class="form-control text-text" rows="6"></textarea>
			</div>
		</div>


		<div class="row mt-5">
			<div class="col text-end">
				<button class="btn btn-primary w-25 btn-lg" type="submit">등록</button>
			</div>
		</div>
	</form>
</div>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>