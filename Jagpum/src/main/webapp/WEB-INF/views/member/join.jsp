<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>


<div class="container">

	<form action="join" method="post" class="needs-validation">


		<div class="row mt-4">
			<div class="col">
				<label>아이디 입력</label>
			</div>
		</div>


		<div class="row mt-4">
			<div class="col">
				<input type="text" class="form-control" name="memberId">
			<div class="invalid-feedback"></div>
			</div>
		</div>


		<div class="row mt-4">
			<div class="col">
				<label>비밀번호</label>
			</div>
		</div>

		<div class="row mt-4">
			<div class="col">
				<input type="password" name="memberPw" class="form-control">
			<div class="invalid-feedback"></div>
			</div>
		</div>


		<div class="row mt-4">
			<div class="col">
				<label>닉네임</label>
			</div>
		</div>


		<div class="row mt-4">
			<div class="col">
				<input type="text" name="memberNickname" class="form-control">
			<div class="fnvalid-feedback"></div>
			</div>
		</div>


		<div class="row mt-4">
			<div class="col">
				<label>이메일 입력</label>
			</div>
		</div>

		<div class="row mt-4">
			<div class="col">
					<input type="email" name="memberEmail" class="form-control">
			</div>
		</div>



		<div class="row mt-4">
			<div class="col">
				<label>연락처 입력</label>
			</div>
		</div>

		<div class="row mt-4">
			<div class="col">
				<input type="tel" inputmode="tel" name="memberBirth"
					class="form-control">
					<div class="invalid-feedback"></div>
			</div>
		</div>


		<div class="row mt-4">
			<div class="col">
				<label>성별 선택</label>
			</div>
		</div>

		<div class="row mt-4">
			<div class="col">
				<input type="radio" name="memberGender" class="form-control-check"
					value="N"> <span>남자</span> <input type="radio"
					name="memberGender" class="form-control-check" value="Y"> <span>여자</span>
<div class="invalid-feedback"></div>
			</div>
		</div>



		<div class="row mt-4">
			<div class="col">
				<button type="submit" class="btn btn-success">
					<i class="fa-solid fa-user"></i> 회원 가입
				</button>
			</div>
		</div>




	</form>



</div>




<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>