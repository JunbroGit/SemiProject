<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Diphylleia&family=Dongle&family=Gowun+Dodum&family=Nanum+Pen+Script&family=Orbit&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>


<script type="text/javascript">
	$(function() {
		//아이디 중복체크
		
		
		$("#btnIdCheck").click(function(){
			
		
			//id읽기
		    var id = $("#id").val();
			alert(id);
		    $.ajax({
		        type: "get",
		        url: "member/idCheck.jsp",
		        dataType: "json",
		        data: {"id": id},
		        success: function(res) {
		            if (res.count == 1) {
		                $("span.idsuccess").text("not ok!!");
		            } else {
		                $("span.idsuccess").text("ok!!");
		            }
		        }
		    });
		});
		
	
		
	
		//위치가 중요해!!!! 
		//$(function(){})안에 있어야 하는데 밖에 있었다.
		//이메일 선택 이벤트
		$("#selemail").change(function() {
		
			if($(this).val()=='-'){
				$("#email2").val('');
			}else{
				$("#email2").val($(this).val());
			}
		})
	})
	
	function check(f) {
		if(f.pass.value!=f.pass2.value){
			alert("비밀번호가 서로 다릅니다.");
			//초기화
			f.pass.value="";
			f.pass2.value="";
			
			return false; //액션호출하지 않는다.
		}
	}

	

</script>




</head>
<body>
<div style="margin: 0px 420px; width: 350px;">
<form action="member/addaction.jsp" method="post" onsubmit="return check(this)">
	<table class="table table-bordered" style="width: 500px;">
	 	<caption align="top"><b>회원가입</b></caption>
	 	<tr>
			<th width="100" class="table-warning">아이디</th>
			<td>
				<div class="d-inline-flex">
				<input type="text" name="id" id="id" maxlength="8" class="form-control"
				required="required" style="width: 120px;">
				<button type="button" class="btn btn-warning" id="btnIdCheck"
				style="margin-left:10px;">중복체크</button>
				<span class="idsuccess" style="color:blue; margin-left:10px;"></span>
				
				</div>
			</td>	
		</tr>
		
		<tr>
		    <th width="100" class="table-warning">비밀번호</th>
			<td>
			   <div class="d-inline-flex">
				<input type="password" name="pass" class="form-control"
				required="required" style="width: 120px;" placeholder="비밀번호">
				<input type="password" name="pass2" class="form-control"
				required="required" style="width: 150px; margin-left: 5px;"  placeholder="비밀번호 확인">
			   </div>
			</td>
		</tr>
		
		<tr>
		    <th width="100" class="table-warning">이름</th>
			<td>
			   <input type="text" name="name" class="form-control" required="required" style="width: 120px;"> 
			</td>
		</tr>
		
		<tr>
		    <th width="100" class="table-warning">핸드폰</th>
			<td>
			   <input type="text" name="hp" class="form-control" required="required" style="width: 120px;"> 
			</td>
		</tr>
		
		<tr>
		    <th width="100" class="table-warning">주소</th>
			<td>
			   <input type="text" name="addr" class="form-control" required="required" style="width: 120px;"> 
			</td>
		</tr>
		
		<tr>
		    <th width="100" class="table-warning">이메일</th>
			<td>
			<div class="d-inline-flex">
			   <input type="text" name="email1" class="form-control" required="required" style="width: 80px;"> 
			   <b style="margin-left: 10px; margin-right: 10px;">@</b>
			   <input type="text" name="email2"  id="email2" class="form-control" required="required" style="width: 80px;"> 
			   <select id="selemail" class="form-control" style="margin-left: 10px;">
			   	<option value="-">직접입력</option>
			  	<option value="naver.com">네이버</option>
			   	<option value="gmail.com">구글</option>
			   	<option value="nate.com">네이트</option>
			   	<option value="daum.net">다음</option>
			   </select>
			</div>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-outline-info">저장하기</button>
				<button type="reset" class="btn btn-outline-info">초기화</button>
				
			</td> 
		</tr>
		
	</table>
</form>
</div>
</body>
</html>