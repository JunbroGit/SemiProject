<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100..900&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
</head>
<%
	//프로젝트의 경로
	String root=request.getContextPath();
%>
<!-- se2 폴더에서 js 파일 가져오기 -->
<script type="text/javascript" src="<%=root%>/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=root%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
<body>
<form action="question/addAction.jsp" method="post">
	<table style="width: 800px;margin: 0 auto;" class="table table-bordered">
		<caption align="top"><b>후기게시판</b></caption>
		<tr>
			<th width="100" class="table-light" valign="middle">작성자</th>
			<td>
				<input type="text" name="q_writer" class="form-control" required="required" style="width: 130px;">
			</td>
		</tr>
		<tr>
			<th width="100" class="table-light" valign="middle">제목</th>
			<td>
				<input type="text" name="q_subject" class="form-control" required="required" style="width: 500px;">
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<textarea name="q_content" id="q_content" required="required" style="width: 100%;height: 300px;display: none;"></textarea>		
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" class="btn btn-outline-info" style="width: 120px;" onclick="submitContents(this)">DB저장</button>
				<button type="button" class="btn btn-outline-success" style="width: 120px;" onclick="location.href='index.jsp?main=question/questionList.jsp'">목록</button>
			</td>
		</tr>
	</table>   
</form>
</body>

<!-- 스마트게시판에 대한 스크립트 코드 넣기 -->
<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "r_content",

    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",

    fCreator: "createSEditor2"

}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["r_content"].exec("UPDATE_CONTENTS_FIELD", [ ]);

 

    // 에디터의 내용에 대한 값 검증은 이곳에서

    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) { 

    }

}

// textArea에 이미지 첨부

function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>/save/'+filepath+'">';
    oEditors.getById["r_content"].exec("PASTE_HTML", [sHTML]); 

}
</script>

</html>