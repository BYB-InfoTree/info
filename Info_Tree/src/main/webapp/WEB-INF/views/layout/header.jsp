<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
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
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="home">Home</a></li>
        
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
     
      	<c:choose>
           <c:when test="${sessionemail == null}">
           <ul class="nav navbar-nav navbar-right">
  			  <li><a href="memberInsertForm" id="join"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
    	      <li><a href="#" id="login"><span class="glyphicon glyphicon-user"></span>  로그인</a></li>
    	    </ul>  
           </c:when>
     	 <c:otherwise>
  				<ul class="nav navbar-nav navbar-right">
  				 <li><a href="#">Welcome!!! ${sessionnickname}</a></li>
     			 <li><a href="logout"><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a></li>
                <li>
	    		    <div class="dropdown" style="background-color: black;">
				    <div class="dropdown-toggle" style="padding: 15px; background-color: black; color: white;" type="button" data-toggle="dropdown">
				    <i class="fa fa-cogs" aria-hidden="true"></i>설 정</div>
					<ul class="dropdown-menu" >
				      <li><a href="#">마일리지</a></li>
				      <li><a href="#">개인정보 변경</a></li>
				      <li><a href="#">기타</a></li>
			    </ul>
			    </ul>
		  	</div>
  		</li>
           </c:otherwise>
        </c:choose>
  
    </div>
  </div>
</nav>

</body>

</html>