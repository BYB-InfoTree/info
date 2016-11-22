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
        <span class="icon-bar"></span>
      </button>
      
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    
    
    
    <div class="collapse navbar-collapse" id="myNavbar">
    
      <ul class="nav navbar-nav">
        <li class="active"><a href="home">Home</a></li>
        
	      	<li class="dropdown">
			    <li class="dropdown-toggle" type="button" data-toggle="dropdown"><a>Life Story <span class="caret"></span></a></li>
			    <ul class="dropdown-menu">
				      <li><a href="#">여행</a></li>
				      <li><a href="#">맛집</a></li>
				      <li><a href="#">미용</a></li>
			    </ul>
		  	</li>
		  	
        <li><a href="#">Stores</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
      	<c:choose>
        <c:when test="${sessionemail == null}">
       		<li><a href="memberInsertForm" id="join"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;회원가입</a></li>
       	</c:when>
        </c:choose>
       	
       	<c:choose>
        <c:when test="${sessionemail == null}">
        	<li><a href="#" id="login"><span class="fa fa-sign-in fa-lg"></span>&nbsp;&nbsp;로그인</a></li>
        </c:when>
        </c:choose>
        
        <c:choose>
        <c:when test="${sessionemail != null}">
        	<li>
        		<li class="dropdown">
				   <li class="dropdown-toggle" id="dropdownMenu1" type="button" data-toggle="dropdown"><a href="#"><i class="fa fa-bars fa-lg" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;${sessionnickname}</a></li>
					    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
					    	  <li><a href="#">회 원 등 급 : ${sessionmemberlevel}</a></li>
						      <li><a href="#">마 일 리 지 : ${sessionpoint} point</a></li>
						      <li><a href="#">정 보 수 정</a></li>
					    </ul>
			  	</li>
			</li>  	
        </c:when>
        </c:choose>
        
        <c:choose>
        <c:when test="${sessionemail != null}">
        	<li><a href="logOut" id="logout"><span class="fa fa-sign-out fa-lg"></span>  로그아웃</a></li>
        </c:when>
        </c:choose>
        
        	<li style="width: 20px;"><a>&nbsp;</a></li>
      </ul>
    </div>
  </div>
</nav>

</body>

</html>