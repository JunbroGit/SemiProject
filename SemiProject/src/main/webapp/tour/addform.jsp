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
</head>
<body>
<div style="margin: 0 auto; width: 600px;">
   <form action="tour/addaction.jsp" method="post" enctype="multipart/form-data">
      <table class="table table-bordered">
         <caption align="top"><h3>상품등록</h3></caption>      
         <tr>
            <td align="center" valign="middle"><b>카테고리</b></td>
            <td>
               <select class="form-control" required="required" name="t_category">
                  <option value="sawon">sawon</option>
                  <option value="mus">mus</option>
                  <option value=event">event</option>
               </select>
            </td>
         </tr>
            
         <tr>   
            <td align="center" valign="middle"><b>한글이름</b></td>
            <td>
               <input type="text" name="t_subject" class="form-control">
            </td>
         </tr>
         
         <tr>   
            <td align="center" valign="middle"><b>영어이름</b></td>
            <td>
               <input type="text" name="t_subject_j" class="form-control">
            </td>
         </tr>
         
         <tr>
            <td align="center" valign="middle"><b>내용</b></td>
            <td>
               <textarea style="width: 500px;" name="t_content"></textarea>
            </td>
         </tr>
         
         <tr>
            <td align="center" valign="middle"><b>이미지</b></td>
            <td>
               <input type="file" name="t_image" class="form-control">
            </td>
         </tr>
         
         <tr>         
            <td align="center" valign="middle"><b>위치</b></td>
            <td>
               <input type="text" name="t_location" class="form-control">
            </td>
         </tr>
         
         <tr>         
            <td align="center" valign="middle"><b>링크</b></td>
            <td>
               <input type="text" name="t_link" class="form-control">
            </td>
         </tr>
         
         <tr>         
            <td align="center" valign="middle"><b>영업시간</b></td>
            <td>
               <input type="text" name="t_time" class="form-control">
            </td>
         </tr>
         
         <tr>         
            <td align="center" valign="middle"><b>전화번호</b></td>
            <td>
               <input type="text" name="t_tel" class="form-control">
            </td>
         </tr>
         
         <tr>         
            <td align="center" valign="middle"><b>입장료</b></td>
            <td>
               <input type="text" name="t_price" class="form-control">
            </td>
         </tr>
         
         <tr>         
            <td align="center" valign="middle"><b>구글맵</b></td>
            <td>
               <input type="text" name="t_googlemap" class="form-control">
            </td>
         </tr>
         
         <tr>
            <td colspan="2" align="center">
            <button type="submit" class="btn btn-info"
            style="width: 100px;">등록</button>
            </td>
         </tr>
      </table>
   </form>
</div>
</body>
</html>