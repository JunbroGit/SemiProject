
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="login-form-04/fonts/icomoon/style.css">

    <link rel="stylesheet" href="login-form-04/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="login-form-04/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="login-form-04/css/style.css">
    
    
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Diphylleia&family=Dongle&family=Noto+Sans+KR:wght@100..900&family=Orbit&family=Stylish&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

    <title>Login</title>
  </head>

  <%
	//세션으로부터 아이디와 체크값을 얻는다
	String myid=(String)session.getAttribute("myid");
	String saveid=(String)session.getAttribute("saveok");
	
	boolean save=true;
	
	if(saveid==null)
	{
		myid="";//아이디저장을 체크하지 않은경우 아이디 없앤다
		save=false;
	}
%>
  <body>
  

  <div class="d-md-flex half logform">
    <div class="bg" style="background-image: url('login-form-04/images/bg_2.png');"></div>
    <div class="contents">

      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-12">
            <div class="form-block mx-auto">
              <div class="text-center mb-5">
              <h3>Login to <strong>KyotoInside</strong></h3>
              <!-- <p class="mb-4">Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.</p> -->
              </div>
              <form action="login/loginAction.jsp" method="post">
                <div class="form-group first">
                  <label for="username">Id</label>
                  <input type="text" name="id" class="form-control" placeholder="Id" id="id" name="id" required="required"
				value="<%=myid%>">
                </div>
                <div class="form-group last mb-3">
                  <label for="password">Password</label>
                  <input type="password" class="form-control" placeholder="Password" id="pass" name="pass" required="required">
                </div>
                
                <div class="d-sm-flex mb-5 align-items-center">
                  <label class="control control--checkbox mb-3 mb-sm-0 remember"><span class="caption">Remember me</span>
                    <input type="checkbox" name="savechk" <%=save?"checked":"" %>>
                    <div class="control__indicator"></div>
                  </label>
                 
                </div>

                <input type="submit" value="Log In" class="btn btn-block btn-success">

              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

    
  </div>
    
    

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>