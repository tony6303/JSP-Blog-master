<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>LeeDaeYeob JSP 블로그</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<!-- Links -->
		<a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">블로그</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<c:choose>
			<c:when test="${sessionScope.principal != null}">
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/user?cmd=updateForm&id=${sessionScope.principal.id}">회원정보수정</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/user?cmd=logout">로그아웃</a>
						</li>
						<li class="nav-item nav-link">현재 로그인 중 : ${sessionScope.principal.username }
						</li>
					</ul>
				</div>
			</c:when>
			<c:otherwise>
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/user?cmd=joinForm">회원가입</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/user?cmd=loginForm">로그인</a></li>
					</ul>
				</div>
			</c:otherwise>
		</c:choose>
	</nav>
	<br>