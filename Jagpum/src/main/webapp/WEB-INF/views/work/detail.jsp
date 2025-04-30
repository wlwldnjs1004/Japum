<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
  .drag-prevent {
    -ms-user-select: none;
    -moz-user-select: -moz-none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    user-select: none;
  }
  
  .s {
    display: flex;
  }
  
  
  .picture-book {
    box-shadow: 0 0 1px 1px #bdc3c7;
    height: 120px;
    width:120px;
  }


  
  .aa {
    color: black;
    text-decoration: none;
  }
  
  .change-size {
    font-size: 15px;
  }
  
  .text-name{
    font-size:16px;
  }

  .text-day{
   font-size:18px;
  }
  
  .ellipsis {
    font-size:15px;
      display: inline-block;
    width: 250px; /* 반드시 너비를 정해야 작동함 */
    overflow: hidden;  /* 넘치는 부분 숨기기 */
    text-overflow: ellipsis; /* 넘치면 "..."으로 표시 */
    white-space: nowrap; 
  }
  
  @media ( max-width :768px){
  .ellipsis {
  font-size:13px;
    display: inline-block;
    width: 200px; /* 반드시 너비를 정해야 작동함 */
    overflow: hidden;  /* 넘치는 부분 숨기기 */
    text-overflow: ellipsis; /* 넘치면 "..."으로 표시 */
    white-space: nowrap; 
  }
  }
  
  @media (max-width: 768px){
    .change-size {
    font-size: 13px;
  }
  }
  
  @media ( max-width :768px) {
  .text-day{
   font-size:13px;
  }
  }
  @media ( max-width :968px) {
  .text-day{
   font-size:15px;
  }
  }
  

  .text-letter{
    letter-spacing:10px;
  }

  </style>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<div class="container-lg drag-prevent">


		<form class="d-flex mt-5 my-1" action="list">
			<div class="input-group">
				<input class="form-control w-75" type="search" placeholder="검색어 입력" name="keyword" aria-label="Search">
				<button class="btn btn-outline-success text-nowrap" type="submit">검색</button>
			</div>
			</form>


	<div class="row align-items-center mb-3">
		<div class="col-auto">
			<img src="image?workNo=${workDto.workNo}" class="picture-book">
		</div>
	    <div class="col">
                <c:choose>
                  <c:when test="${workDto.workBook =='Y'}">
             <div class="col"></div>
              <div class="col-auto mt-5">
					<div class="col-md-6 mt-1 text-name">작가: ${workDto.memberNickname}</div>
                    <b class="text-name">${workDto.workName}[E]북</b>
                                 <span class="text-name">${workDto.workContract =='N'?'비독점':'독점'}|${workDto.workPaid=='N'?'유료':'무료'}</span>
                           <h5 class="text-name">${workDto.workGenre}${workDto.workSubGenre}</h5>
                   
                    <div class="col ">
                      <span class="text-day text-letter">
						${workDto.workMon == 'Y' ? '월 ' : ''}
                 		${workDto.workTue == 'Y' ? '화 ' : ''}
						${workDto.workWed == 'Y' ? '수 ' : ''}
						${workDto.workThu == 'Y' ? '목 ' : ''}
						${workDto.workFri == 'Y' ? '금 ' : ''}
						${workDto.workSat == 'Y' ? '토 ' : ''}
						${workDto.workSun == 'Y' ? '일 ' : ''}
                      </span>
                      </div>
              </div>
                  </c:when>
                  <c:otherwise>
                         <div class="col"></div>
              <div class="col-auto mt-5 mb-5">

					<div class="col-md-6 mt-1 text-name">작가: ${workDto.memberNickname}</div>
                    <label class="text-name">작품 이름:${workDto.workName}</label>            
                    <span class="text-name">${workDto.workContract =='N'?'비독점':'독점'}|${workDto.workPaid=='N'?'유료':'무료'}</span>
                    <h5 class="text-name">${workDto.workGenre}${workDto.workSubGenre}</h5>
                   
                      <div class="col">
                      <span class="text-day text-letter">
						${workDto.workMon == 'Y' ? '월 ' : ''}
                 		${workDto.workTue == 'Y' ? '화 ' : ''}
						${workDto.workWed == 'Y' ? '수 ' : ''}
						${workDto.workThu == 'Y' ? '목 ' : ''}
						${workDto.workFri == 'Y' ? '금 ' : ''}
						${workDto.workSat == 'Y' ? '토 ' : ''}
						${workDto.workSun == 'Y' ? '일 ' : ''}
                      </span>
                      </div>
                 
       			 </div>
                  </c:otherwise>
                </c:choose>


            </div>
        
		<hr class="" />
		<div class="col-md-12 mt-4 change-size">${workDto.workSubtotal}</div>
	</div>

	<div class="row ">
		<div class="col">
			<label class="" style="height: 50px"></label>
		</div>
	</div>
	
	<div class="my-3 mt-1"></div>

	<div class="row mt-4">
		<div class="col-md-12"></div>
	</div>
	<hr class="">
	
	<form class="form-check" action="deleteAll" method="post">
		<c:choose>
			<c:when test="${empty chapterList}">
				<p class="text-muted">페이지 없음</p>
			</c:when>
			<c:otherwise>

				<h4 class="my-2">챕터 목록</h4>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>챕터 번호</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="chapter" items="${chapterList}">
							<tr>
								<td>${chapter.chapterOrder}</td>
								<td><a href="/chapter/detail?chapterNo=${chapter.chapterNo}"
									class="aa ellipsis"> ${chapter.chapterTitle} </a></td>
								<td>${chapter.chapterModified}</td>
								<c:if test="${chapter.chapterOrder >=30}">
								<td>가격${chapter.chapterPrice}</td></c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
		
		<div class="my-4"></div>
		<div class="row mt-5">
			<div class="col text-end">
				<a href="/chapter/add?workNo=${workDto.workNo}"
					class="btn btn-primary ">챕터 작성</a> <a
					href="/work/delete?workNo=${workDto.workNo}"
					class="btn btn-primary">작품 삭제</a> <a
					href="/work/edit?workNo=${workDto.workNo}" class="btn btn-primary">수정하기</a>
			</div>
		</div>

	</form>

</div>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>