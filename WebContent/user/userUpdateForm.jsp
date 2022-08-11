<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../layout/header.jsp" %>
<%  request.getAttribute("principal"); %>

<div class="container">
	<form action="/blog/user?cmd=userUpdate" method="post">
	<input type="hidden" name="id" value="${dto.id}" />
		<div class="form-group">
			Username
			<input type="text" id="username" name="username" class="form-control"
				value="${dto.username }" autocomplete="off" />
		</div>

		<div class="form-group">
			Email
			<input type="email" id="email" name="email" class="form-control"
				  value="${dto.email }" autocomplete="off" />
		</div>
		<div class="form-group">
			Address
			<input type="text" id="address" name="address" class="form-control"
				  value="${dto.address }" autocomplete="off" />
		</div>
		<button type="submit" class="btn btn-primary">회원정보 수정</button>
	</form>
</div>
</body>
</html>