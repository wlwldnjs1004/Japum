<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<style>
.drag-prevent {
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select: none;
}

.size-r {
	font-size: 20px;
}

.text {
	resize: none;
}
</style>

<script type="text/javascript">
	
	$(function() {
		const status = {
			workName : false,
			workGenre : false,
			workPrefer : false,
			workPaid : false,
			workContract : false,
			ok : function() {
				return this.workName && this.workGenre &&this.workSubGenre&& this.workPrefer
						&& this.workPaid && this.workContract;
			},
		};
		
		$("[name=workName]").blur(
				function() {
					const size = $(this).val().length > 0;
					$(this).removeClass("is-valid is-invalid").addClass(
							size ? "is-valid" : "is-invalid");
					status.workName = size;
				});
		const workGenresList=["판타지","무협","게임","퓨전",
			  "스포츠","로멘스","라이트노벨","현대판타지","대체역사",
			  "전쟁밀리터리","SF","추리","공포·미스터리","일반소설","종단편"
			  ,"드라마","연극·시나리오","BL","팬픽·페러디"];

		
		$("[name=workGenre]").blur(
				function() {
					const val=$(this).val();
					const subSelect=$("[name=workSubGenre]");
          const size = $(this).val().length > 0;
					//subGenre 제어를 위한 const		
			$(this).removeClass("is-valid is-invalid").addClass(
					size ? "is-valid" : "is-invalid");
					
					subSelect.empty().append(`<option value="">부장르 선택</option>`)
            workGenresList.forEach(function(opt){
            	console.log("opt",opt);
              if(opt !==val){
            	  subSelect.append(`<option value="` + opt + `">` + opt + `</option>`);
              }

            });
					subSelect.prop("disabled", !size).val("");
	            status.workGenre = size;
					});
	      
		$("[name=workPrefer]").blur(
				function() {
					const size = $(this).val().length > 0;
					$(this).removeClass("is-valid is-invalid").addClass(
							size ? "is-valid" : "is-invalid");
					status.workPrefer = size;
				});
		$("[name=workPaid]").blur(
				function() {
					const size = $(this).val().length > 0;
					$(this).removeClass("is-valid is-invalid").addClass(
							size ? "is-valid" : "is-invalid");
					status.workPaid = size;
				});
		$("[name=workContract]").blur(
				function() {
					const size = $(this).val().length > 0;
					$(this).removeClass("is-valid is-invalid").addClass(
							size ? "is-valid" : "is-invalid");
					status.workContract = size;
				});
		$(".needs-validation").submit(function() {
			$("[name]").trigger("blur");
			return status.ok();
		});

	});
	
</script>



<div class="container drag-prevent">

	<form action="add" method="Post" class=" needs-validation"
		enctype="multipart/form-data">

		<div class="row mt-4">
			<div class="col-sm-9">
				<label class="col-sm-3 col-form-label">작품명</label> <input
					name="workName" type="text" class="form-control"
					placeholder="작품명을 입력하세요">
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
			<label class="col-sm-3">부장르 선택</label>
		</div>

		<div class="row mt-4">
			<div class="col-sm-12">
				<select class="form-select" name="workGenre">
					<option value="">주장르 선택</option>
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
		</div>



		<div class="row mt-4">
			<div class="col-sm-12">
				<select class="form-select" name="workSubGenre" disabled>
					<option value="">부장르 선택</option>
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

		<div class="row mt-5">
			<div class="col-sm-12">
				<input name="workPrefer" type="text" class="form-control"
					placeholder="태그 입력창">
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
				<textarea name="workSubtotal" class="form-control text"
					placeholder="작품명 설명을 입력하세요" rows="6" cols="7"></textarea>
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
			<div class="col-sm-12 mb-3">
				<span class="ms-4">월 </span> 
					<input class="form-check-input" type="checkbox" name="workMon" value="Y">
					 <span class="ms-4"> 화 </span> 
					 <input class="form-check-input" type="checkbox" name="workTue" value="Y">
				<span class="ms-4"> 수 </span> 
				<input class="form-check-input" type="checkbox" name="workWed" value="Y"> 
				<span class="ms-4">목 </span> 
					<input class="form-check-input" type="checkbox" name="workThu" value="Y"> 
					<span class="ms-4"> 금 </span> 
					<input class="form-check-input" type="checkbox" name="workFri" value="Y">
				<span class="ms-4"> 토 </span>
				 <input class="form-check-input" type="checkbox" name="workSat" value="Y">
						<span class=""> 일 </span> 
				<input class="form-check-input" type="checkbox" name="workSun" value="Y"> 
			</div>
		</div>


		<div class="row mt-5">
			<div class="col">
				<label>유료여부?</label>
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
				<label>독점 여부</label>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-sm-12 mb-3">
				<input class="form-check-input size-r" type="radio"
					name="workContract" value="Y"> 독점 <span> <input
					class="form-check-input size-r ms-3" type="radio" name=workContract
					value="N"> 비독점
				</span>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">필수 항목입니다</div>
			</div>
		</div>



		<div class="row mt-5">
			<div class="col text-end">
				<button type="submit" class="btn btn-primary w-100 btn-lg">등록</button>
			</div>
		</div>


	</form>
</div>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>