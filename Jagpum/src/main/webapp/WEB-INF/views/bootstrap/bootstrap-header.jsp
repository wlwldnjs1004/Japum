<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>부트스크랩 래이아웃 배우기</title>

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
  body {
    font-family: 'Noto Sans KR', sans-serif;
    padding-top: 70px;
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

  .navbar-brand {
    font-weight: bold;
    font-size: 1.3rem;
    color: #ffffff !important;
  }

  .form-control::placeholder {
    color: #ccc;
    font-size: 0.85rem;
  }

  .dropdown-menu {
    font-size: 0.9rem;
  }
</style>

<nav class="navbar navbar-expand-lg fixed-top navbar-dark">
  <div class="container-fluid">

    <!-- 로고 -->
    <a class="navbar-brand" href="${pageContext.request.contextPath}/">KH문학</a>

    <!-- 반응형 메뉴 토글 -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent"
      aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- 메뉴 및 검색창 -->
    <div class="collapse navbar-collapse" id="navbarContent">
      <!-- 왼쪽 메뉴 -->
      <ul class="navbar-nav me-auto">
        <c:if test="${sessionScope.userLevel == '관리자'}">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">관리</a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/home">관리자 페이지</a>
              <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/work/add">E북 관리</a>
            </div>
          </li>
        </c:if>
       <li class="nav-item dropdown">
      <form class="d-flex mx-auto mt-3" action="${pageContext.request.contextPath}/search" method="get">
        <input class="form-control form-control-sm me-2" type="search" name="keyword" placeholder="작품명 검색">
        <button class="btn btn-outline-light btn-sm" type="submit">검색</button>
      </form>
</li>
        <c:if test="${sessionScope.userId != null}">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">책 관리</a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="${pageContext.request.contextPath}/work/list">내 책 리스트</a>
              <a class="dropdown-item" href="${pageContext.request.contextPath}/work/add">책 등록</a>
            </div>
          </li>
        </c:if>
      </ul>

      <!-- 가운데 검색창 -->
      

      <!-- 오른쪽 유저 메뉴 -->
      <ul class="navbar-nav">
        <c:choose>
          <c:when test="${sessionScope.userId != null}">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                <i class="fa-solid fa-user"></i> ${sessionScope.userId} 님
              </a>
              <div class="dropdown-menu dropdown-menu-end">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/member/mypage">마이페이지</a>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
              </div>
            </li>
          </c:when>
          <c:otherwise>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/member/login">
                <i class="fa-solid fa-right-to-bracket"></i> 로그인
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/member/join">
                <i class="fa-solid fa-user"></i> 회원가입
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

