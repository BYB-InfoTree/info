<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<content tag="local_script">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<script src="resources/js/parsley.min.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
		$('#save').click(function(){
// 			$('#insert_form').submit();
		});
	});


</script>


</content>
</head>
<body>


	<div class="container">
	  <span class="text-success text-center"><h2>회 원 가 입</h2></span>
	  <br>
	  <form id="insert_form" action="memberInsert" data-parsley-validate="ture" method="get">
	  <div class="row">
		  <div class="col-md-offset-4 col-md-4">
		    <div class="input-group">
		     
		   	  <span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
		      <input type="text" class="form-control" id="usr"  placeholder="이메일"
		       data-parsley-required="true" data-parsley-error-message="please insert your PASSWORD" data-parsley-errors-container="div[id='validateEmail']" />
		      <div class="input-group-btn" style="margin-left:30px ">
				<button type="button" id="confirm" class="btn btn-default" >Confirm</button>
				<input id="confirm_chk" type="hidden" name="confirm_chk" value="no"/>
		      </div>  
		    </div>
		   	<br>
		   	
		    <div class="input-group">
		      <span class="input-group-addon"><i class="fa fa-male" aria-hidden="true"></i></span>	
		      <input type="password" class="form-control" id="pwd"   placeholder="닉네임" />
		    </div>
		    <br>
		    
		    <div class="input-group">
		       <span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>	
		       <input type="password" class="form-control" id="pwd"  placeholder="비밀번호" 
		       data-parsley-required="true" data-parsley-error-message="please insert your PASSWORD" data-parsley-errors-container="div[id='validatePassword']" />
		    </div>
		    <br>
		    
		    <div class="input-group">
		       <span class="input-group-addon"><i class="fa fa-male" aria-hidden="true"></i></span>	
		      <input type="password" class="form-control" id="pwd"   placeholder="비밀번호확인" />
		    </div>
		    
		    <br>
		    
	    	<div align="center">
				<button id="save" name="save" type="button" class="btn btn-default">Save</button>
				<span>&nbsp;&nbsp;</span>
				<span>&nbsp;&nbsp;</span>
				<button type="button" name="cancel" class="btn btn-default">Cancel</button>
			</div>
	    
		   
		   
		   
		  </div>  
	  </div>	  
	    
	  </form>
	</div>   


</body>
</html>