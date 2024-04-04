<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="menu/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="menu/css/menu.css">
<script type="text/javascript" src="menu/js/jquery.js"></script>
<script type="text/javascript" src="menu/js/function.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
#primary_nav_wrap
{
	margin-top: -100px;
	text-align: center; /* 가운데 정렬을 위한 설정 */
	
}

#primary_nav_wrap ul
{
	list-style: none;
    margin: 0 auto; /* 좌우 여백을 자동으로 설정하여 가운데 정렬 */
    padding: 0;
}

#primary_nav_wrap ul a
{
	display:block;
	color:#333;
	text-decoration:none;
	font-weight:700;
	font-size:12px;
	line-height:32px;
	padding:0 15px;
	font-family:"HelveticaNeue","Helvetica Neue",Helvetica,Arial,sans-serif;
}

#primary_nav_wrap ul li
{
	display: inline-block; /* 가로로 배치 */
    position: relative;
}

#primary_nav_wrap ul li.current-menu-item
{
	background:#ddd;
}

#primary_nav_wrap ul li:hover
{
	background:#f6f6f6;
}

#primary_nav_wrap ul ul
{
	display:none;
	position:absolute;
	background:#fff;
	padding:0;
	z-index: 1000;
}

#primary_nav_wrap ul ul li
{
	float:none;
	width: 100%;
}

#primary_nav_wrap ul ul a
{
	line-height:120%;
	padding:10px 15px;
}

#primary_nav_wrap ul li:hover > ul
{
	display:block;
}

#primary_nav_wrap ul ul ul
{
	top:0;
	left:100%;
}
</style>
</head>
<%
	//프로젝트 경로
	String root=request.getContextPath();
%>
<body>
	<%-- <a href="<%=root%>/">메인</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/">로그인</a>&nbsp;&nbsp;&nbsp;
	<a href="index.jsp?main=member/addForm.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/">Q & A</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/">방명록</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/">숲게시판</a>&nbsp;&nbsp;&nbsp;  --%>
	
<nav id="primary_nav_wrap">
<ul>
  <li class="current-menu-item"><a href="#">홈</a></li>
  
  <li><a href="#">벚꽃테마</a>
    <ul>
      <li><a href="#">Sub Menu 1</a></li>
      <li><a href="#">Sub Menu 2</a></li>
      <li><a href="#">Sub Menu 3</a></li>
      <li><a href="#">Sub Menu 4</a>
        <ul>
          <li><a href="#">Deep Menu 1</a>
            <ul>
              <li><a href="#">Sub Deep 1</a></li>
              <li><a href="#">Sub Deep 2</a></li>
              <li><a href="#">Sub Deep 3</a></li>
                <li><a href="#">Sub Deep 4</a></li>
            </ul>
          </li>
          <li><a href="#">Deep Menu 2</a></li>
        </ul>
      </li>
      <li><a href="#">Sub Menu 5</a></li>
    </ul>
  </li>
  <li><a href="#">교토 소개</a>
    <ul>
      <li><a href="#">Sub Menu 1</a></li>
      <li><a href="#">Sub Menu 2</a></li>
      <li><a href="#">Sub Menu 3</a></li>
    </ul>
  </li>
  <li><a href="#">지역별 교토 탐색</a>
    <ul>
      <li class="dir"><a href="#">Sub Menu 1</a></li>
      <li class="dir"><a href="#">Sub Menu 2 THIS IS SO LONG IT MIGHT CAUSE AN ISSEUE BUT MAYBE NOT?</a>
        <ul>
          <li><a href="#">Category 1</a></li>
          <li><a href="#">Category 2</a></li>
          <li><a href="#">Category 3</a></li>
          <li><a href="#">Category 4</a></li>
          <li><a href="#">Category 5</a></li>
        </ul>
      </li>
      <li><a href="#">Sub Menu 3</a></li>
      <li><a href="#">Sub Menu 4</a></li>
      <li><a href="#">Sub Menu 5</a></li>
    </ul>
  </li>
  <li><a href="#">먹거리</a></li>
  <li><a href="index.jsp?main=hotel/hotelmain.jsp">숙박시설</a></li>
  <li><a href="#">커뮤니티</a></li>
 <!--  <li><a href="#">Contact Us</a></li> -->
</ul>
</nav>
</body>
</html>