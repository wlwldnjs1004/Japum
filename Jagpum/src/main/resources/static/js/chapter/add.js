/*글자 수를 카운트 하기 위한 jQery*/
/*$(function () {
  $("[name=chapterDetail]").on("input", function () {
    const text = $(this).val();
    $(".sss span").text(text.length);
  });
});*/
let inputValue = "";

$(function () {
  const $input = $("[name=chapterDetail]");
  $input.on("keydown", function (e) {
    if (e.key.length === 1) {
      inputValue += e.key;
    } else if (e.key === "Backspace") {
      inputValue = inputValue.slice(0, -1);
    }
    $(".sss span").text(inputValue.length);
  });

  // input이 바뀌면 val 기준으로 초기화 (실제 텍스트와 동기화)
  $input.on("input", function () {
    inputValue = $(this).val();
    $(".sss span").text(inputValue.length);
  });
});

$(function() {
	$("[name=chapterDetail],[name=chapterComment]")
			.summernote(
					{height : 250,//높이(px)
						minHeight : 200,//최소 높이(px)
						maxHeight : 400,//최대 높이(px)
						toolbar : [
								["font",[ "fontsize"] ],
								["style",[ "bold", "italic", "underline","strikethrough" ] ],
								[ "attach", [ "picture" ] ]
						],
						placeholder : "내용",
						callback : {
							onlmageUpload : function(files) {
								if (files.length != 1)
									return;

								var form = new FormData();//form을 대신할 도구
								form.append("attach", files[0]);

								$.ajax({
											processData : false,//파일업로드를 위해 반드시 필요한 설정
											contentType : false,//파일업로드를 위해 반드시 필요한 설정
											url : "http://localhost:8080/rest/chapter/upload",
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
												$("[name=chapterDetail],[name=chapterComment]")
														.summernpte(
																"insertNode",
																tag[0]);
											}
										});
							},
						},
					});
				});

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

