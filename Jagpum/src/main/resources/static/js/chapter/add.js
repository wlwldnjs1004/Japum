/*글자 수를 카운트 하기 위한 jQery*/
$(function () {
  $("[name=chapterDetail]").on("input", function () {
    const text = $(this).val();
    $(".sss span").text(text.length);
  });
});
