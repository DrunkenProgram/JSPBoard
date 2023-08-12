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
<link href="./css/style.css" rel="stylesheet" type="text/css">
<title>JSP 게시판 웹 사이트</title>
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
		<div>
			<table>
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center; width: 5vh;">번호</th>
						<th style="background-color: #eeeeee; text-align: center; width: 50vh;">제목</th>
						<th style="background-color: #eeeeee; text-align: center; width: 20vh;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center; width: 25vh;">작성일시</th>
					</tr>
				</thead>
				<tbody class="table-hover">
				<%
					for(int i = 0; i < list.size(); i++){
				%>
					<tr>
						<td style="width:5vh;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"><%= list.get(i).getBbsID() %></td>
						<td style="width:50vh;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
						<td style="width:20vh;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"><%= list.get(i).getUserID() %></td>
						<td style="width:25vh;  text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"><%= list.get(i).getBbsDate().substring(0, 4) + "-" +
								list.get(i).getBbsDate().substring(5, 7) + "-" + 
								list.get(i).getBbsDate().substring(8, 10) + "  " + 
								list.get(i).getBbsDate().substring(11, 13) + ":" + 
								list.get(i).getBbsDate().substring(14, 16) + ":" +
								list.get(i).getBbsDate().substring(17, 19) + ""  %></td>
					</tr>
				<%
					}
				%>
				</tbody>
			</table>
			<div>
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
			<a href="write.jsp" class="btn_write">글쓰기 </a>
			</ul>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
