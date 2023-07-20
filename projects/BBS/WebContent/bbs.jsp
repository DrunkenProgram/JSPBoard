<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
<style type="text/css">
	a{
		color: #000000;
		text-decoration: none;
	}
	a:HOVER{
		color: #073723;
		text-decoration: none;
		background-color: #F8C8DC;
	} 
</style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;//현재 페이지 번호
		int countList = 10;//한 페이지에 출력될 게시물 수
		int countPage = 10;//한 화면에 출력될 페이지 수
		int totalCount = 1;//총 게시물 수
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		BbsDAO bbsDAO = new BbsDAO();
		ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
		totalCount = bbsDAO.getPageCnt(totalCount);

		int totalPage = totalCount/countList;
		if(totalCount > countList * totalPage){
			totalPage++;
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expended="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판</a></li>
			</ul>
			<% 
				if(userID == null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#" style="cursor:default">로그인을 해주세요.</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
						aria-housepopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				}else{
			%>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#" style="cursor:default">${userID}님, 환영합니다!</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
						aria-housepopup="true" aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일시</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(int i = 0; i < list.size(); i++){
				%>
					<tr>
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsID() %></a></td>
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getUserID() %></a></td>
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsDate().substring(0, 4) + "-" +
								list.get(i).getBbsDate().substring(5, 7) + "-" + 
								list.get(i).getBbsDate().substring(8, 10) + "  " + 
								list.get(i).getBbsDate().substring(11, 13) + ":" + 
								list.get(i).getBbsDate().substring(14, 16) + ":" +
								list.get(i).getBbsDate().substring(17, 19) + ""  %></a></td>
					</tr>
				<%
					}
				%>
				</tbody>
			</table>
			<div class="text-center">
			<ul class="pagination">
			<% 
				int startPage = ((pageNumber - 1) / countPage) * countPage + 1;
				int endPage = startPage + countPage - 1;
				if (endPage > totalPage) {
				    endPage = totalPage;
				}
				if (totalPage > 1) {
			%>
				<li><a href="bbs.jsp?pageNumber=1" class="btn btn-success btn-arrow-left">≼</a></li>
			<%
				}
				if(pageNumber > 1){
			%>
				<li><a href="bbs.jsp?pageNumber=<%= pageNumber - 1%>" class="btn btn-success btn-arrow-left">≺</a></li>
			<%
				}
				for (int iCount = startPage; iCount <= endPage; iCount++) {
			%>
				<li><a href="bbs.jsp?pageNumber=<%= iCount %>" class="btn btn-success btn-arrow-left"><%= iCount %></a></li>
			<%
				}
				if(pageNumber < totalPage){
			%>
				<li><a href="bbs.jsp?pageNumber=<%= pageNumber + 1%>" class="btn btn-success btn-arrow-left">≻</a></li>
			<%
				}
				if (totalPage > 1) {
			%>
				<li><a href="bbs.jsp?pageNumber=<%= totalPage %>" class="btn btn-success btn-arrow-left">≽</a></li>
			<%
				}
			%>
			</ul>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기 </a>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>