<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- <link rel="stylesheet" -->
<!-- 	href="resources/css/font-awesome.min.css"> -->
<script src="resources/js/parsley.min.js"></script>








</head>
<body>


	<div class="container">
	  <span class="text-success text-center"><h2>회 원 가 입</h2></span>
	  <br><br>
	  <form>
	  <div class="row">
		  <div class="col-md-offset-4 col-md-4">
		    <div class="input-group">
		     
		   	  <span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
		      <input type="text" class="form-control" id="usr"  placeholder="이메일" />
		      <span class="input-group-btn" style="margin-left:10px ">
				<button type="button" id="confirm" class="btn btn-default" >Confirm</button>
				<input id="confirm_chk" type="hidden" name="confirm_chk" value="no"/>
		      </span>
		      
		    </div>
		    <br>
		    <div class="input-group">
		       <span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>	
		      <input type="password" class="form-control" id="pwd"  placeholder="비밀번호" />
		    </div>
		    
		    <br>
		    <div class="input-group">
		       <span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>	
		      <input type="password" class="form-control" id="pwd"   placeholder="비밀번호확인" />
		    </div>
		   
		   
		  </div>  
	  </div>	  
	    
	  </form>
	</div>   


</body>
</html>