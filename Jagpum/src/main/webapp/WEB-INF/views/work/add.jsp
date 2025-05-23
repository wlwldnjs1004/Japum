<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>


<link rel="stylesheet" href="/css/work/add.css">

<style>
.container{
	/* background:#e2e1e0; */
}
.text-lavel{
	text-align:none;
}
</style>

<script src="${pageContext.request.contextPath}/js/work/add.js"></script>

<div class="container  drag-prevent text-center">
	<div class="row mt-4 text-center">
		<div class="col">
			<div class="bg-dark text-light p-4 rounded">
				<h1>등록창</h1>
			</div>
		</div>
	</div>

	<form action="add" method="Post" class="needs-validation" enctype="multipart/form-data">

		<div class="row mt-4 mb-1">
			<div class="col">
				<i class="fa-solid fa-star-of-life" style=""></i> <label>이름</label>
			</div>
		</div>

		<div class="row ">
			<div class="col ">
				<input name="workName" type="text" class="form-control text-input">
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">필수조건입니다</div>
			</div>
		</div>

		<div class="row mt-3">
			<div class="col">
				<label class="text-lavel">작품표지</label>
			</div>
		</div>


		<div class="row ">
			<div class="col-sm-9">
				<input type="file" name="attach"
					class="form-control w-100 text-input" accept=".png, .jpg">
				<div class="invalid-feedback"></div>
			</div>
		</div>

		<div class="row mt-4">
			<div class="col">
				<i class="fa-solid fa-star-of-life" style=""></i> <label class="">장르
					선택</label>
			</div>
		</div>
		<div class="row ">
			<div class="col text-input">
				<select class="form-select" name="workGenre">
					<option class="text-name" value="">주장르 선택</option>
					<option class="text-name" value="판타지">판타지</option>
					<option class="text-name" value="무협">무협</option>
					<option class="text-name" value="게임">게임</option>
					<option class="text-name" value="퓨전">퓨전</option>
					<option class="text-name" value="스포츠">스포츠</option>
					<option class="text-name" value="로멘스">로멘스</option>
					<option class="text-name" value="라이트노벨">라이트노벨</option>
					<option class="text-name" value="현대판타지">현대판타지</option>
					<option class="text-name" value="대체역사">대체역사</option>
					<option class="text-name" value="전쟁밀리터리">전쟁밀리터리</option>
					<option class="text-name" value="SF">SF</option>
					<option class="text-name" value="추리">추리</option>
					<option class="text-name" value="공포·미스테리">공보 미스테리</option>
					<option class="text-name" value="일반소설">일반소설</option>
					<option class="text-name" value="시·수필">시 수필</option>
					<option class="text-name" value="종단편">종단편</option>
					<option class="text-name" value="드라마">드라마</option>
					<option class="text-name" value="연극·시나리오">연극 시나리오</option>
					<option class="text-name" value="BL">BL</option>
					<option class="text-name" value="팬픽·페러디">팬픽 페러디</option>
					<option class="text-name" value="공포">공포</option>
					<option class="text-name" value="스릴러">스릴러</option>
				</select>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">필수 선택 사항입니다</div>
			</div>
		</div>


		<div class="row mt-5">
			<div class="col">

				<label>부장르 선택</label>
			</div>
		</div>

		<div class="row ">
			<div class="col">
				<select class="form-select text-input" name="workSubGenre" disabled>
					<option class="text-name" value="">부장르 선택</option>
					<option class="text-name" value="판타지">판타지</option>
					<option class="text-name" value="무협">무협</option>
					<option class="text-name" value="게임">게임</option>
					<option class="text-name" value="퓨전">퓨전</option>
					<option class="text-name" value="스포츠">스포츠</option>
					<option class="text-name" value="로멘스">로멘스</option>
					<option class="text-name" value="라이트노벨">라이트노벨</option>
					<option class="text-name" value="현대판타지">현대판타지</option>
					<option class="text-name" value="대체역사">대체역사</option>
					<option class="text-name" value="전쟁밀리터리">전쟁밀리터리</option>
					<option class="text-name" value="SF">SF</option>
					<option class="text-name" value="추리">추리</option>
					<option class="text-name" value="공포·미스테리">공보 미스테리</option>
					<option class="text-name" value="일반소설">일반소설</option>
					<option class="text-name" value="시·수필">시 수필</option>
					<option class="text-name" value="종단편">종단편</option>
					<option class="text-name" value="드라마">드라마</option>
					<option class="text-name" value="연극·시나리오">연극 시나리오</option>
					<option class="text-name" value="BL">BL</option>
					<option class="text-name" value="팬픽·페러디">팬픽 페러디</option>
					<option class="text-name" value="공포">공포</option>
					<option class="text-name" value="스릴러">스릴러</option>
				</select>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">필수 선택 사항입니다</div>

			</div>
		</div>

		<div class="row mt-5">
			<div class="col-sm-12 ">
				<input name="workPrefer" type="text"
					class="form-control ssss text-input " placeholder="태그 입력창"
					id="workPrefer">
				<div class="vdlid-feedback"></div>
			</div>
		</div>

		<div class="row mt-3">
			<div class="col">
				<label>작품 부가설명</label>
			</div>
		</div>

		<div class="row mt-2">
			<div class="col-sm-12">
				<textarea name="workSubtotal" class="form-control text"
					placeholder="" rows="6" cols="7"></textarea>
				<div class="vdlid-feedback"></div>
			</div>
		</div>

		<div class="row mt-4">
			<div class="col-sm-12 mb-3">
				<label>연재주기</label>
				<p class="text-secondaryr">연재 요일을 선택하세요</p>
			</div>
		</div>

		<div class="row ">
			<div class="col-sm-12 mb-3 ws ">
				<span class="ms-4 text-name-day me-1">월 </span> <input
					class="form-check-input text-name-day" type="checkbox"
					name="workMon" value="Y"> <span
					class="ms-4 text-name-day me-1"> 화 </span> <input
					class="form-check-input text-name-day" type="checkbox"
					name="workTue" value="Y"> <span class="ms-4 text-name-day">
					수 </span> <input class="form-check-input text-name-day" type="checkbox"
					name="workWed" value="Y"> <span class="ms-4 text-name-day">목
				</span> <input class="form-check-input text-name-day" type="checkbox"
					name="workThu" value="Y"> <span class="ms-4 text-name-day">
					금 </span> <input class="form-check-input text-name-day" type="checkbox"
					name="workFri" value="Y"> <span class="ms-4 text-name-day">
					토 </span> <input class="form-check-input text-name-day" type="checkbox"
					name="workSat" value="Y"> <span class="ms-4 text-name-day">
					일 </span> <input class="form-check-input text-name-day" type="checkbox"
					name="workSun" value="Y">
			</div>
		</div>


		<div class="row mt-5">
			<div class="col">
				<i class="fa-solid fa-star-of-life" style=""></i> <label>유료여부?</label>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-sm-12">
				<input class="form-check-input size-r" type="radio" name="workPaid"
					value="N"> 무료 <input class="form-check-input size-r ms-3"
					type="radio" name="workPaid" value="Y"> 유료

			</div>
			<div class="valid-feedback"></div>
			<div class="invalid-feedback">필수 항목입니다</div>
		</div>

		<div class="row mt-5">
			<div class="col">
				<i class="fa-solid fa-star-of-life" style=""></i> <label>독점
					여부</label>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-sm-12 mb-3">
				<input class="form-check-input size-r" type="radio"
					name="workContract" value="Y"> 독점 <span> <input
					class="form-check-input size-r ms-3" type="radio"
					name="workContract" value="N"> 비독점
				</span>
				<div class="invalid-feedback">필수 항목입니다</div>
				<div class="valid-feedback"></div>
			</div>
		</div>

		<div class="row mt-5">
			<div class="col text-end">
				<button type="submit" class="btn btn-primary w-100 btn-lg">등록</button>
			</div>
		</div>
	</form>
</div>

<div style="height: 60px;"></div>


<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>