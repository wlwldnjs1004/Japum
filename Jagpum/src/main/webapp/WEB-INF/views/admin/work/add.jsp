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
.size-r{
font-size: 20px;
}


</style>


<script type="text/javascript">
</script>

<div class="container drag-prevent">

	<form action="add" method="Post" class="p-3  rounded"
	enctype="multipart/form-data">

		<div class="row mt-4">
			<div class="col-sm-9">
				<label class="col-sm-3 col-form-label">작품명</label>
				<input name="workName" type="text" class="form-control" placeholder="작품명을 입력하세요">
			</div>
		</div>


		<div class="row mt-4">
			<div class="col-sm-9">
				<label class="col-sm-3 col-form-label">작품표지</label>
		<input type="file" name="attach" class="form-control w-100" accept=".png, .jpg">
			</div>
		</div>

	<div class="row mt-4">
		<div class="col-sm-9">
		<label class="col-sm-3">장르 분류</label>
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
		</div>
	</div>


	<div class="row mt-4">
		<div class="col-sm-9">
			<label class="col-sm-3">부장르 선택</label>
		<select class="form-select" name="workSubGenre">
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
		</div>
	</div>

		<div class="row mt-4">
			<div class="col-sm-12">
				<input name="workPrefer" type="text" class="form-control" placeholder="태그 입력창">
			</div>
		</div>

		<div class="row mt-5">
			<div class="col">
				<label>작품 부가설명</label>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-sm-12">
				<textarea  name="workSubtotal" class="form-control" placeholder="작품명을 입력하세요"
					rows="6" cols="7"></textarea>
			</div>
		</div>

		<div class="row mt-5">
			<div class="col">
				<label>유료여부?</label>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-sm-12">
				<input class="form-check-input size-r" type="radio" name="workPaid" value="N">
				무료		
				<input class="form-check-input size-r ms-3" type="radio" name="workPaid" value="Y">
				유료
			</div>
		</div>

		<div class="row mt-4">
			<div class="col">
				<label>독점 여부</label>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-sm-12 mb-3">
				<input class="form-check-input size-r" type="radio" name="workContract" value="독점">
					독점	
				<input class="form-check-input size-r ms-3" type="radio" name=workContract value="비독점">
				비독점
			</div>
		</div>
		
 		<div class="row mt-4">
			<div class="col-sm-12 mb-3">
				<input class="form-check-input size-r" type="radio" name="workBook" value="Y"
				checked="checked">
					<span>
					e북 
					</span>
			</div>
		</div> 

		<div class="row mt-5">
			<div class="col text-end">
				<button type="submit" class="btn btn-primary w-25 btn-lg">등록</button>
			</div>
		</div>


	</form>
</div>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>