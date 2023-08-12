<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
	%>
	
	<div class="nav">
		<ul>
			<li><a class="nav-title" href="main.jsp">JSP 게시판</a></li>
			<li><a href="main.jsp">메인</a></li> 
			<li><a href="bbs.jsp">게시판</a></li>
			<%
				if (userID == null) {
			%>
			<li style="float:right"><a href="#" style="cursor: default">로그인을 해주세요.</a></li> 
			<li style="float:right"><a href="login.jsp">로그인</a></li>
			<li style="float:right"><a href="join.jsp">회원가입</a></li>
			<%
				} else {
			%>
			<li style="float:right"><a href="#" style="cursor: default">${userID}님, 환영합니다!</a></li> 
			<li style="float:right"><a href="logoutAction.jsp">로그아웃</a></li>
			<%
				}
			%>
		</ul>
	</div>
	<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="3000" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
