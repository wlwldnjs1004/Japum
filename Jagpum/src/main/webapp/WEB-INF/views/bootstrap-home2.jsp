<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.img-fixed {
  width: 160px;
  height: 160px;
  object-fit: cover;
}


.drag-prevent{
    -ms-user-select: none;
    -moz-user-select: -moz-none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    user-select: none; 
}

body {
  background-color: #f4f5f7;
  font-family: 'Noto Sans KR', sans-serif;
  margin: 0;
  padding: 0;
}

.section-box {
  background-color: #ffffff;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  margin-bottom: 40px;
}
</style>
    
    
    <body class="drag-prevent">

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<div class="container mt-5">
  <div class="section-box">
    <h2 class="mb-3">작품 목록</h2>
    <p>여기에 작품 카드나 리스트를 출력하세요.</p>
  </div>
</div>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>

</body>