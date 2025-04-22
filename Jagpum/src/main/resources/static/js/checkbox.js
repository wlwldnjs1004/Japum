$(function() {
	//체크박스 모듈화
	//[1] .check-all 선택 시 .check-item으로 상태 전파
	//[2] .check-item 선택 시 .check-all에 대한 체크 여부 검토
	$(".check-all").on("input", function() {
		//this의 체크 상태를 모든 체크박스로 전파
		const isCheck = $(this).prop("checked");
		$(".check-all, .check-item").prop("checked", isCheck);


		const initChecked = $(".check-item:checked").length;
		$("#checkCount").text("선택된 항목:" + initChecked + "개");

	});
	$(".check-item").on("input", function() {
		const all = $(".check-item").length;
		//var checked = $(".check-item:checked").length;
		const checked = $(".check-item").filter(":checked").length;
		const allCheck = all == checked;

		$(".check-all").prop("checked", allCheck);

		const initChecked = $(".check-item:checked").length;
		$("#checkCount").text("선택된 항목:" + initChecked + "개");

	});
});