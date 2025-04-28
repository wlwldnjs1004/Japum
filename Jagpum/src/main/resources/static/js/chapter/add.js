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
	$("[name=chapterDetail]")
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
						callbacks: {
						  onImageUpload: function(files) {
						    if (files.length === 0) return;

						    var form = new FormData();
						    for (var i = 0; i < files.length; i++) {
						      form.append("attach", files[i]); // attach가 여러 개 들어감
						    }

						    $.ajax({
						      processData: false,
						      contentType: false,
						      url: "/rest/chapter/uploads", // **여기로**
						      method: "post",
						      data: form,
						      success: function(response) { // response = List<Integer>
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

