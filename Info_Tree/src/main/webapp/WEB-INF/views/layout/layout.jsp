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
<link rel="stylesheet"
href="resources/font-awesome-4.7.0/css/font-awesome.min.css">

	
	
	<script src="resources/js/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
	
	
	<script type="text/javascript">
	$(document).ready(function(){
		
		
		
		if('${result}'==1) {
			alert('회원가입을 축하합니다.');	
		}
		
	    $("#login").click(function(){
	        $("#myModal").modal();
	    });
	    
	    if("${modal}"=="modal"){
	    	$("#myModal").modal();
	    }
	    

	    
// 	    $("#mydropdown").on("show.bs.dropdown", function() {
	    	
// 	    	$("#aoa").click(function(){
// 	 			$(location).attr('href',
// 					'http://localhost:8082/byb/memberUpdateForm?email='+'${sessionemail}');
// 	    	});
// 	    });
	   
	    
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
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form id="insert_form" name="insert_form" class="form-horizontal" action="login" method="post" role="form" >	
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Email</label>
              <input type="email" class="form-control" id="email" name="email" placeholder="Enter email"/>
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" id="password" name="password" placeholder="Enter password"/>
            </div>
            
            <div class="checkbox"> 
               <label><input type="checkbox" value="" checked>Remember me</label> 
            </div>
            
            
            
            <div class="form-group">
              <div class="row" style="color:red; text-align:center;">	
	              <c:if test="${see}">
	              <label>값을 정확히 입력해주세요..!!</label>
	              </c:if>
              </div>	
            </div>
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>Not a member? <a href="#">Sign Up</a></p>
          <p>Forgot <a href="#">Password?</a></p>
        </div>
      </div>
      
    </div>
  </div>
	

</body>




</html>

    