<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.img-fixed {
  width: 160px;
  height: 160px;
  object-fit: cover;
  border-radius: 10px;
}

/* 감성 스크롤 디자인 */
ul::-webkit-scrollbar {
  height: 8px;
}
ul::-webkit-scrollbar-thumb {
  background-color: #999;
  border-radius: 4px;
}
ul::-webkit-scrollbar-track {
  background: transparent;
}

.drag-prevent{
    -ms-user-select: none;
    -moz-user-select: -moz-none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    user-select: none;
}
</style>
    
    
    <jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>
    
<%-- 
  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4 mt-4">
    <c:forEach var="workDto" items="${list}">
      <div class="col text-center">
        <a href="/work/detail?workNo=${workDto.workNo}">
          <img src="/work/image?workNo=${workDto.workNo}" class="img-fixed" alt="${workDto.workName}">
        </a>
        <p class="mt-2 fw-bold">${workDto.workName}</p>
      </div>
    </c:forEach>
  </div>
</div>
 --%>
            <div class="" style="height:500px"></div>
     <jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>