<%@page import="mul.cam.a.dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<style type="text/css">
	pre{
	white-space: pre-wrap;
	word-break:break-all;
	overflow: auto;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%
	BbsDto dto = (BbsDto) request.getAttribute("bbs");

	String id = dto.getId();
	String title = dto.getTitle();
	String content = dto.getContent();
	int seq = dto.getSeq();
	%>


	<h1>상세 글보기</h1>
	<hr>
	<div id="app" class="container">

		<table class="table" style="width: 1000px">
			<colgroup>
				<col style="width: 80px" />
				<col style="width: 500px" />
			</colgroup>

			<thead class="thead-dark">
				<tr>
					<th style="text-align:center;">작성자</th>
					<td><%=id%></td>
				</tr>

				<tr>
					<th style="text-align:center;">작성일</th>
					<td><%=dto.getWdate()%></td>
				</tr>
				<tr>
					<th style="text-align:center;">조회수</th>
					<td><%=dto.getReadcount()%></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: 22px;font-weight: bold;"><%=title%></td>
				</tr>
				<tr>
					<td colspan="2" style="background-color: white;">
					<pre style="font-size: 20px;font-family: 고딕, arial;background-color: white"><%=content%></pre></td>
				</tr>
			</thead>
		</table>

		<br>
		
		<div class="d-flex justify-content-end" >
			<button style ="margin: 3px;" "type="button" onclick="answerBbs(<%=dto.getSeq()%>)"
				class="btn btn-outline-dark">답글</button>

			<button style ="margin: 3px;" type="button" onclick="location.href='bbs?param=bbslist'"
				class="btn btn-outline-dark">글목록</button>


			<button style ="margin: 3px;" type="button"
				onclick="location.href='bbsupdate.do?seq=<%=seq%>'"
				class="btn btn-outline-dark">수정</button>



			<button style ="margin: 3px;" type="button"
				onclick="location.href='bbsudelete.do?seq=<%=seq%>'"
				class="btn btn-outline-dark">삭제</button>
		</div>
	</div>



</body>
</html>
