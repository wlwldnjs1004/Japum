<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>


  <!-- summernote cdn -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("[name=chapterDetail]").summernote({
                height:250,//높이(px)
                minHeight:200,//최소 높이(px)
                maxHeight:400,//최대 높이(px)

                placeholder:"타인에 대한 무분별한 비방시 예고 없이 삭제될 수 있습니다",

                //메뉴(toolbar)설정
                toolbar:[
                    //['메뉴명',['버튼명','버튼명',...]]
                    ["font",["style","fontname","fontsize","forecolor" ,"backcolor"]],
                    ["style",["bold","italic","underline","strikethrough"]],
                    ["attach",["picture"]],
                    ["tool",["ol","ul","table","hr","fullscreen"]],
                    // ["acion",["undo","redo"]]
                ],

                //상황에 맞는 callback 함수들
                callback:{
                    onlmageUpload:function(files){
                        //예상 시나리오
                        //1.서버로 사용자가 선택한 이미지를 업로드
                        //- 이미지는 multipart/form-data형태여야 한다
                        //- 상황상 form을 쓸 수가 없으므로 ajax를 써야 한다
                        //2.업로드한 이미지에 접근할 수 있는 정보 획득
                        //3.획득한 정보로 <img> 생성
                        //4.에디터에 추가
                        //-$("[name=boardContent]").summernote("insertNode",이미지 태그 객체);
                        // console.log(files);
                        if(files.length !=1)return;

                        var form=new FormData();//form을 대신할 도구
                            form.append("attach",files[0]);

                            $.ajax({
                                processData:false,//파일업로드를 위해 반드시 필요한 설정
                                contentType:false,//파일업로드를 위해 반드시 필요한 설정
                                url:"http://localhost:8080/rest/board/upload",
                                method:"post",
                                data:form,
                                success:function(response){//첨부파일번호(attachmentNo)
                                    //첨부파일 번호를 이용해서 src생성
                                    //http://localhost:8080/attachment/download?attachmentNo=번호
                                    var tag=$("<img>").attr("src","http://localhost:8080/attachment/download?attachmentNo="+response)
                              
                                    .addClass("summernote-img");
                                    $("[name=chapterDetail]").summernpte("insertNode",tag[0]);
                                }
                       });
                    },
                },
            });
        });
    </script>



	<form  action="edit" method="Post" class="p-3 rounded">

<input type="hidden" name="chapterNo" value="${chapterDto.chapterNo}" />
	<input type="hidden" name="workNo" value="${chapterDto.workNo}"/>

		<div class="row mt-4">
			<div class="col-sm-12">
				<input type="text" name="chapterTitle" class="form-control"
					value="${chapterDto.chapterTitle}">
			</div>
		</div>
		<p class="fs-6">* 글 번호는 자동으로 생성됩니다. 소제목에 회차 번호를 입력하시면 중복 표기될 수
			있습니다.</p>
		<div class="row mt-5">
			<div class="col-sm-12">
				<textarea name="chapterDetail" class="form-control" rows="11">${chapterDto.chapterDetail}</textarea>
			</div>
		</div>
		
		<div class="row mt-4">
			<div class="col-sm-12">
				<textarea type="text" name="chapterComment" class="form-control" rows="6">${chapterDto.chapterComment}</textarea>
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