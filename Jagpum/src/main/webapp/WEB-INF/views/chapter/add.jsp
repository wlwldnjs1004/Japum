<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/chapter/add.js"></script>

<script type="text/javascript">
	$(function() {
		const status = {
			chapterTitle : false,
			chapterDetail : false,
			ok : function() {
				return this.chapterTitle && this.chpaterDetail;
			},
		};

		$("[name=chapterTitle]").blur(
				function() {

					const size = $(this).val().length > 0;
					$(this).removeClass("is-valid is-invalid").addClass(
							size ? "is-valid" : "is-invalid");
					status.chapterTitle = size;
				});
		$("[name=chapterDetail]").blur(
				function() {
					const size = $(this).val().length > 0;
					$(this).removeClass("is-valid is-invalid").addClass(
							size ? "is-valid" : "is-invalid");
					status.chapterDetail = size;
				});

		$(".needs-validation").submit(function() {
			$("[name]").trigger("blur");
			return status.ok();
		});
	});
</script>

<style>
.sss {
	font-size: 20px;
}
</style>
<!-- Include stylesheet -->


<link
	href="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.snow.css"
	rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.js"></script>

<!-- summernote cdn -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("[name=chapterDetail]")
				.summernote(
						{
							height : 250,//높이(px)
							minHeight : 200,//최소 높이(px)
							maxHeight : 400,//최대 높이(px)

							placeholder : "타인에 대한 무분별한 비방시 예고 없이 삭제될 수 있습니다",

							//메뉴(toolbar)설정
							toolbar : [
									//['메뉴명',['버튼명','버튼명',...]]
									[
											"font",
											[ "style", "fontname", "fontsize",
													"forecolor", "backcolor" ] ],
									[
											"style",
											[ "bold", "italic", "underline",
													"strikethrough" ] ],
									[ "attach", [ "picture" ] ],
									[
											"tool",
											[ "ol", "ul", "table", "hr",
													"fullscreen" ] ],
							// ["acion",["undo","redo"]]
							],

							//상황에 맞는 callback 함수들
							callback : {
								onlmageUpload : function(files) {
									//예상 시나리오
									//1.서버로 사용자가 선택한 이미지를 업로드
									//- 이미지는 multipart/form-data형태여야 한다
									//- 상황상 form을 쓸 수가 없으므로 ajax를 써야 한다
									//2.업로드한 이미지에 접근할 수 있는 정보 획득
									//3.획득한 정보로 <img> 생성
									//4.에디터에 추가
									//-$("[name=boardContent]").summernote("insertNode",이미지 태그 객체);
									// console.log(files);
									if (files.length != 1)
										return;

									var form = new FormData();//form을 대신할 도구
									form.append("attach", files[0]);

									$
											.ajax({
												processData : false,//파일업로드를 위해 반드시 필요한 설정
												contentType : false,//파일업로드를 위해 반드시 필요한 설정
												url : "http://localhost:8080/rest/board/upload",
												method : "post",
												data : form,
												success : function(response) {//첨부파일번호(attachmentNo)
													//첨부파일 번호를 이용해서 src생성
													//http://localhost:8080/attachment/download?attachmentNo=번호
													var tag = $("<img>").attr(
															"src",
															"http://localhost:8080/attachment/download?attachmentNo="
																	+ response)

													.addClass("summernote-img");
													$("[name=chapterDetail]")
															.summernpte(
																	"insertNode",
																	tag[0]);
												}
											});
								},
							},
						});
	});
</script>

<div class="container">

	<!-- 작품 미리보기 -->
	<div class="container mt-4 my-2">
		<div class="row align-items-center">
			<div class="col-md-3 text-center a">
				<img src="/work/image?workNo=${workDto.workNo}"
					class="img-fluid rounded " style=""200">
			</div>
			<div class="col-md-9">
				<h3 class="fw-bold">${workDto.workName}</h3>
				<p class="mb-1">
					<strong>태그:</strong> ${workDto.workPrefer}
				</p>
				<p class="mb-1">
					<strong>작품 설명:</strong> ${workDto.workSubtotal}
				</p>
				<p class="text-muted">
					<strong>작성자:</strong> ${workDto.workId}
				</p>
			</div>
		</div>
	</div>
	<hr>


	<form action="add" method="Post" class="needs-validation">
		<input type="hidden" name="workNo" value="${workNo}">

		<div class="row mt-4">
			<div class="col-sm-12">
				<input type="text" name="chapterTitle" class="form-control"
					placeholder="소제목을 입력해주세요. (최대 60자 까지 입력가능)">
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">필수조건입니다</div>
			</div>
		</div>
		s
		<div class="row mt-3">
			<div class="col">
				<p class="fs-6">* 글 번호는 자동으로 생성됩니다. 소제목에 회차 번호를 입력하시면 중복 표기될 수
					있습니다.</p>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-sm-12">
				<textarea name="chapterDetail" class="form-control"
					placeholder="내용입력" rows="11"></textarea>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback">필수조건입니다</div>
			</div>
		</div>

		<div class="row mt-4">
			<div class="col-sm-12">
				<textarea type="text" name="chapterComment" class="form-control"
					placeholder="작가의 말을 입력해주세요" rows="6"></textarea>
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