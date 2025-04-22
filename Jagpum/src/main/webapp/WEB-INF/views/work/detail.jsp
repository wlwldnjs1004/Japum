<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
.drag-prevent {
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select: none;
}
.s{
display: flex;
}

.picture-book{
box-shadow:0 0 1px 1px #bdc3c7;
}

.aa{
 color:black ;
   text-decoration:none;
    }

</style>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<div class="container drag-prevent">


	<div class="row mt-4">
		<div class="col">
			<div class="row">
				<div class="col-12">
					<img src="image?workNo=${workDto.workNo}" width="200"
					class="picture-book">
				</div>
			</div>
			<div class="row ">
				<div class="col-12">
					<c:choose>
						<c:when test="${workDto.workBook =='Y'}">
					<b>${workDto.workName} [E]북</b>
					</c:when>
						<c:otherwise>
							<label>${workDto.workName} </label>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="row">
				<div class="col-12">작가:${workDto.memberNickname}</div>
			</div>
		</div>


		<div class="row ">
			<div class="col">
				<label class=""style="height: 50px"></label>
			</div>
		</div>


		<div class="my-3 mt-1"></div>

		<hr>
		<form class="form-check" action="deleteAll" method="post">
			<c:choose>
				<c:when test="${empty chapterList}">
					<p class="text-muted">페이지 없음</p>
				</c:when>
				<c:otherwise>

					<h3 class="my-2">챕터 목록</h3>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>챕터 번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th><input type="checkbox" class="check-all"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="chapter" items="${chapterList}">
								<tr>
									<td>${chapter.chapterOrder}</td>
									<td><a href="/chapter/detail?chapterNo=${chapter.chapterNo}"
									class="aa">
											${chapter.chapterTitle} </a></td>
									<td>${chapter.chapterModified}</td>
									<td><input type="checkbox" class="check-item"
										name="chapterNo" value="${chapter.chapterNo}"></td>
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
						class="btn btn-primary ">작품 삭제</a>
					<a href="/work/edit?workNo=${workDto.workNo}"
						class="btn btn-primary">수정하기</a>

				</div>
			</div>
	</div>

<!-- 					<button class="btn btn-danger" id="checkCount">채크항목 삭제</button> -->
	</form>

</div>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>