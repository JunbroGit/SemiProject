<%@page import="data.dao.ReviewAnswerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ReviewDao"%>
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
				location.href="smartboard/alldelete.jsp?nums="+n;
			}
		})
	})
</script>
</head>
<body>
<%
	ReviewDao dao=new ReviewDao();
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
	List<ReviewDto> list=dao.getList(startNum, perPage);
	
	if(list.size()==0 && currentPage!=1){
		%>
		<script type="text/javascript">
			location.href="index.jsp?main=memberguest/guestlist.jsp?currentPage=<%=currentPage-1%>";
		</script>
	<%}
	
	//댓글 갯수 넣기
	ReviewAnswerDao adao=new ReviewAnswerDao();
	for(ReviewDto dto:list){
		//댓글변수에 댓글 총 갯수 넣기
		int acount=adao.getAnswerList(dto.getR_num()).size();
		dto.setAnswercount(acount);
	}
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
%>
<body>
<div style="margin: 0 auto; width: 900px;">
	
	<br>
	<%-- <h6 align="left"><b>총 <%=totalCount %>개의 글이 있습니다</b></h6> --%>
	<table class="table table-group-divider">
		<caption align="top" class="list"><b>후기게시판 목록</b></caption>
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
				<tr>
					<td colspan="6" align="right">
						<button type="button" class="btn btn-info btn-sm"
						onclick="location.href='index.jsp?main=review/addform.jsp'">
						<i class="bi bi-pencil-fill"></i> 글쓰기</button>
					</td>		
				</tr>
			<%}else{
				for(ReviewDto dto:list){%>
					<tr class="hover-effect">
						<td align="center">
						<input type="checkbox" value="<%=dto.getR_num()%>" class="alldel">&nbsp;&nbsp;
						<%=no-- %></td>
						<td><a href="index.jsp?main=review/contentview.jsp?r_num=<%=dto.getR_num()%>&currentPage=<%=currentPage %>">
						<span style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 200px; display: block;"><%=dto.getR_subject() %>  </a>
						
						<%-- <%
							if(dto.getAnswercount()>0){
							%> --%>
								<a href="index.jsp?main=smartboard/contentview.jsp?r_num=<%=dto.getR_num()%>&currentPage=<%=currentPage %>"
								style="color: red"><%-- [<%=dto.getAnswercount() %>] --%></a></span>
							<%-- <%}
						%> --%>
						</td>
						<td align="center"><%=dto.getR_writer() %></td>
						<td align="center"><%=sdf.format(dto.getR_writeday()) %></td>
						<td align="center"><%=dto.getR_likes() %></td>
						<td align="center"><%=dto.getR_readcount() %></td>
					</tr>
				<%}%>
				
				<tr>
					<td colspan="6">
						&nbsp;<input type="checkbox" class="alldelcheck">&nbsp;&nbsp;전체선택
						<span style="float: right;">
							<button type="button" class="btn btn-secondary btn-sm" id="btndel">
							전체삭제</button>
							<button type="button" class="btn btn-secondary btn-sm"
							onclick="location.href='index.jsp?main=review/addform.jsp'">
							글쓰기</button>
						</span>
					</td>
				</tr>
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
		       <a class="page-link" href="index.jsp?main=noti/boardList.jsp?currentPage=<%=startPage-1%>">
		       <img src="image/semi/left-arrow-bold.png" style="width: 13px; height: 15px;"></a>
		    </li>	
		<%}
		for(int pp=startPage;pp<=endPage;pp++){
			if(pp==currentPage){
			%>
					<li class="page-item active">
					<a class="page-link" href="index.jsp?main=review/reviewlist.jsp?currentPage=<%=pp%>"><%=pp%></a>
					</li>
			<%}else{
			%>	
					<li class="page-item">
					<a class="page-link" href="index.jsp?main=review/reviewlist.jsp?currentPage=<%=pp%>"><%=pp%></a>
					</li>
			<%}
		}
		
		//다음
		if(endPage<totalPage){
		%>
			<li class="page-item">
	           <a  class="page-link" href="index.jsp?main=noti/boardList.jsp?currentPage=<%=endPage+1%>">
	           <img src="image/semi/right-arrow-bold.png" style="width: 13px; height: 15px;"></a>
	        </li>
		<%}
	%>
	</ul>
</div>
</body>
</html>