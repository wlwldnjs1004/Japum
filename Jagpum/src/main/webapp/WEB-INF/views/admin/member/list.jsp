<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp" />


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





<div class="row mt-4">
	<div class="col">
		<div class="bg-dark text-light p-4 rounded">
			<h1>미완성 페이지</h1>
		</div>
	</div>
</div>

<c:forEach var="memberDto" items="${list}">

<table class="table table-hover">
<thead>
<tr>
<!-- <th>회원 이미지</th> -->
<th>회원 아이디</th>
<th>회원 등급</th>
<th>회원 이메일</th>
<th>회원 가입일</th>
<th>성별</th>
</tr>
</thead>
<tbody>
<tr>
<td>${memberDto.memberId}</td>
<td>${memberDto.memberLevel}</td>
<td>${memberDto.memberEmail}</td>
<td>${memberDto.memberItem}</td>
<td>${memberDto.memberGender==N?'남자':'여자'}</td>
</tr>
</tbody>
</table>


</c:forEach>




<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp" />




