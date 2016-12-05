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
        <li class="active"><a href="inserteditor">inserteditor</a></li>
        
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
  		 <li><a href="boardlist">보드리스트</a></li>
        <li><a href="#">Stores</a></li>
       <c:if test="${sessionlevel=='마스터'}">
        <li><a href="memberList">list</a></li>
       </c:if>  
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<c:if test="${sessionemail==null}">
       	 <li><a href="memberInsertForm" id="join"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
       	</c:if> 
       	
       	<c:if test="${sessionemail!=null}">
       		<li><a href=""><span class="glyphicon glyphicon-user"></span>${sessionnickname}</a></li>
       	</c:if>
      
       	<c:choose>
       		<c:when test="${sessionemail == null }">
       	
        		<li><a href="#" id="login"><i class="fa fa-sign-in" aria-hidden="true"></i>로그인</a></li>
        	</c:when>
        	<c:otherwise>
        	
        	
    
		<li>
			<div class="dropdown" id="mydropdown">
			    <button class="btn dropdown-toggle" style="background-color: black; margin-top:8px " type="button" data-toggle="dropdown" >
			    	<span style="color: white;">menu  </span><span class="caret" style="color: white;"></span>
			    </button>
			    <ul class="dropdown-menu">
			        <li><a href="#">회원등급 : ${sessionlevel}</a></li>
			        <li><a href="#">마일리지 : 100</a></li>
			        <li><a href="memberUpdateForm?email=${sessionemail }">정보수정</a></li>
			    </ul>
	  		</div>
       	</li>

  	
        	
        	<li><a href="logout"><span class="glyphicon glyphicon-shopping-cart"></span>logout</a></li>
        
        	</c:otherwise>
        </c:choose>
        
        
      </ul>
    </div>
  </div>
</nav>

</body>

</html>