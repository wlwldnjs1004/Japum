
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

/*document.addEventListener("DOMContentLoaded", function() {
  var input = document.querySelector('#workPrefer');
  new Tagify(input);
});*/
document.addEventListener("DOMContentLoaded", function() {
  var input = document.querySelector('#workPrefer');
  var tagify = new Tagify(input, {
    animationDuration: 0,
    dropdown: {
      enabled: 0
    }
  });

  tagify.on('add', function(e) {
    let tag = e.detail.data.value;
    if (!tag.startsWith('#')) {
      // # 없으면 자동 추가
      let newValue = '#' + tag;
      tagify.removeTag(tag); // 기존 태그 삭제
      tagify.addTags([newValue]); // #붙은 태그 새로 추가
    }
  });
});

/*const input = document.getElementById('tagInput');
const list = document.getElementById('tagList');

input.addEventListener('keydown', function(e) {
  if (e.key === ' ' || e.key === 'Enter') {
    const value = input.value.trim();
    
    if (value.length > 0) { // 글자가 있는 경우만
      let finalValue = value;
      
      if (!finalValue.startsWith('#')) { // # 없으면 강제로 붙여
        finalValue = '#' + finalValue;
      }
      
      const tag = document.createElement('span');
      tag.textContent = finalValue;
      tag.className = 'tag';
      tag.style.marginRight = '8px';
      tag.style.padding = '5px 10px';
      tag.style.background = '#e0e0e0';
      tag.style.borderRadius = '20px';
      tag.style.display = 'inline-block';
      
      list.appendChild(tag);
      input.value = ''; // 입력창 비워
    }
    e.preventDefault();
  }
});*/

