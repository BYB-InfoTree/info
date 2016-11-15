<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        
        <li>
	        <div class="dropdown" style="background-color: black;">
			    <div class="dropdown-toggle" style="padding: 15px; background-color: #191919; color: white;" type="button" data-toggle="dropdown">contents
			    <span class="caret"></span></div>
			    <ul class="dropdown-menu">
				      <li><a href="#">여행</a></li>
				      <li><a href="#">맛집</a></li>
				      <li><a href="#">미용</a></li>
			    </ul>
		  	</div>
  		</li>
  		
        <li><a href="#">Stores</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="member_insert" id=""><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
        <li><a href="#" id="login"><span class="glyphicon glyphicon-user"></span>  로그인</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> 마일리지</a></li>
      </ul>
    </div>
  </div>
</nav>

</body>

</html>