<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Diphylleia&family=Dongle&family=Noto+Sans+KR:wght@100..900&family=Orbit&family=Stylish&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<title>Insert title here</title>
<style type="text/css">
div.logform {
	width: 500px;
	margin: 0 auto;
	matgin-top: 100px;
}
</style>
</head>

<%
	//세션으로부터 아이디와 체크값을 얻는다
	String myid=(String)session.getAttribute("myid");
	String saveid=(String)session.getAttribute("saveok");

	
	boolean save=true;
	
	if(saveid==null)
	{
		myid="";//아이디저장을 체크하지 않은경우 아이디 없앤다
		save=false;
	}
%>
<body>
	<!--11111  -->
	<div style="margin: 100px 100px;" class="logform">
		<h2 class="alert alert-warning">회원 로그인</h2>
		<br>
		<form action="login/loginAction.jsp" method="post">
			<input type="text" name="id" class="form-control"
				style="width: 200px;" placeholder="아이디" required="required"
				value="<%=myid%>">
			<br> <input type="password" name="pass" class="form-control"
				style="width: 200px;" placeholder="패스워드" required="required">
			<br>
			<button type="submit" class="btn btn-success btn-lg"
				style="width: 200px; height: 40px;">로그인</button>
			<br> <input type="checkbox" name="savechk" <%=save?"checked":"" %>>아이디 저장
		</form>

	</div>
</body>
</html>