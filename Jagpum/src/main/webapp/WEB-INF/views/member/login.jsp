<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>
    
    <div class="container">
    
       <!--점보트론-->
    <div class="row mt-4">
      <div class="col">
        <div class="bg-dark text-light p-4 rounded">
          <h1>로그인창</h1>
        </div>
      </div>
    </div>
    
    
    <form action="login" method="post" class="needs-validation">
    
        <div class="row mt-4">
    <div class="col">
    <input name="memberId" class="form-control">
    </div>
    </div>
    
        <div class="row mt-4">
    <div class="col">
    <input name="memberPw" class="form-control">
    </div>
    </div>
<div class="row mt-4">
<div class="col">
<button type="submit" class="btn btn-success w-100">
<i class="fa-solid fa-right-to-bracket"></i>
로그인
</button>
</div>
</div>    
    
    </form>
    
    </div>
    
    
    
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>