<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<!-- Include SweetAlert library -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>Insert title here</title>
</head>

<script type="text/javascript">

$(document).ready(function(){
     $('#foodForm').submit(function(e){
       e.preventDefault(); // Prevent form submission
       // Perform AJAX submission if needed, then show SweetAlert
       Swal.fire({
         position: "center",
         icon: "success",
         title: "저장되었습니다!",
         showConfirmButton: true,
       });
       // You may also submit the form programmatically after showing the alert
       this.submit();
     });
   });


</script>

<body>
<div style="display: flex; justify-content: center; align-items: center; height: 100vh;">
<div style="margin: 50px 100px; width: 600px;">
    <form id="foodForm" action="food/foodaddaction.jsp" method="post" enctype="multipart/form-data">
       <table class="table table-bordered">
          <caption align="top"><b>식당등록</b></caption>
          
          <tr>
             <td style="width: 150px;" class="table-light"><b>이름</b></td>
             <td>
               <input type="text" name="f_subject" class="form-control"
               style="width: 200px;" required="required" placeholder="이름 작성">
             </td>
          </tr>
          
          <tr>
             <td style="width: 150px;" class="table-light"><b>영어이름</b></td>
             <td>
               <input type="text" name="f_subject_k" class="form-control"
               style="width: 200px;" required="required" placeholder="영어 이름 작성">
             </td>
          </tr>
          
          <tr>
             <td style="width: 150px;" class="table-light"><b>이미지</b></td>
             <td>
               <input type="file" name="f_image" class="form-control"
               style="width: 300px;" >
             </td>
          </tr>
          
          <tr>
             <td style="width: 150px;" class="table-light"><b>설명</b></td>
             <td>
               <input type="text" name="f_content" class="form-control"
               style="width: 300px;" required="required" placeholder="설명 작성">
             </td>
          </tr>
          
           <tr>
             <td style="width: 150px;" class="table-light"><b>주소</b></td>
             <td>
               <input type="text" name="f_location" class="form-control"
               style="width: 300px;" required="required" placeholder="주소 작성">
             </td>
          </tr>
          
           <tr>
             <td style="width: 150px;" class="table-light"><b>홈페이지 주소</b></td>
             <td>
               <input type="text" name="f_link" class="form-control"
               style="width: 200px;" required="required" placeholder="홈페이지 주소 작성">
             </td>
          </tr>
          
           <tr>
             <td style="width: 150px;" class="table-light"><b>운영시간</b></td>
             <td>
               <input type="text" name="f_time" class="form-control"
               style="width: 200px;" required="required" placeholder="운영시간 작성">
             </td>
          </tr>
          
           <tr>
             <td style="width: 150px;" class="table-light"><b>휴일</b></td>
             <td>
               <input type="text" name="f_holiday" class="form-control"
               style="width: 200px;" required="required" placeholder="휴일 작성">
             </td>
          </tr>
          
           <tr>
             <td style="width: 150px;" class="table-light"><b>메뉴</b></td>
             <td>
               <input type="text" name="f_menu" class="form-control"
               style="width: 200px;" required="required" placeholder="식당 메뉴 작성">
             </td>
          </tr>
          
           <tr>
             <td style="width: 150px;" class="table-light"><b>구글맵링크</b></td>
             <td>
               <input type="text" name="f_googlemap" class="form-control"
               style="width: 300px;" required="required" placeholder="구글맵링크 작성">
             </td>
          </tr>
     
          
          <tr>
            <td colspan="2" align="center">
              <button type="submit" class="btn btn-secondary btn-sm"
              style="width: 100px;">내용저장</button>
              <button type="button" class="btn btn-secondary btn-sm"
              style="width: 100px;" onclick="location.href='index.jsp?main=food/foodmain.jsp'">식당목록</button>
            </td>
          </tr>
       </table>
    </form>
</div>
</body>
</html>