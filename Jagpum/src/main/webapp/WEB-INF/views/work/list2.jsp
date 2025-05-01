<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/work/list.css">


<script>
/* var burger=$(".menu-trigger");
 */
</script>





<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<div class="container drag-prevent">


	<form class="d-flex mt-5" action="list">
		<div class="input-group">
			<input class="form-control w-75" type="search" placeholder="검색어 입력"
				name="keyword" aria-label="Search">
			<button class="btn btn-success text-nowrap" type="submit">검색</button>
		</div>
	</form>




	<table class="table table-borderless mb-5">
		<tbody>
			<tr>						
				<td>
					<ul class="list-group mt-4">
							<c:forEach var="workDto" items="${list}">
							<li class="list-group-item sd">
						<div class="row align-items-center">
							    <div class="col-auto">
      <a href="detail?workNo=${workDto.workNo}">
        <img src="/work/image?workNo=${workDto.workNo}" class="img-fixed">
      </a>
    </div>
    
							  <div class="col">
                  <a href="detail?workNo=${workDto.workNo}" class="text-a ">
                    <h5 class="text-name text-name-big mb-1">${workDto.workName}</h5>
                  </a>
                  <p class="text-muted mb-1">${workDto.workSubtotal}</p>
                  <div class="text-name text-secondary">
                     <span class=""> 작가: ${workDto.memberNickname}</span> / <span class="text-name"> 장르: ${workDto.workGenre}</span>
                  </div>
<%--                    <div class="small text-secondary">
                     등록일: <fmt:formatDate value="${workDto.workWtime}" pattern="yyyy-MM-dd"/> 
                     <c:if test="${workDto.workPaid == 'Y'}">|유료</c:if>
                    <c:if test="${workDto.workPaid == 'N'}">|무료</c:if> 
                  </div>
 --%>           			  </div> 
                </div>
							</li>
					</c:forEach>
						</ul>
					</td>
			</tr>
		</tbody>
	</table>


	<div class="row mt-4">
		<div class="col">
			<a class="btn btn-primary"
				href="${pageContext.request.contextPath}/work/add">작품 등록</a>
		</div>
	</div>



</div>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>