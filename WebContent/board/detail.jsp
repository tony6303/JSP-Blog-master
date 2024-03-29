<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<%
	request.getAttribute("principal");
%>

<div class="container">
	<a class="btn btn-secondary" href="javascript:history.back()">뒤로가기</a>
	<c:if test="${sessionScope.principal.id == dto.userId}">
		<a class="btn btn-warning" href="/blog/board?cmd=updateForm&id=${dto.id}">수정</a>
		<button class="btn btn-danger" onClick="deleteById(${dto.id})">삭제</button>
	</c:if>
		
	<br />
	<br />
	<h6 class="m-2">
		작성자 : <i>${dto.username}</i> 조회수 : <i>${dto.readCount}</i>
	</h6>
	<br />
	<h3 class="m-2">
		<b>${dto.title}</b>
	</h3>
	<hr />
	<div class="form-group">
		<div class="m-2">${dto.content}</div>
	</div>

	<hr />

	<!-- 댓글 박스 -->
	<div class="row bootstrap snippets">
		<div class="col-md-12">
			<div class="comment-wrapper">
				<div class="panel panel-info">
					<div class="panel-heading m-2"><b>Comment</b></div>
					<div class="panel-body">
					<input type="hidden" name="userId" value="${sessionScope.principal.id}" />
							<input type="hidden" name="boardId" value="${dto.id}" />
							<textarea id="content" id="reply__write__form" class="form-control" placeholder="write a comment..." rows="2"></textarea>
							<br>
						
							<button onClick="replySave(${sessionScope.principal.id}, ${dto.id})" class="btn btn-primary pull-right">댓글쓰기</button>
						<div class="clearfix"></div>
						<hr />

						<!-- 댓글 리스트 시작-->
						<ul id="reply__list" class="media-list">

				<c:forEach var="reply" items="${replys}">
								<!-- 댓글 아이템 -->
								<li id="reply-${reply.id}" class="media">		
									<div class="media-body">
										<strong class="text-primary">${reply.userId}</strong>
										<p>${reply.content}</p>
									</div>
									<div class="m-2">

										<c:if test="${sessionScope.principal.id == reply.userId }">
											<i onclick="deleteReply(${reply.id})" class="material-icons">delete</i>
										</c:if>
									</div>
								</li>
								</c:forEach>
								

						</ul>
						<!-- 댓글 리스트 끝-->
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- 댓글 박스 끝 -->
</div>
<script src="/blog/js/boardDetail.js"></script>
<!-- 
<script>
	function deleteById(boardId){
		// 요청과 응답	을 json
		var data = {
				boardId: boardId
			}
		// ajax로 delete 요청 (Mehtod : POST)
		/*
		$.ajax({
			type:"POST",
			url: "/blog/board?cmd=delete",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
			
		}).done(function(result){
			console.log(result);
			if(result.status == "ok"){
				location.href="index.jsp";
			}else{
				alert("삭제에 실패하였습니다.");
			}
		});
		*/
		$.ajax({
			type: "post",
			url: "/blog/board?cmd=delete&id="+boardId,
			dataType: "json"
		}).done(function(result){
			console.log(result);
			if(result.statusCode == 1){
				location.href="index.jsp";
			}else{
				alert("삭제에 실패하였습니다.");
			}
		});
	}

	function replySave(userId, boardId){
		
		var data = {
			userId: userId,
			boardId: boardId,
			content: $("#content").val()
		}
		$.ajax({
			type: "post",
			url: "/blog/reply?cmd=save",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(result){
			if(result.statusCode == 1){
				$("#reply__list").prepend("<div>"+data.content+"</div>")
			}else{
				alert("댓글쓰기 실패");
			}
		});
	}
</script>
 -->
</body>
</html>

