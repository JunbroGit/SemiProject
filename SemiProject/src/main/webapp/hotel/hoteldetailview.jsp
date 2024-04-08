<%@page import="data.dto.HotelDto"%>
<%@page import="data.dao.HotelDao"%>
<%@page import="java.text.NumberFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
   img.large{
      height: 480px;
   }
   
   i.loc{
   color: green;
   }
   
   i.globe{
   color: green;
   }
</style>
</head>
<%
   String h_num=request.getParameter("h_num");
   String h_catagory=request.getParameter("h_catagory");
   String loginok=(String)session.getAttribute("loginok");
   String myid=(String)session.getAttribute("myid");
   HotelDao sdao=new HotelDao();
   HotelDto dto=sdao.getHotel(h_num);
   NumberFormat nf=NumberFormat.getCurrencyInstance();
%>
<body>
<div style="margin: 50px 100px; ">
    <form id="frm">
        <div class="row">
       
            <div class="col-md-6" style="padding-top: 50px;">
             <div style="color: gray">
             <a style="color: gray; text-decoration: none;" href="index.jsp?main=layout/main.jsp">홈></a>
             <a style="color: gray; text-decoration: none;" href="index.jsp?main=hotel/hotelmain.jsp">숙박시설></a>
             <%
                if(dto.getH_category().equals("ryokan")){
           
             %>
             
             <a style="color: gray; text-decoration: none;" href="index.jsp?main=hotel/hotelmain.jsp">료칸</a>
             <% 
             
             }
             %>
              <%
                if(dto.getH_category().equals("hotel")){
           
             %>
             
             <a style="color: gray; text-decoration: none;" href="index.jsp?main=hotel/hotelmain.jsp">호텔</a>
             <% 
             
             }
             %>
             </div>
                <img alt="" src="hotel/image_hotel/<%=dto.getH_image()%>" class="large img-thumbnail">
               
            </div>
            <div class="col-md-6" style="padding-top: 30px;">
                <h1 style="font-weight: bold; "><%=dto.getH_subject() %></h1>
                <hr>
                <h5><%=dto.getH_content()%></h5>
                <h6><i class="bi bi-globe2 globe"></i>  <a href="<%=dto.getH_link()%>" target='_blank' style="color: gray;"><%=dto.getH_link()%></a></h6>
                <h6><i class="bi bi-geo-alt-fill loc"></i>  <%=dto.getH_location() %></h6>
                  <br>
                <iframe src="<%=dto.getH_googlemap() %>" width="500" height="310" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
               
               
            </div>
        </div>
    </form>
    
    <script type="text/javascript">
    $("#btncart").click(function(){
        var login="<%=loginok%>";
        
        if(login=="null"){
            alert("먼저 로그인을 해주세요");
            return;
        }
        
        var cartdata=$("#frm").serialize();
        
        $.ajax({
            type:"post",
            dataType:"html",
            data:cartdata,
            url:"shop/detailprocess.jsp",
            success:function(){
                var a=confirm("장바구니에 저장하였습니다\n장바구니로 이동하려면 [확인]을 눌러주세요");
                
                if(a){
                    location.href="index.jsp?main=shop/mycart.jsp";
                }
            }
        });
    });
    </script>
</div>
</body>
</html>
