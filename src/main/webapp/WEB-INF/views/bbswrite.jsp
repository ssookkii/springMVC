<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>BBS Write</title>
</head>

<body>

<hr>
<br>
<h2 style="text-align:center;">게시글 보기</h2>
<br>
<hr>
<div style="margin: 0 auto; width: 30%; text-align: center;">
	<form method="post" action="bbswrite.do">
		<div class="form-group">
			<label for="id">작성자</label>
			<input type="text" class="form-control" id="id" name="id" value="${sessionScope.login.id}" readonly>
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" class="form-control" name="title" id="title" required>
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" name="content" id="content" style="height: 200px;" required></textarea>
		</div>
		<button type="submit" class="btn btn-outline-info">글쓰기</button>
	</form>
</div>
</body>
</html>
