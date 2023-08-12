<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/login.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	
	<div class="nav">
		<ul>
			<li><a class="nav-title" href="main.jsp">JSP 게시판</a></li>
			<li><a href="main.jsp">메인</a></li> 
			<li><a href="bbs.jsp">게시판</a></li>
			<li style="float:right"><a href="#" style="cursor: default">로그인을 해주세요.</a></li> 
			<li style="float:right"><a href="login.jsp">로그인</a></li>
			<li style="float:right"><a href="join.jsp">회원가입</a></li>
		</ul>
	</div>
		<div class="login">
        <h2 class="title">로그인</h2>
		<form method="post" action="loginAction.jsp">
                <div class="user">
                    <input type="text" name="userID" maxlength="20">
                    <label>아이디</label>
        			<span></span>
                </div>
                <div class="user">
                    <input type="password" name="userPassword" maxlength="20">
                    <label>비밀번호</label>
        			<span></span>
                </div>
				<input type="submit" value="로그인">
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>