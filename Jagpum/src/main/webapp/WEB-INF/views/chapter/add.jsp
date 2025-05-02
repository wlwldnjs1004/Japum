<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/chapter/add.js"></script>




<link href="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.snow.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.js"></script>

<!-- summernote cdn -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.js"></script>

<link rel="stylesheet" href="/css/chapter/add.css">


<div class="container-lg drag-prevent">
		
		
		
<!-- 	<ul class="list-group">
	<li class="list-group-item"> -->
	<!-- 작품 미리보기 -->
	<div class="container mt-4 my-2">
		<div class="row align-items-center">
			<div class="col-md-3 text-center a">
				<img src="/work/image?workNo=${workDto.workNo}"
					class="img-fluid rounded " >
			</div>
			<div class="col-md-9">
				<h3 class="fw-bold text-name-h3">${workDto.workName}</h3>
				<p class="mb-1">
					<strong class="text-name">태그:</strong> ${workDto.workPrefer}
				</p>
				<p class="mb-1">
					<strong class="text-name">작품 설명:</strong> 
					${workDto.workSubtotal}
				</p>
				<p class="text-muted">
					<strong class="text-name">작성자:</strong> ${workDto.workId}
				</p>
			</div>
		</div>
	</div>
		<form action="add" method="Post" class="needs-validation">
			<input type="hidden" name="workNo" value="${workNo}" maxlength="180">
	
		<table class="table  hidden-table ">
			<tbody class=" hidden-table ">
				<tr class=" hidden-table ">
					<th class="text-name-th hidden-table ">소제목 입력</th>
					<td>
						<div class="row ">
							<div class="col-sm-12">
								<input type="text" name="chapterTitle" class="form-control "
									placeholder="소제목을 입력해주세요. (최대 60자 까지 입력가능)">
								<div class="valid-feedback"></div>
								<div class="invalid-feedback">필수조건입니다</div>
							</div>
						</div>
					</td>
				</tr>

				<tr class="hidden-table ">
					<th class="text-name-th hidden-table ">본문내용 입력</th>
					<td class="hidden-table ">
			<div class="row mt-2">
				<div class="col-sm-12">
					<textarea name="chapterDetail" class="form-control text-size" rows="11"
					style="width:1px; height: 1px;"></textarea>
					<div class="valid-feedback"></div>
					<div class="invalid-feedback">필수조건입니다</div>
				</div>
			</div>
					</td>
				</tr>
				<tr class="hidden-table ">
					<th class="text-name-th hidden-table " >작가의 말</th>
					<td class="hidden-table ">
						<div class="row ">
							<div class="col-sm-12">
								<textarea type="text" name="chapterComment" class="form-control text-size" rows="6"
								style="width:1px; height: 1px;"></textarea>
							</div>
						</div>
					</td>
				<tr class="hidden-table ">
					<th class="hidden-table"></th>
					<td class="hidden-table">			<div class="row mt-5">
						<div class="col text-end">
							<button class="btn btn-primary w-25 " type="submit"><i class="fa-solid fa-pencil"></i>등록</button>
						</div>
					</div></td>
				</tr>
				
			</tbody>
		</table>
	</form>
	
	
		<div class=" hidden-table-no">
		<form action="add" method="Post" class="needs-validation">
			<input type="hidden" name="workNo" value="${workNo}" maxlength="180">
		
		<div class="row">
		<div class="col">
		<label>제목</label>
		</div></div>	
			
		
					<div class="row ">
							<div class="col-sm-12">
								<input type="text" name="chapterTitle" class="form-control "
									placeholder="소제목을 입력해주세요. (최대 60자 까지 입력가능)">
								<div class="valid-feedback"></div>
								<div class="invalid-feedback">필수조건입니다</div>
							</div>
						</div>
		
		<div class="row">
		<div class="col">
		<label>본문</label>
		</div></div>	
			
		<div class="row mt-2">
				<div class="col-sm-12">
					<textarea name="chapterDetail" class="form-control text-size" rows="11"
					style="width:1px; height: 1px;"></textarea>
					<div class="valid-feedback"></div>
					<div class="invalid-feedback">필수조건입니다</div>
				</div>
			</div>
		
		<div class="row">
		<div class="col">
		<label>작가의말</label>
		</div></div>	
			
				<div class="row ">
							<div class="col-sm-12">
								<input type="text" name="chapterTitle" class="form-control "
									placeholder="소제목을 입력해주세요. (최대 60자 까지 입력가능)">
								<div class="valid-feedback"></div>
								<div class="invalid-feedback">필수조건입니다</div>
							</div>
						</div>
		
		
		
			<div class="row ">
							<div class="col-sm-12">
								<textarea type="text" name="chapterComment" class="form-control text-size" rows="6"
								style="width:1px; height: 1px;"></textarea>
							</div>
						</div>
		
		
		<div class="row mt-5">
						<div class="col text-end">
							<button class="btn btn-primary w-25 " type="submit"><i class="fa-solid fa-pencil"></i>등록</button>
						</div>
					</div>	
					
					
						
		</form>
		</div>
		
		
		


<div style="height:100px;"></div>
</div>

	<!-- </li>
	</ul> -->

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>