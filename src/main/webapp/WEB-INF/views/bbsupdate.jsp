<%@page import="mul.cam.a.dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS 글 수정</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%
    BbsDto dto = (BbsDto)request.getAttribute("dto");
%>

<h1>BBS 글 수정</h1>

<form action="bbsupdateAf.do" method="post">

	<div align="center">

		<table class="table" style="width: 50%">
			<col width="70">

			<thead class="thead-dark">
        <input type="hidden" name="seq" value="<%= dto.getSeq() %>">
        <tr>
            <th style= "vertical-align: middle; text-align: center;">제목</th>
            <td><input type="text" class="form-control" id="title" name="title" value="<%=dto.getTitle() %>"></td>
        </tr>
        <tr>
            <th style= "vertical-align: middle; text-align: center;">내용</th>
            <td><textarea class="form-control" id="content" name="content" rows="10"><%=dto.getContent() %></textarea></td>
        </tr>
        <tr>
            <td style="text-align: center;" colspan="2">
                <button type="submit" class="btn btn-outline-dark" >수정</button>
            </td>
        </tr>
    </table>
    </div>
</form>

</body>
</html>
