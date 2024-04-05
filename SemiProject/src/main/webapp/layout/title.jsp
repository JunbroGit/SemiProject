<%@page import="data.dao.SemiMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	div.btnlog{
		position: absolute;
		top: 50px;
		right: 100px;
	}
	i{
		color: gray;
	}
</style>
</head>  
<%
	//프로젝트 경로
	String root=request.getContextPath();

	
%>
<body>
	<a href="<%=root%>" style="color: black;"><img src="<%=root%>/image/semi/logo3.png" style="width: 200px;"  ></a>
<div class="btnlog">
	<%
		//로그인 세션얻기
		String loginok=(String)session.getAttribute("loginok");
		
		//아이디얻기
		String myid=(String)session.getAttribute("myid");
		
		SemiMemberDao dao=new SemiMemberDao();
		String name=dao.getName(myid);
		
		if(loginok==null)
		{%>
			<a href="index.jsp?main=login/loginForm.jsp"><i class="bi bi-door-open fs-2"></i></a>
	    	<a href="index.jsp?main=member/addform.jsp"><i class="bi bi-person-plus fs-2"></i></a>	
		<%}else{%>
			<b style="font-size: 15pt; color: gray;"><%=name %>님 로그인상태..</b>
			<a href="login/logoutAction.jsp"><i class="bi bi-door-open-fill fs-2"></i></a>
			
		<%}
	
	%>


	
	
</div>
</body>
</html>