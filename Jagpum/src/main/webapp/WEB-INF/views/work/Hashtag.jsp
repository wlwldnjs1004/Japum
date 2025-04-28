<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>


<div class="row mt-3">
	<div class="col">

		<!--점보트론-->
		<div class="row mt-4">
			<div class="col">
				<div class="bg-dark text-light p-4 rounded">
					<h1>태그 검색창</h1>
				</div>
			</div>
		</div>
		
		<div class="row mt-4">
			<div class="col">
				<form action="Hashtag" method="post">
					<input type="text" name="column" class="form-control"> 
				<button class="btn btn-primary">검색</button>
				</form>
			</div>
		</div>




	</div>
</div>












<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>