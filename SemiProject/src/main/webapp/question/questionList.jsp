<%@page import="data.dto.SemiMemberDto"%>
<%@page import="data.dao.SemiMemberDao"%>
<%@page import="data.dao.QuestionDao"%>
<%@page import="data.dto.QuestionDto"%>
<%@page import="data.dao.QuestionAnswerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100..900&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>Insert title here</title>
<style type="text/css">

	*{
	font-family: 'Noto Sans KR';
      }

	a:link, a:visited{
	text-decoration: none;
	color: black;
	}
	
	a:hover{
	text-decoration: underline;
	color: gray;
	}
	
	i.del{color: red;}
	i.write{color: blue;}
	
	/* hover 효과 적용 */
    tr.hover-effect:hover td {
    background-color: rgba(128, 128, 128, 0.1); /* 마우스를 갖다대면 배경색 변경 */
    cursor: pointer; /* 마우스 커서를 포인터로 변경 */
    }
    
    .list{
    font-size: 1.2em;
    color: black;
    padding-top: 30px;
    padding-bottom: 25px;
    }
    
    /* 페이지 네이션 테두리 제거 */
    ul.pagination {
       border: none;
    }
   
    ul.pagination li.page-item a.page-link {
       border: none;
       border-radius: 0; /* 필요에 따라 테두리의 모서리를 조정할 수 있습니다 */
    }
   
    ul.pagination li.page-item.active a.page-link {
       background-color: #007bff; /* 활성 페이지의 배경색을 원하시는 색상으로 변경하세요 */
       color: #fff; /* 활성 페이지의 텍스트 색상을 원하시는 색상으로 변경하세요 */
    }
    
    .questionimg {
    	width: 65px;
    	height: 60px;
    	margin-left: 10px;
    }

	.image-and-text {
	    display: flex; /* 부모 요소를 플렉스 컨테이너로 설정하여 내부 요소를 가로로 나란히 배치 */
	    align-items: center; /* 내부 요소를 수직 중앙 정렬 */
	    background-color: rgba(128, 128, 128, 0.1);
	    width: 900px;
	    height: 140px;
	    padding-left: 15px;
	    padding-right: 15px;
	    
	}
	
	.board-text {
	    margin-left: 10px; /* 이미지와 텍스트 사이의 간격 조정 */
	    font-size: 15px;
	    font-weight: bold;
	}
	
	.totaltext {
		margin-left: 3px;
	}
	
		/* 검색기능 css */
   .searching {
      width: 250px; 
      height: 45px; 
      border:1px solid rgb(173,173,173);  
      position:relative;
      border-radius: 30px;
      display: inline-block;
    }
    
    #keyword {
       height: 35px; 
       width: calc(100% - 50px); 
       position: absolute;
       top: 5px; 
       left: 10px; 
       border: none;
       font-size: 17px;
       padding-right: 40px;
   }  
   
   #keyword:focus {
      outline: none;
   }
    
    /* input[name="query"]{height: 35px; width: 420px; position: absolute;
      top: 5px; left: 10px; border: none; font-size: 17px;}
    input[name="query"]:focus{outline: none;} */
       
    .search {
     width: 45px;
     height: 46px; 
     background: none;
     position: absolute; 
     right: 0; 
     top: 0; 
     border: none; 
     font-size: 1.5em; /* 검색 아이콘 사이즈 */
     font-weight: bold; 
     color: black; /* 아이콘 색상 */
   }
   
   /* 검색 아이콘 위치 조정 */
   .searchicon {
     position: absolute; 
     right: 20px; 
     top: 50%; 
     transform: translateY(-50%);
   }
   
   select {
     box-sizing: border-box;
     width: 83px;
     height: 46px;
     padding: 4px;
     font-size: 1em;
     border-radius: 30px;
     border-color: rgb(173,173,173);
   }
   
   .option {
     padding: 4px;
     font-size: 14px;
     color: black;
     background: white;
   }
   
   	/* 게시판 이미지 글자 */
	.review-container {
    	text-align: center; /* 텍스트와 이미지를 가운데 정렬합니다. */
	}

	.image-wrapper {
	    position: relative;
	    display: inline-block;
	    width: 100%; /* 이미지 래퍼의 너비를 100%로 설정하여 화면 가로에 맞춥니다. */
	}
	
	.review-text {
	    position: absolute; /* 텍스트를 이미지 안에 절대 위치로 설정합니다. */
	    top: 50%; /* 상단 여백을 부모 요소의 50% 위치로 설정합니다. */
	    left: 50%; /* 좌측 여백을 부모 요소의 50% 위치로 설정합니다. */
	    transform: translate(-50%, -50%); /* 텍스트를 가운데로 정렬합니다. */
	    color: white; /* 텍스트의 색상을 흰색으로 설정합니다. */
	    font-weight: bold; /* 텍스트의 글꼴을 굵게 설정합니다. */
	    font-size: 60px; /* 텍스트의 글꼴 크기를 설정합니다. */
	    z-index: 1; /* 텍스트를 이미지 위로 올려줍니다. */
	}
	
	.reviewimg {
  		width: 100%; /* 이미지의 너비를 100%로 설정하여 화면 가로에 맞춥니다. */
   		height: 300px;
	}
</style>

<script type="text/javascript">
	$(function(){
		//전체체크 클릭시 체크값 얻어서 모든 체크값에 전달
		$(".alldelcheck").click(function(){
			
			//전체 체크값 얻기
			var chk=$(this).is(":checked");
			//console.log(chk);
			
			//전체체크값을 글앞에 체크에 일괄 전달
			$(".alldel").prop("checked",chk);
		})
		
		//삭제버튼 클릭시 삭제
		$("#btndel").click(function(){
			
			var len=$(".alldel:checked").length;
			//alert(len);
			
			if(len==0){
				alert("최소 1개 이상의 글을 선택해 주세요");
			}else{
				var a=confirm(len+"개의 글을 삭제하려면 [확인]을 눌러주세요");
				
				//체크된 곳의 value값(num)얻기
				var n="";
				$(".alldel:checked").each(function(idx){
					n+=$(this).val()+",";
				})
				//마지막 컴마 제거
				n=n.substring(0,n.length-1);
				console.log(n);
				
				//삭제파일로 전송
				location.href="question/allDelete.jsp?nums="+n;
			}
		})
		
		//검색기능
	    $("button.search").click(function(){
	    	
	    	var keyword=$("#keyword").val();
	    	var category=$("#category").val();
	    	//alert(keyword+","+category);
	    	$.ajax({
	    		type:"post",
	    		url:"question/search.jsp",
	    		data:{"keyword":keyword, "category":category},
	    		dataType:"json",
	    		success:function(res){
	    			//console.log(res); // 콘솔에서 응답 확인
	    			var s="<table class='table table-group-divider'><tr class='table-light'>";
	    			s+="<th width='100' style='text-align: center'>번호</th>";
	    			s+="<th width='380' style='text-align: center'>제목</th>";
	    			s+="<th width='200' style='text-align: center'>작성자</th>";
	    			s+="<th width='200' style='text-align: center'>작성일</th>";
	    			s+="<th width='80' style='text-align: center'>추천</th>";
	    			s+="<th width='80' style='text-align: center'>조회</th></tr>";
	    			var rowCount = res.length;
	                for (var i = 0; i < rowCount; i++) {
	                    var rowNum = rowCount - i; // 내림차순으로 번호 부여
	                    var ele = res[i];
	                    s += "<tr class='hover-effect'><td align='center'>" + rowNum + "</td>";
	                    s += "<td><a href='index.jsp?main=review/contentview.jsp?r_num=" + ele.q_num + "'>";
	                    s += "<span>" + ele.q_subject + "</span></a></td>";
	                    s += "<td align='center'>" + ele.q_writer + "</td>";
	                    s += "<td align='center'>" + ele.q_writeday + "</td>";
	                    s += "<td align='center'>" + ele.q_likes + "</td>";	
	                    s += "<td align='center'>" + ele.q_readcount + "</td></tr>";
	                }
	                s += "</table>";
	                $("table.origintable").hide();
	                $("div.searchfunc").show();
	                $("div.searchlist").html(s);
	    		}
	    	});
	    })
	})
</script>
</head>
<body>
<%
	QuestionDao dao=new QuestionDao();
	//전체갯수
	int totalCount=dao.getTotalCount();
	int perPage=5; //한페이지당 보여질 글의 갯수
	int perBlock=5; //한 블럭당 보여질 페이지 갯수
	int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0번, 오라클은 1번)
	int startPage; //각 블럭당 보여질 시작페이지
	int endPage; //각 블럭당 보여질 끝페이지
	int currentPage; //현재 페이지
	int totalPage; // 총 페이지
	int no; //각 페이지당 출력할 시작번호
	
	//현재 페이지 읽는데 단, null일 경우는 1페이지로 준다
	if(request.getParameter("currentPage")==null){
		currentPage=1;
	}else{
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	//총 페이지수 구하기
	//총 글갯수/한페이지당보여질갯수로 나눔(7/5=1)
	//나머지가 1이라도 있으면 무조건 1페이지 추가
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
		
	//각 블럭당 보여질 시작페이지
	//perBlock=5일 경우 현제페이지가 1~5일 경우, 시작페이지가 1, 끝페이지가 5
	//현재가 13이면, 시작:11 끝: 15
	startPage=(currentPage-1)/perBlock*perBlock+1;
	endPage=startPage+perBlock-1;
	
	//총 페이지가 23일경우 마지막블럭은 끝페이지가 25가 아니라 23
	if(endPage>totalPage){
		endPage=totalPage;
	}
	//각 페이지에서 보여질 시작번호
	//1페이지:0, 2페이지:5 3페이지:10....
	startNum=(currentPage-1)*perPage;
	
	//각 페이지당 출력할 시작번호 구하기
	//총글갯수가 23, 1페이지:23 2페이지:18 3페이지:13
	no=totalCount-(currentPage-1)*perPage;
	
	//페이지에서 보여질 글만 가져오기
	List<QuestionDto> list=dao.getList(startNum, perPage);
	
	if(list.size()==0 && currentPage!=1){
		%>
		<script type="text/javascript">
			location.href="index.jsp?main=memberguest/guestlist.jsp?currentPage=<%=currentPage-1%>";
		</script>
	<%}
	
	//댓글 갯수 넣기
	QuestionAnswerDao adao=new QuestionAnswerDao();
	for(QuestionDto dto:list){
		//댓글변수에 댓글 총 갯수 넣기
		int acount=adao.getAnswerList(dto.getQ_num()).size();
		dto.setAnswercount(acount);
	}
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
	
	String q_num=request.getParameter("q_num");
	
	String loginok=(String)session.getAttribute("loginok");
	String myid=(String)session.getAttribute("myid");
	SemiMemberDao sdao=new SemiMemberDao();
	SemiMemberDto sdto=sdao.getMemberById(myid);
	
%>
<body>
<div class="review-container">
    <div class="image-wrapper">
        <img class="reviewimg" src="question/quesimg1.jpg">
        <div class="review-text">Q & A</div>
    </div>
</div>
<br>
<div style="margin: 0 auto; width: 900px;">	
	<br>
	
	<!-- 검색기능 -->
  	<div class="d-inline-flex searchfunc" style="float: right; margin-bottom: 10px; margin-top: -20px;">
      <select name="category" id="category">
      	<option class="option" style="text-align: center;" value="제목">제목</option>
      	<option class="option" style="text-align: center;" value="작성자">작성자</option>
      </select>
	  <div class="searching">
		<input type="text" name="keyword" id="keyword" placeholder="검색하세요." maxlength="10">
		<button type="button" class="search"><i class="bi bi-search searchicon"></i></button>
	  </div>
    </div>
		
	<div class="searchlist"></div>
	
	<table class="table table-group-divider origintable">
		<tr class="table-light">
			<th width="100" style="text-align: center">번호</th>
			<th width="380" style="text-align: center">제목</th>
			<th width="200" style="text-align: center">작성자</th>
			<th width="200" style="text-align: center">작성일</th>
			<th width="80" style="text-align: center">추천</th>
			<th width="80" style="text-align: center">조회</th>
		</tr>
		
		<%
			if(totalCount==0){%>
				<tr>
					<td colspan="6" align="center">
						<h6><b>등록된 게시글이 없습니다</b></h6>
					</td>
				</tr>
				
				<%
					if(loginok!=null){%>
					<tr>
						<td colspan="6" align="right">
							<button type="button" class="btn btn-info btn-sm"
							onclick="location.href='index.jsp?main=question/addForm.jsp'">
							<i class="bi bi-pencil-fill"></i> 글쓰기</button>
						</td>		
					</tr>						
					<%}
				%>
			<%}else{
				for(QuestionDto dto:list){%>
					<tr class="hover-effect">
						<td>
						<input type="checkbox" value="<%=dto.getQ_num()%>" class="alldel">&nbsp;&nbsp;
						<%=no-- %></td>
						<td><a href="index.jsp?main=question/contentView.jsp?q_num=<%=dto.getQ_num()%>&currentPage=<%=currentPage %>">
						<span><%=dto.getQ_subject() %></span></a>
						</td>
						<td align="center"><%=dto.getQ_writer() %></td>
						<td align="center"><%=sdf.format(dto.getQ_writeday()) %></td>
						<td align="center"><%=dto.getQ_likes() %></td>
						<td align="center"><%=dto.getQ_readcount() %></td>
					</tr>
				<%}%>
				<%
					if(loginok!=null){%>
					<tr>
						<td colspan="6">
					<%
						if(sdto.getId().equals("admin"))
						{%>
							<input type="checkbox" class="alldelcheck">&nbsp;&nbsp;전체선택
							<span style="float: right;">
							<button type="button" class="btn btn-secondary btn-sm" id="btndel">
							삭제</button>
							<button type="button" class="btn btn-secondary btn-sm"
							onclick="location.href='index.jsp?main=question/addForm.jsp'">
							글쓰기</button>
						<%}else{%>
							<button type="button" class="btn btn-secondary btn-sm" style="float: right;"
							onclick="location.href='index.jsp?main=question/addForm.jsp'">
							글쓰기</button>
						<%}%>
							</span>
						</td>
					</tr>
					<%}
				%>
			<%}
		%>
	</table>
</div>
<div>
	<!-- 페이지 번호 출력 -->
	<ul class="pagination justify-content-center">
	<%
		//이전
		if(startPage>1){
		%>
			<li class="page-item ">
		       <a class="page-link" href="index.jsp?main=question/questionList.jsp?currentPage=<%=startPage-1%>">
		       <img src="image/semi/left-arrow-bold.png" style="width: 13px; height: 15px;"></a>
		    </li>	
		<%}
		for(int pp=startPage;pp<=endPage;pp++){
			if(pp==currentPage){
			%>
					<li class="page-item active">
					<a class="page-link" href="index.jsp?main=question/questionList.jsp?currentPage=<%=pp%>"><%=pp%></a>
					</li>
			<%}else{
			%>	
					<li class="page-item">
					<a class="page-link" href="index.jsp?main=question/questionList.jsp?currentPage=<%=pp%>"><%=pp%></a>
					</li>
			<%}
		}
		
		//다음
		if(endPage<totalPage){
		%>
			<li class="page-item">
	           <a  class="page-link" href="index.jsp?main=question/questionList.jsp?currentPage=<%=endPage+1%>">
	           <img src="image/semi/right-arrow-bold.png" style="width: 13px; height: 15px;"></a>
	        </li>
		<%}
	%>
	</ul>
</div>
</body>
</html>