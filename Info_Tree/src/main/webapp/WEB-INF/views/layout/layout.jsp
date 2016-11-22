<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %> 
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<html>
<head> 


<title>Bootstrap Example</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/css/infotree_style.css">
	<link rel="stylesheet" href="resources/font-awesome-4.7.0/css/font-awesome.min.css">
	
	<script src="resources/js/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script src="resources/js/parsley.min.js"></script>
	
	
	<script>
	$(document).ready(function(){
	    $("#login").click(function(){
	        $("#myModal").modal();
	    });
	    if("${modal}" == "modal"){
	        $("#myModal").modal();
	       }
	});
	</script>
</head>

<body>
	<div class="container-fluid">
		
		<div class="row">
		<c:if test='${top}'>
			<page:applyDecorator name="top"/>
		</c:if>	
		</div>
		<div class="row">
			<page:applyDecorator name="header"/>
		</div>
		<div class="row">
			<decorator:body />
		</div>
		<div class="row">
			<page:applyDecorator name="footer"/>
		</div>
	</div>		
	
	<decorator:getProperty property="page.local_script"/>
	
	
	<!--- Modal --->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
<form id="login_form" name="login_form" class="form-horizontal" action="logIn" method="POST" role="form" data-parsley-validate="true">
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> E-mail</label>
              <input type="text" class="form-control" id="email" name="email" placeholder="Enter email">
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" id="password" name="password" placeholder="Enter password">
            </div>
            
            <div class="form-group">
            <c:if test="${see}">
            	<div class="row" style="text-align: center; color: red;">
	              <label>E-mail 또는 비밀번호가 다릅니다.</label>
	            </div>
           	</c:if>
           	</div>
           
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger btn-default pull-left" data-dismiss="modal" onclick="location.href='home'"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>Not a member? <a href="#">Sign Up</a></p>
          <p>Forgot <a href="#">Password?</a></p>
        </div>
      </div>
      
    </div>
  </div>	
</form>
</body>




</html>

    