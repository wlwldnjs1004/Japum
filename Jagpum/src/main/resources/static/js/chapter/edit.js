/*글자 수를 카운트 하기 위한 jQery*/
$(function() {
	$("[name=chapterDetail]")
		.summernote(
			{

					height: 150,//높이(px)
					minHeight: 1,//최소 높이(px)
					maxHeight: 900,//최대 높이(px)
					toolbar: [
						["font", ["fontname", "fontsize", "fontSizeUnits"]],
							["style", ["bold", "italic", "underline", "strikethrough"]],
							["height",["height"]],
							["insert", ["picture"]]
					],
					fontNames: ['Arial', 'Comic Sans MS', '맑은 고딕', '궁서체', '굴림체','나눔명조','Noto Sans KR','Spoqa Han Sans','Pretendard'],
					fontSizes: ['8', '9', '10', '12', '14', '15', '16', '18', '24', '36', '48'],
					placeholder: "작가의말",
					callbacks: {
						onInit: function() {
										$("[name=chapterDetail]").summernote('code', `<p style="font-family:맑은 고딕;">${chapterDto.chapterDetail}</p>`)
										$('.note-editable').css({
											'font-family': '맑은 고딕',
											'font-size': '16px'
										});
									},
					onImageUpload: function(files) {
						if (files.length === 0) return;

						var form = new FormData();
						for (var i = 0; i < files.length; i++) {
							form.append("attach", files[i]);
						}
						$.ajax({
							processData: false,
							contentType: false,
							url: "/rest/chapter/uploads",
							method: "post",
							data: form,
							success: function(response) {
								for (var i = 0; i < response.length; i++) {
									var tag = $("<img>")
										.attr("src", "/attachment/download?attachmentNo=" + response[i])
										.addClass("summernote-img")
										.attr("data-attachment-no", response[i]);
									$("[name=chapterDetail]").summernote("insertNode", tag[0]);
								}
							}
						});
					},
				},
			});
});
$(function() {
	$("[name=chapterComment]")
		.summernote(
			{
				height: 150,//높이(px)
				minHeight: 1,//최소 높이(px)
				maxHeight: 900,//최대 높이(px)
				toolbar: [
					["font", ["fontname", "fontsize", "fontSizeUnits"]],
						["style", ["bold", "italic", "underline", "strikethrough"]],
						["height",['height']],
						["insert", ["picture"]]
				],
				fontNames: ['Arial', 'Comic Sans MS', '맑은 고딕', '궁서체', '굴림체','나눔명조','Noto Sans KR','Spoqa Han Sans','Pretendard'],
				fontSizes: ['8', '9', '10', '12', '14', '15', '16', '18', '24', '36', '48'],

				placeholder: "작가의말",
				callbacks: {
					onInit: function() {
									$("[name=chapterComment]").summernote('code', `<p style="font-family:맑은 고딕;">${chapterDto.chapterDetail}</p>`)
									$('.note-editable').css({
										'font-family': '맑은 고딕',
										'font-size': '16px'
									});
								},
					onImageUpload: function(files) {
						if (files.length === 0) return;

						var form = new FormData();
						for (var i = 0; i < files.length; i++) {
							form.append("attach", files[i]);
						}
						$.ajax({
							processData: false,
							contentType: false,
							url: "/rest/chapter/uploads",
							method: "post",
							data: form,
							success: function(response) {
								for (var i = 0; i < response.length; i++) {
									var tag = $("<img>")
										.attr("src", "/attachment/download?attachmentNo=" + response[i])
										.addClass("summernote-img")
										.attr("data-attachment-no", response[i]);
									$("[name=chapterComment]").summernote("insertNode", tag[0]);
								}
							}
						});
					},
				},
			});
});


$(function() {
	const status = {
		chapterTitle: false,
		chapterDetail: false,
		ok: function() {
			return this.chapterTitle && this.chapterDetail;
		},
	};

	$("[name=chapterTitle]").on('input', function() {
		let content = $(this).val();
		if (content.length > 60) {
			$(this).val(content.substring(0, 60));
			console.log("60자 초과로 자동 잘림");
		}
	});

	$("[name=chapterTitle]").blur(
		function() {
			const regex = /^[a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ]{1,60}$/;
			const isValid = regex.test($(this).val());

			$(this).removeClass("is-valid is-invalid").addClass(
				isValid ? "is-valid" : "is-invalid");
			status.chapterTitle = isValid;
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




