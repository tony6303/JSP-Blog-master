<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../layout/header.jsp" %>

<!-- x-www-form-urlencoded -->
<div class="container">
	<form action="/blog/user?cmd=login" method="post">
		<div class="form-group">
			<input type="text" id="username" name="username" class="form-control"
				placeholder="Enter Username" autocomplete="off" required/>
		</div>

		<div class="form-group">
			<input type="password" name="password" class="form-control"
				placeholder="Enter Password" required />
		</div>
		<button type="submit" class="btn btn-primary">로그인완료</button>
	</form>
</div>
</body>
</html>