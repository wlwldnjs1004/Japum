<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>
    
    
    <div class="container">
    
    <form action="join" method="post" class="needs-validation">
    
    <div class="row mt-4">
    <div class="col">
    <input class="form-control" name="memberId">
    </div>
    </div>
    
    <div class="row mt-4">
    <div class="col">
    <input name="memberPw" class="form-control">
    </div>
    </div>
    
    <div class="row mt-4">
    <div class="col">
    <input name="memberNickname" class="form-control">
    </div>
    </div>
    
        <div class="row mt-4">
    <div class="col">
    <input name="memberLevel" class="form-control">
    </div>
    </div>
    
        <div class="row mt-4">
    <div class="col">
    <input name="memberEmail" class="form-control">
    </div>
    </div>
    
    
        <div class="row mt-4">
    <div class="col">
    <input name="memberBirth" class="form-control">
    </div>
    </div>
    
        <div class="row mt-4">
    <div class="col">
    <input name="memberGender" class="form-control">
    </div>
    </div>
    
    
        <div class="row mt-4">
    <div class="col">
<button class="btn btn-success">
<i></i>
회원 가입
</button>
    </div>
    </div>
    
    
    
    
    </form>
    
    
    
    </div>
    
    
    
    
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>