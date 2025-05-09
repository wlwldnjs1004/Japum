<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>kh</title>

    <!--google font-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <!-- jQuery-->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!--font awesome cdn-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />


    <link rel="stylesheet" type="text/css"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.3.3/litera/bootstrap.min.css"
        integrity="sha512-TUtnNUXMMWp2IALAR9t2z1vuorOUQL4dPWG3J9ANInEj6xu/rz5fzni/faoEGzuqeY1Z1yGD6COYAW72oiDVYA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />


<style>
.drag-prevent {
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select: none;
}
.custom-dark {
  background-color: e67e22 !important;
}
.navbar {
  background-color: #1a1d23 !important;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); 
}
.nav-link {
  font-size: 0.95rem;
  padding-left: 12px;
  padding-right: 12px;
}
body{

}
.navbar-collapse {
  border: none;
}
.navbar-toggler {
  border: none !important;
  outline: none !important;
  box-shadow: none !important; /* 클릭 시 생기는 효과 제거 */
}
</style>
<script >
$(function(){
	
});
</script>


    <script src="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    
    <script src="${pageContext.request.contextPath}/js/checkbox.js"></script>
    <script type="text/javascript">

    </script>
    </head>

	<body class="drag-prevent">
	   <nav class="navbar navbar-expand-lg bg-dark fixed-top " data-bs-theme="dark">
        <div class="container-fluid">

            <!--좌측 로고(택스트 또는 이미지) -->

            <!--?? 버튼-->

            <a class="navbar-brand" href="/bootstrap">kh</a>

            <!-- 메뉴 펄침 버튼(폭이 작을 때만 나옴)-->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main-menui"
                aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!--실제 매뉴 영역(폭에 따라 보이는 형태가 다름)-->
            <div class="collapse navbar-collapse" id="main-menui">
                <ul class="navbar-nav me-auto">
                             <c:if test="${sessionScope.userLevel=='관리자'}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
                            aria-haspopup="true" aria-expanded="false">
                            <i class="fa-solid fa-server"></i>
                            데이터 관리
                        </a>
                        <div class="dropdown-menu">
                             <!-- <div class="dropdown-divider"></div>  -->
							<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/home">관리자 페이지</a>
                        </div>
                    </li>
                             </c:if>
                        <c:if test="${sessionScope.userId !=null}">
                          <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
                            aria-haspopup="true" aria-expanded="false">
                            책 관리
                        </a>
                        <div class="dropdown-menu">
                        		    <a class="nav-link" href="${pageContext.request.contextPath}/work/list">내 책 리스트</a>
                        		        <a class="nav-link" href="${pageContext.request.contextPath}/work/add">책 등록</a>
                            <!-- <div class="dropdown-divider"></div> -->
				<c:if test="${sessionScope.userLevel =='관리자'}">
					<a class="nav-link" href="${pageContext.request.contextPath}/admin/work/add">E북</a>			
				</c:if>
                        </div>
                    </li>
                        </c:if>
                </ul>
                <!--우측 메뉴-->
                <c:choose>
                <c:when test="${sessionScope.userId !=null}">
                     <ul class="navbar-nav ">
                                <li class="nav-item dropdown me-2">
	                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
	                    aria-haspopup="true" aria-expanded="fasle">
	                    <i class="fa-solid fa-user"></i>
	                    ${sessionScope.userId} 님
	                    </a>
	                    <div class="dropdown-menu">
	                    <c:if test="${sessionScope.userId !=null}">
	                    <a class="dropdown-item" href="${pageContext.request.contextPath}/member/mypage">마이 페이지</a>
	                    <a class="dropdown-item" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
	                    
	                    </c:if>
	                    </div>
	                	</li>
                     </ul>
                </c:when>
                <c:otherwise>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/member/login">
                            <i class="fa-solid fa-right-to-bracket"></i>로그인</a>

                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/member/join">
                            <i class="fa-solid fa-user"></i>회원가입
                        </a>
                    </li>
                </c:otherwise>
                </c:choose>
                </ul>

            </div>
        </div>
    </nav>
 <!--컨테이너-->
    <div class="container mt-5 pt-5">

        <!--점보트론-->
   <!--      <div class="row mt-4">
            <div class="col">
                <div class="bg-dark text-light p-4 rounded">
                    <h1>부트스크랩 래이아웃</h1>
                    <p>설명</p>
                </div>
            </div>
        </div> -->

