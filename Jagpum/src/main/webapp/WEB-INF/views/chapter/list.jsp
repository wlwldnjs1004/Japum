<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<style>
.munpia-table {
	width: 100%;
	border-collapse: collapse;
}

.munpia-table thead {
	background-color: #f5f5f5;
	font-weight: bold;
}

.munpia-table th, .munpia-table td {
	padding: 12px 16px;
	border: none;
	font-size: 14px;
}

.munpia-table tbody tr {
	border-bottom: 1px solid #ddd;
}

.munpia-table tbody tr:last-child {
	border-bottom: none;
}

.munpia-table td {
	color: #333;
}

.munpia-table th {
	text-align: center;
}

.munpia-table td {
	text-align: center;
}

.a {
	color: inherit; /* 부모 요소 글자 색 따라감 */
	text-decoration: none;
}
</style>


<div class="row mt-4">
	<div class="col">
		<div class="table-responsive text-nowrap">
			<table class="munpia-table">
				<thead class="text-center">
				</thead>
				<tbody class="text-center">
					<tr>
						<c:forEach var="chapterDto" items="${list}">
							<td style="width: 20%;">${chapterDto.chapterNo}</td>
							<td style="width: 40%;">
							<a class="a" href="detail?chapterNo=${chapterDto.chapterNo}">
									${chapterDto.chapterTitle} 
									</a>
									</td>
							<td>${chapterDto.chapterModified}</td>

						</c:forEach>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>



<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>