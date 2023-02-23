
<%@page import="mul.cam.a.util.Utility"%>
<%@page import="mul.cam.a.dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<!DOCTYPE html>
<html>
<style>
/* 페이지네이션 스타일 */
.pagination .page-link {
  background-color: #f8f9fa;   /* 페이지 링크 배경색 */
  border-color: #BABABA;       /* 페이지 링크 테두리 색상 */
  color: #808080;              /* 페이지 링크 글자 색상 */
}

.pagination .page-item.active .page-link {
  background-color: #8A8A8A;   /* 현재 활성화된 페이지 링크 배경색 */
  border-color: #8A8A8A;       /* 현재 활성화된 페이지 링크 테두리 색상 */
  color: #fff;                 /* 현재 활성화된 페이지 링크 글자 색상 */
}

.pagination .page-item.disabled .page-link {
  background-color: #f8f9fa;   /* 비활성화된 페이지 링크 배경색 */
  border-color: #dee2e6;       /* 비활성화된 페이지 링크 테두리 색상 */
  color: #808080;              /* 비활성화된 페이지 링크 글자 색상 */
}

</style>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
  
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

	<script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>


</head>
<body bgcolor="#e9e9e9">

<%

List<BbsDto> list = (List<BbsDto>)request.getAttribute("bbslist");
int pageBbs = (Integer)request.getAttribute("pageBbs");
int pageNumber = (Integer)request.getAttribute("pageNumber");
String choice = (String)request.getAttribute("choice");
String search = (String)request.getAttribute("search");
%>

<h1>게시판</h1>

<hr>




<div style="margin:0 auto; width: 50%; text-align:center;">

<table style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px">
	<tr>
		<td style="padding-left: 5px">
			<select class="custom-select" id="choice" name="choice">
				<option selected>검색</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">작성자</option>
			</select>
		</td>
		<td style="padding-left: 5px" class="align-middle">
			<input type="text" class="form-control" id="search" name="search" placeholder="검색어" value="<%=search %>">
		<td style="padding-left: 5px">
			<span>
				<button type="button" class="btn btn-outline-dark" onclick="searchBtn()">검색</button>
			</span>
		</td>
	</tr>
</table>
<br>
<table class="table" style="width: 1000px">
<col width="70"><col width="600"><col width="100"><col width="150"><col width="200">
<thead class="thead-dark">
<tr>
	<th>번호</th><th>제목</th><th>조회수</th><th>작성자</th><th>작성일</th>
</tr>
</thead>
<tbody>

<%
if(list == null || list.size() == 0){
	%>
	<tr>
		<td colspan="4">작성된 글이 없습니다</td>
	</tr>
	<%
}else{
	
	for(int i = 0;i < list.size(); i++)
	{
		BbsDto dto = list.get(i);
		%>
		<tr>
			<th><%=i + 1 + (pageNumber * 10) %></th>
			
			<%
			if(dto.getDel() == 0){
				%>			
				<td style="text-align: left;">
					<%=Utility.arrow(dto.getDepth()) %>
					<a href="bbsdetail.do?seq=<%=dto.getSeq() %>">
						<%=dto.getTitle() %>
					</a>
				</td>			
				<%
			}else if(dto.getDel() == 1){
				%>
				<td style="text-align: left;">
					<%=Utility.arrow(dto.getDepth()) %>
					<font color="#ff0000">*** 이 글은 작성자에 의해서 삭제되었습니다 ***</font>	
				</td>
				<%
			}	
			%>
			
			<td><%=dto.getReadcount() %></td>
			<td><%=dto.getId() %></td>
			<td><%=dto.getWdate() %>
		</tr>
		<%
	}
}
%>

</tbody>
</table>

<br>
<div>
<%-- <%
for(int i = 0;i < pageBbs; i++){
	if(pageNumber == i){	// 현재 페이지
		%>
		<span style="font-size: 15pt;color: #0000ff">
			<%=i+1 %>
		</span>
		<%
	}else{					// 그밖에 다른 페이지
		%>
		<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
			style="font-size: 15pt; color: #000; text-decoration: none;">
			[<%=i+1 %>]
		</a>			
		<%
	}		
}
%> --%>

<div class="container">
    <nav aria-label="Page navigation">
        <ul class="pagination" id="pagination" style="justify-content:center"></ul>
    </nav>
</div>

</div>
</div>
<br><br>


<script type="text/javascript">

let search = "<%=search %>";
if(search != ""){
	let obj = document.getElementById("choice");
	obj.value = "<%=choice %>";
	obj.setAttribute("selected", "selected");
}

function searchBtn() {
	let choice = document.getElementById('choice').value;
	let search = document.getElementById('search').value;
	
	location.href = "bbslist.do?choice=" + choice + "&search=" + search;
}

function goPage( pageNumber ) {
	let choice = document.getElementById('choice').value;
	let search = document.getElementById('search').value;
	
	location.href = "bbslist.do?choice=" + choice + "&search=" + search + "&pageNumber=" + pageNumber;	
}

$('#pagination').twbsPagination({
	startPage: <%=pageNumber+1%>, 
    totalPages: <%=pageBbs %>,
    visiblePages: 10,
    first:'<span srid-hidden="true">«</span>',
    prev:"이전",
    next:"다음",
    last:'<span srid-hidden="true">»</span>',
    initiateStartPageClick:false,
    onPageClick: function (event, page) {
    	let choice = document.getElementById('choice').value;
    	let search = document.getElementById('search').value;
    	location.href = "bbslist.do?choice=" + choice + "&search=" + search + "&pageNumber=" + (page-1);	
    }
}
);


</script>


</body>
</html>

