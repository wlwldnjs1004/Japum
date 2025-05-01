<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<div class="container-lg pt-4 pb-5 drag-prevent">


<link rel="stylesheet" href="/css/work/detail.css">
<!-- 		<form class="d-flex mt-5 my-1" action="list">
			<div class="input-group">
				<input class="form-control w-75" type="search" placeholder="검색어 입력" name="keyword" aria-label="Search">
				<button class="btn btn-outline-success text-nowrap" type="submit">검색</button>
			</div>
			</form> -->

<!-- 작품 상단 정보 -->
<div class="row mt-3 mb-4">
  <div class="col-md-3 text-center">
    <img src="image?workNo=${workDto.workNo}" class="picture-book mt-3">
  </div>
  <div class="col-md-9">
    <h3 class="fw-bold text-name">${workDto.workName}</h3>
    <p class="text-name">작가: ${workDto.memberNickname}</p>
    <p class="text-name">
      ${workDto.workContract == 'N' ? '비독점' : '독점'} |
      ${workDto.workPaid == 'N' ? '무료' : '유료'}
    </p>
    <span class="badge bg-secondary text-name">
    ${workDto.workGenre}</span>
    <span class="badge bg-secondary text-name">${workDto.workSubGenre}</span>
    <p class="mt-2 text-day text-letter">
      ${workDto.workMon == 'Y' ? '월 ' : ''}
      ${workDto.workTue == 'Y' ? '화 ' : ''}
      ${workDto.workWed == 'Y' ? '수 ' : ''}
      ${workDto.workThu == 'Y' ? '목 ' : ''}
      ${workDto.workFri == 'Y' ? '금 ' : ''}
      ${workDto.workSat == 'Y' ? '토 ' : ''}
      ${workDto.workSun == 'Y' ? '일 ' : ''}
    </p>
  </div>
</div>

<!-- 작품 소개 -->
<hr class="hr-uniform" />
<p class="change-size text-name">${workDto.workSubtotal}</p>
<hr class="hr-uniform" />

<!-- 챕터 목록 -->
<h4 class="text-name mt-4"> 챕터 목록</h4>
<c:choose>
  <c:when test="${empty chapterList}">
    <p class="text-muted">페이지 없음</p>
  </c:when>
  <c:otherwise>
    <ul class="list-group">
      <c:forEach var="chapter" items="${chapterList}">
        <li class="list-group-item">
          <a href="/chapter/detail?chapterNo=${chapter.chapterNo}" class="aa">
            <span class="chapter-order">${chapter.chapterOrder}</span>
            <span class="chapter-title">${chapter.chapterTitle}</span>
            <span class="chapter-date">${chapter.chapterModified}</span>
          </a>
        </li>
      </c:forEach>
    </ul>
  </c:otherwise>
</c:choose>

<!-- 버튼 -->
<div class="row mt-5">
  <div class="col text-end">
    <a href="/chapter/add?workNo=${workDto.workNo}" class="btn btn-outline-primary"> 챕터 작성</a>
    <a href="/work/delete?workNo=${workDto.workNo}" class="btn btn-outline-danger"> 삭제</a>
    <a href="/work/edit?workNo=${workDto.workNo}" class="btn btn-outline-secondary"> 수정</a>
  </div>
</div>

<div style="height: 10px;"></div>
</div>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>