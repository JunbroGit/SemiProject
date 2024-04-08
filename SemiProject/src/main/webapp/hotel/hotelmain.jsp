<%@page import="data.dto.HotelDto"%>
<%@page import="data.dao.HotelDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
   img.photo{
   
   width: 400px;
   height: 230px;
   border: 1px solid gray;
   margin-bottom: 10px;
   }
   
   .shoptable{
      padding: 10px;
      height: 150px;
      
   }
   
      a.goDetail{
   
   text-decoration: none;
   color: black;
}

   a:hover {
   text-decoration: underline;
   color: gray;
}
</style>
<script type="text/javascript">
  $(function(){
     
     
     $("a.goDetail").click(function(){
        var h_num=$(this).attr("h_num");
        var h_category=$(this).attr("h_category");
        //alert(h_num);
        
        //디테일 페이지로 이동
        location.href="index.jsp?main=hotel/hoteldetailview.jsp?h_num="+h_num+"&h_category="+h_category;
     })
  });

</script>
</head>
<%
 
  HotelDao dao=new HotelDao();
  List<HotelDto> list=dao.getAllHotels();
  NumberFormat nf=NumberFormat.getCurrencyInstance();
  

%>
<body>
<div class="container mt-3">
  
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-bs-toggle="tab" href="#tabs-total">전체</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-hotel">호텔</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#tabs-ryokan">료칸</a>
    </li>
    
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="tabs-total" class="container tab-pane active"><br>
      <h3>전체</h3>
      <p>
        <table class="shoptable table table-bordered" style="width: 500px;">
           <tr>
              <%
                 int i=0;
                for(HotelDto dto: list)
                {
                   //20~50까지 난수발생
                   int sale=(int)(Math.random()*31)+20;
                   %>
                   <td>
                   
                     <a h_num="<%=dto.getH_num()%>" h_category=<%=dto.getH_category() %> style="cursor: pointer;" class="goDetail">
                        <img alt="" src="hotel/image_hotel/<%=dto.getH_image()%>" class="photo">
                        
                        <br>
                        <%=dto.getH_content() %><br></a>
                        
                     
                        <span style="float: right;">
                           <div style="color: gray; font-size: 12px;">
                           
                        </span>
                     
                   </td>
                   
                   <%
                     if((i+1)%3==0)
                     {%>
                        </tr><tr>
                     <%}
                   
                    i++;
                   %>
                <%}
              %>
           </tr> 
        
        </table>
      
      </p>
    </div>
    
    
    
    
     <div id="tabs-hotel" class="container tab-pane fade"><br>
      <h3>호텔</h3>
      <p>
      <table class="shoptable table table-bordered" style="width: 500px;">
           <tr>
              <%
                  i=0;
                for(HotelDto dto: list)
                {
                   
                   if(dto.getH_category().equals("hotel")){
                   //20~50까지 난수발생
                   int sale=(int)(Math.random()*31)+20;
                   %>
                   <td>
                     <a h_num="<%=dto.getH_num()%>" h_category=<%=dto.getH_category() %> style="cursor: pointer;" class="goDetail">
                        <img alt="" src="hotel/image_hotel/<%=dto.getH_image()%>" class="photo">
                        <br>
                        <%=dto.getH_content() %><br></a>
                     
                        <span style="float: right;">
                           <div style="color: gray; font-size: 12px;">
                           
                        </span>
                     
                   </td>
                   
                   <%
                     if((i+1)%3==0)
                     {%>
                        </tr><tr>
                     <%}
                   
                    i++;
                    
                   }
                   %>
                   
                <%}
              %>
           </tr> 
        
        </table>
      
      </p>
    </div>
    <div  id="tabs-ryokan" class="container tab-pane fade"><br>
      <h3>료칸</h3>
      <p>
        <table class="shoptable table table-bordered" style="width: 500px;">
           <tr>
              <%
                  i=0;
                for(HotelDto dto: list)
                {
                   
                   if(dto.getH_category().equals("ryokan")){
                   //20~50까지 난수발생
                   int sale=(int)(Math.random()*31)+20;
                   %>
                   <td>
                     <a h_num="<%=dto.getH_num()%>" h_category=<%=dto.getH_category() %> style="cursor: pointer;" class="goDetail">
                        <img alt="" src="hotel/image_hotel/<%=dto.getH_image()%>" class="photo">
                        <br>
                        <%=dto.getH_content()%><br></a>
                     
                        <span style="float: right;">
                           <div style="color: gray; font-size: 12px;">
                           
                        </span>
                     
                   </td>
                   
                   <%
                     if((i+1)%3==0)
                     {%>
                        </tr><tr>
                     <%}
                   
                    i++;
                    
                   }
                   %>
                   
                <%}
              %>
           </tr> 
        
        </table>
      
      </p>
    </div>
    
    
   
    
  </div>
</div>
</body>
</html>