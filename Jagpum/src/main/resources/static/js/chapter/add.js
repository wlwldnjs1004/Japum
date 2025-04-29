/*글자 수를 카운트 하기 위한 jQery*/
/*$(function () {
  $("[name=chapterDetail]").on("input", function () {
	const text = $(this).val();
	$(".sss span").text(text.length);
  });
});*/
let inputValue = "";

$(function() {
	const $input = $("[name=chapterDetail]");
	$input.on("keydown", function(e) {
		if (e.key.length === 1) {
			inputValue += e.key;
		} else if (e.key === "Backspace") {
			inputValue = inputValue.slice(0, -1);
		}

		$(".sss span").text(inputValue.length);
	});
	// input이 바뀌면 val 기준으로 초기화 (실제 텍스트와 동기화)
	$input.on("input", function() {
		inputValue = $(this).val();
		$(".sss span").text(inputValue.length);
	});


$(function() {
	$("[name=chapterDetail]")
		.summernote(
			{
				height: 250,
				minHeight: 200,
				maxHeight: 400,
				toolbar: [
					["font", ["fontsize"]],
					["style", ["bold", "italic", "underline", "strikethrough"]],
					["attach", ["picture"]]
				],
				placeholder: "내용",
				callbacks: {
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
				height: 250,//높이(px)
				minHeight: 200,//최소 높이(px)
				maxHeight: 400,//최대 높이(px)
				toolbar: [
					["font", ["fontsize"]],
					["style", ["bold", "italic", "underline", "strikethrough"]],
					["attach", ["picture"]]
				],
				placeholder: "작가의말",
				callbacks: {
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
			return  this.chapterTitle && this.chapterDetail;
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
			const regex = /^[a-z|A-Z|가-힣|ㄱ-ㅎ|ㅏ-ㅣ]{1,60}$/;
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



