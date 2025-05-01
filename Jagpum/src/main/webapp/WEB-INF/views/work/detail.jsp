<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<div class="container-lg pt-4 pb-5 drag-prevent" style="margin:3px; padding:10px ;">


<link rel="stylesheet" href="/css/work/detail.css">
<!-- 		<form class="d-flex mt-5 my-1" action="list">
			<div class="input-group">
				<input class="form-control w-75" type="search" placeholder="검색어 입력" name="keyword" aria-label="Search">
				<button class="btn btn-outline-success text-nowrap" type="submit">검색</button>
			</div>
			</form> -->


	<div class="row align-items-center mb-3">
		<div class="col-auto">
			<img src="image?workNo=${workDto.workNo}" class="picture-book">
		</div>
	    <div class="col">
                <c:choose>
                  <c:when test="${workDto.workBook =='Y'}">
             <div class="col"></div>
              <div class="col-auto  mb-5 mt-5">
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
        
		<hr class="hr-uniform" />
		<div class="col-md-12 mt-2 change-size text-name text-name" >${workDto.workSubtotal}</div>
		
		<div class="mt-4"></div>
	</div>

	
	<hr class="hr-uniform">
	<div class="my-3 mt-1"></div>

	<div class="row mt-4">
		<div class="col-md-12"></div>
	</div>
	
	<form class="form-check" action="deleteAll" method="post">
		<c:choose>
			<c:when test="${empty chapterList}">
				<p class="text-muted">페이지 없음</p>
			</c:when>
			<c:otherwise>

				<h4 class="text-name mt-4 hi">챕터 목록</h4>
						<c:forEach var="chapter" items="${chapterList}">
							<ul class="list-group">
								<li class="list-group-item text-dis">
							    <a href="/chapter/detail?chapterNo=${chapter.chapterNo}" class="aa d-flex justify-content-between align-items-center">
          <span class="chapter-order">${chapter.chapterOrder}</span>
          <span class="chapter-title ellipsis">${chapter.chapterTitle}</span>
          <span class="chapter-date ">${chapter.chapterModified}</span>
        </a>
								 </li>
								</ul>
						</c:forEach>
			</c:otherwise>
		</c:choose>
		
		<div class="my-4"></div>
	<div class="row mt-5">
  <div class="col text-end">
    <a href="/chapter/add?workNo=${workDto.workNo}" class="btn btn-outline-primary">
    <i class="fa-solid fa-pencil me-2"></i>챕터 작성</a>
    <a href="/work/delete?workNo=${workDto.workNo}" class="btn btn-outline-danger">
    <i class="fa-solid fa-eraser me-2"></i>삭제</a>
    <a href="/work/edit?workNo=${workDto.workNo}" class="btn btn-outline-secondary"> 
    <i class="fa-solid fa-file-pen me-2"></i>수정</a>
  </div>
</div>

	</form>
<div style="height: 10px;"></div>
</div>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>