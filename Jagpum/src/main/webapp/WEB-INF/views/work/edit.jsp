<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css">
 <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>


<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<div class="row mt-5">
	<div class="col">
		<h1>수정창</h1>
	</div>
</div>
<form action="edit" method="post" class="p-3 rounded"
	enctype="multipart/form-data">
	<div class="container drag-prevent">

		<input type="hidden" name="workNo" value="${workDto.workNo}">

		<input type="hidden" name="workId" value="${workDto.workId}">


		<div class="row mt-4">
			<div class="col-sm-9">
				<label class="col-sm-3 col-form-label">작품명</label> 
				<input name="workName" type="text" class="form-control" placeholder="작품명을 입력하세요" value="${workDto.workName}">
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">필수조건입니다</div>
			</div>
		</div>




		<div class="row mt-4">
			<div class="col-sm-9">
				<label class="col-sm-3 col-form-label">작품표지</label> <input
					type="file" name="attach" class="form-control w-100"
					accept=".png, .jpg">
				<div class="invalid-feedback"></div>
			</div>
		</div>

		<div class="row mt-4">
			<label class="col-sm-3">장르 분류</label>
			<div class="col-sm-9">
				<select class="form-select" name="workGenre">
					<option value="${workDto.workGenre}">${workDto.workGenre}</option>
					<option value="판타지">판타지</option>
					<option value="무협">무협</option>
					<option value="게임">게임</option>
					<option value="퓨전">퓨전</option>
					<option value="스포츠">스포츠</option>
					<option value="로멘스">로멘스</option>
					<option value="라이트노벨">라이트노벨</option>
					<option value="현대판타지">현대판타지</option>
					<option value="대체역사">대체역사</option>
					<option value="전쟁밀리터리">전쟁밀리터리</option>
					<option value="SF">SF</option>
					<option value="추리">추리</option>
					<option value="공포·미스테리">공보 미스테리</option>
					<option value="일반소설">일반소설</option>
					<option value="시·수필">시 수필</option>
					<option value="종단편">종단편</option>
					<option value="드라마">드라마</option>
					<option value="연극·시나리오">연극 시나리오</option>
					<option value="BL">BL</option>
					<option value="팬픽·페러디">팬픽 페러디</option>
				</select>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">필수 선택 사항입니다</div>
			</div>
		</div>


		<div class="row mt-4">
			<label class="col-sm-3">부장르 선택</label>
			<div class="col-sm-9">
				<select class="form-select" name="workSubGenre">
					<option value="${workDto.workSubGenre}">${workDto.workSubGenre}</option>
					<option value="판타지">판타지</option>
					<option value="무협">무협</option>
					<option value="게임">게임</option>
					<option value="퓨전">퓨전</option>
					<option value="스포츠">스포츠</option>
					<option value="로멘스">로멘스</option>
					<option value="라이트노벨">라이트노벨</option>
					<option value="현대판타지">현대판타지</option>
					<option value="대체역사">대체역사</option>
					<option value="전쟁밀리터리">전쟁밀리터리</option>
					<option value="SF">SF</option>
					<option value="추리">추리</option>
					<option value="공포·미스테리">공보 미스테리</option>
					<option value="일반소설">일반소설</option>
					<option value="시·수필">시 수필</option>
					<option value="종단편">종단편</option>
					<option value="드라마">드라마</option>
					<option value="연극·시나리오">연극 시나리오</option>
					<option value="BL">BL</option>
					<option value="팬픽·페러디">팬픽 페러디</option>
				</select>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">필수 선택 사항입니다</div>
			</div>
		</div>

		<div class="row mt-4">
			<div class="col-sm-12">
				<input name="workPrefer" type="text" class="form-control"
					value="${workDto.workPrefer}" id="workPrefer">
				<div class="vdlid-feedback"></div>
			</div>
		</div>

		<div class="row mt-5">
			<div class="col">
				<label>작품 부가설명</label>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-sm-12">
				<textarea name="workSubtotal" class="form-control" rows="6" cols="7">${workDto.workSubtotal}</textarea>
				<div class="vdlid-feedback"></div>
			</div>
		</div>

		<div class="row mt-5">
			<div class="col">
				<label>유료여부?</label>
			</div>
		</div>
		<c:choose>
		<c:when test="${workDto.workPaid=='Y'}">
			<div class="row mt-4">
			<div class="col-sm-12">
				<input class="form-check-input size-r" type="radio" name="workPaid"
					value="N"> 무료 <input class="form-check-input size-r ms-3"
					type="radio" name="workPaid" value="Y" checked="checked"> 유료

			</div>
			<div class="valid-feedback"></div>
			<div class="invalid-feedback">필수 항목입니다</div>
		</div>
		</c:when>
		<c:otherwise>
		<div class="row mt-4">
			<div class="col-sm-12">
				<input class="form-check-input size-r" type="radio" name="workPaid"
					value="N" checked="checked"> 무료 <input class="form-check-input size-r ms-3"
					type="radio" name="workPaid" value="Y" > 유료

			</div>
			<div class="valid-feedback"></div>
			<div class="invalid-feedback">필수 항목입니다</div>
		</div>	
		</c:otherwise>
		</c:choose>
	

		<div class="row mt-5">
			<div class="col">
				<label>독점 여부</label>
			</div>
		</div>

		<c:choose>
			<c:when test="${workDto.workContract=='Y'}">
				<div class="row mt-4">
					<div class="col-sm-12 mb-3">
						<input class="form-check-input size-r" type="radio"
							name="workContract" value="Y" checked="checked"> 독점 <span> 
							<input class="form-check-input size-r ms-3" type="radio" name=workContract value="N"> 비독점
						</span>
						<div class="valid-feedback"></div>
						<div class="invalid-feedback">필수 항목입니다</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row mt-4">
					<div class="col-sm-12 mb-3">
						<input class="form-check-input size-r" type="radio"
							name="workContract" value="Y"> 독점 <span> <input
							class="form-check-input size-r ms-3" type="radio"
							name=workContract value="N" checked="checked"> 비독점
						</span>
						<div class="valid-feedback"></div>
						<div class="invalid-feedback">필수 항목입니다</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>

<!--요일 구분  -->
${workDto.workMon=='N'?'<input class="form-check-input" type="checkbox" name="workMon" value="N">':'<input class="form-check-input" type="checkbox" name="workMon" value="Y" checked="checked" >'}
월
${workDto.workTue=='N'?'<input class="form-check-input" type="checkbox" name="workTue" value="N">':'<input class="form-check-input" type="checkbox" name="workTue" value="Y" checked="checked" >'}
화
${workDto.workWed=='N'?'<input class="form-check-input" type="checkbox" name="workWed" value="N">':'<input class="form-check-input" type="checkbox" name="workWed" value="Y" checked="checked" >'}
수
${workDto.workThu=='N'?'<input class="form-check-input" type="checkbox" name="workThu" value="N">':'<input class="form-check-input" type="checkbox" name="workThu" value="Y" checked="checked" >'}
목
${workDto.workFri=='N'?'<input class="form-check-input" type="checkbox" name="workFri" value="N">':'<input class="form-check-input" type="checkbox" name="workFri" value="Y" checked="checked" >'}
금
${workDto.workSat=='N'?'<input class="form-check-input" type="checkbox" name="workSat" value="N">':'<input class="form-check-input" type="checkbox" name="workSat" value="Y" checked="checked" >'}
토
${workDto.workSun=='N'?'<input class="form-check-input" type="checkbox" name="workSun" value="N">':'<input class="form-check-input" type="checkbox" name="workSun" value="Y" checked="checked" >'}
일



		<div class="row mt-5">
			<div class="col text-end">
				<button type="submit" class="btn btn-primary w-100 btn-lg">등록</button>
			</div>
		</div>
</form>
</div>


<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>
