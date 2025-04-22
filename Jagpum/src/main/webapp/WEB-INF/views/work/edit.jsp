<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<div class="row mt-5">
	<div class="col">
		<h1>수정창</h1>
	</div>
</div>
<form action="edit"  method="post" class="p-3 rounded" enctype="multipart/form-data">
	<input class="form-control" type="hidden" name="workNo"> <input
		class="form-control" type="hidden" name="workId">

	<div class="row mt-4">
			<div class="col-sm-9">
						
				<label class="col-sm-3 col-form-label">작품표지</label>
		<input type="file" name="attach" class="form-control w-100" accept=".png, .jpg">
			</div>
		</div>


	<div class="row mt-4">
		<div class="col">
			<input class="form-control" name="workName"
				value="${workDto.workName}">
		</div>
	</div>

	<div class="row mt-4">
		<div class="col">
			<input class="form-control" name="workGenre"
				value="${workDto.workGenre}">
		</div>
	</div>

	<div class="row mt-4">
		<div class="col">
			<input class="form-control" name="workSubGenre"
				value="${workDto.workSubGenre}">
		</div>
	</div>

	<div class="row mt-4">
		<div class="col">
			<input class="form-control" name="workPrefer"
				value="${workDto.workPrefer}">
		</div>
	</div>

	<div class="row mt-4">
		<div class="col">
			<input class="form-control" name="workPaid"
				value="${workDto.workPaid}">
		</div>
	</div>

	<div class="row mt-4">
		<div class="col">
			<input class="form-control" name="workContract"
				value="${workDto.workContract}">
		</div>
	</div>

	<div class="row mt-4">
		<div class="col">
			<input class="form-control" name="workSubtotal"
				value="${workDto.workSubtotal}">
		</div>
	</div>

	<div class="row mt-4">
		<div class="col">
			<button class="btn btn-success">수정 완료</button>
		</div>
	</div>
</form>


<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>
