<%@page import="multi.erp.board.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
		
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
		<script
			src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
			
			
		<script type="text/javascript">
			//자바스크립트에서 컨트롤러에서 공유한 데이터를 꺼내기
			
			category = "${category}"; //EL표기법으로 공유한 데이터를 꺼내기
			//alert(categroy);
			//category설정하기
			$(document).ready(function(){
				$("#category").val(category).attr("selected","selected")
				//<select>에서 선택기 바뀔때마다 change이벤트발생 -> change이벤트가 발생하면 /board/list/do를 호출하면서 category파라미터를 넘김
				$("#category").change(function(){
					location.href="/erp/board/noticelist.do?category="
																+encodeURI($(this).val())
				});
			});
		</script>
		
		
		
	
	
	    <style>
	    	#board{
	    		margin-left: auto;
	    		margin-right: auto;
	    	}  
	    </style>
	
	  </head>
	  
	  
	<body>
	<% ArrayList<BoardVO> noticelist = (ArrayList<BoardVO>)request.getAttribute("noticelist");
	int size = noticelist.size();
	%>
	
		<main>
		  <!-- <div class="container marketing"> -->
		    <div class="row" >
		    
		      <div class="col-lg-1">
				<!-- <div style="width:100%;height:1000px; background-color: blue;">
					<h2>여백</h2>
				</div> -->
		      </div>
		      
		      <div class="col-lg-10">
				<div style="width:100%;height:1000px; background-color: whithe; margin-top: 150px">
					
					<h3>공지사항</h3>
					<div style="padding-top: 30px; width:95%" id="board">
					
						<table class="table">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>카테고리</th>
									<th>작성자</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody>
								 <%for(int i=0;i<size;i++){
									BoardVO board = noticelist.get(i);
								%>
									<tr>
										<td><%=board.getBoard_no() %></td>
										<td><a href="/webproject/board/noticeread.do?board_no=<%= board.getBoard_no()%>&state=READ"><%= board.getTitle() %></a></td>
										<td><%= board.getCategory() %></td>
										<td><%=board.getId() %></td>
										<td><%=board.getWrite_date() %></td>
									</tr>
								<%} %> 
								
									
							</tbody>
						</table>
					
					
					
					
						<form action="/webproject/board/search.do">
							<select name="tag">
								<option value="id">작성자</option>
								<option value="title">제목</option>
								<option value="content">본문</option>
								<option value="write_date">작성일</option>
							</select> <input type="text" name="search" /> <input type="submit" value="검색">
							<ul class="navbar-nav" style="float: right;">
								<li class="nav-item"><a href="/webproject/noticeinsertPage.do" style="text-align: right;">글쓰기</a></li>
							</ul>
							
							<!-- <ul class="navbar-nav" style="float: right;">
								<li class="nav-item"><a href="/erp/board/insertPage.do" style="text-align: right;">글쓰기</a></li>
							</ul> -->
						</form>
						
						
						
					</div>
					
					
				</div>
		      </div>
		     </div>
		      
		     
		      <hr class="featurette-divider">
		      
		    
		    
		    
		  <footer class="container">
		    <p class="float-end"><a href="#">Back to top</a></p>
		    <p>&copy; Multi campus, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
		  </footer>
		</main>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
		
	</body>
</html>