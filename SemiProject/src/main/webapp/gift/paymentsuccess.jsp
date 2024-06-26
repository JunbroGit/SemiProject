<%@page import="data.dto.SemiMemberDto"%>
<%@page import="data.dao.SemiMemberDao"%>
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
</head>
<body>

<%
request.setCharacterEncoding("utf-8");

String num= request.getParameter("num");
System.out.println(num);


String id=(String)session.getAttribute("myid");


SemiMemberDao dao = new SemiMemberDao();
SemiMemberDto dto = dao.getMemberById(id);
String name = dto.getName(); // 수정된 부분
%>

<jsp:useBean id="pdao" class="data.dao.PaymentDao"/>
<jsp:useBean id="pdto" class="data.dto.PaymentDto"/>
<jsp:useBean id="gdao" class="data.dao.GiftDao"/>
<jsp:setProperty property="*" name="pdto"/>


<%
 
 pdao.insertPayment(pdto, num);

 gdao.deleteCartAfterPay(num);

 response.sendRedirect("../index.jsp?main=gift/paysuccess.jsp?num="+num);
 
 
 
%>



<body>
   <div class="container mt-5">
      <div>
         <div align="center">
            <img src="member/member_image/gaipsuccess_1.PNG" alt=""
               width="400px">

            <h5><%=name %>님, 결제완료되었습니다.
            </h5>
            <br>
            <button type="button" class="btn btn-warning"
               onclick="location.href='index.jsp?main=gift/paymentlist.jsp?num=<%=num %>&id=<%=id %>'" style="background: pink; border-color: pink;">결제 기록</button>
            <button type="button" class="btn btn-success" 
               onclick="location.href='index.jsp'" >메인</button>
         </div>
      </div>
   </div>


</body>

</html>