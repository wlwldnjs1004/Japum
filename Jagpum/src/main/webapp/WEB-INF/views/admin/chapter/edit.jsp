<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
    <jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<form action="edit" method="post" class="p-3" >
    
	<input type="hidden" name="workNo" value="${chapterDto.workNo}"/>
		<div class="row mt-4">
		<div class="col">
	<label>편당 가격 변경</label>
		</div>
		</div>
		<div class="row mt-4">
			<div class="col-sm-12">
				<input type="text" inputmode="numeric" name="chapterPrice" class="form-control" />
			</div>
		</div>


		<div class="row mt-5">
			<div class="col text-end">
				<button class="btn btn-primary w-25 btn-lg" type="submit">등록</button>
			</div>
		</div>
	</form>
    
    
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>
