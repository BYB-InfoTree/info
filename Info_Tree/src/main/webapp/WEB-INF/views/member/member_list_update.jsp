<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<title>Insert title here</title>

<content tag="local_script">

<script type="text/javascript">

   $(document).ready(function(){
	   $('#save').click(function(){
		   var result = confirm("변경하시겠습니까?");
		   if(result){
		   		$('#update_form').submit();
		   }else{
			   return;
		   }
		});
	});
</script>
</content>
</head>

<body>
<form id="update_form" name="update_form" class="form-horizontal" action=memberListUpdate method="post" role="form" >
   <div class="contatiner">
     <span class="text-success text-center"><h1>회원 정보 수정</h1></span>
 	 <br>
 	 <br> 	
      <div class="row">
         <div class="col-md-4"><span></span></div>
        	 <div class="col-md-4">
	            <div class="input-group">
	               <span class="input-group-addon"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
	               <input id="email" name="email" class="form-control input-lg" type="email" text="text" size="16" placeholder="E-MAIL" value="${member.getEmail()}" readonly="readonly"/>
	            </div>
	             <br>
	             <br>
	             
	            <div class="input-group">
		              <span class="input-group-addon"><i class="fa fa-id-card" aria-hidden="true"></i></span>
		              <input id="nickname" name="nickname" class="form-control input-lg" type="text" size="16" placeholder="NickName" value="${member.getNickname()}"/>
	            </div>            
	            <br>
	            <br>
	            
	            <div class="input-group">
		              <span class="input-group-addon"><i class="fa fa-id-card" aria-hidden="true"></i></span>
		              <input id="name" name="name" class="form-control input-lg" type="text" size="16" placeholder="Name" value="${member.getName()}"/>
	            </div>            
	            <br>
	            <br>
	            
	    		 <div class="input-group">
		               <span class="input-group-addon"><i class="fa fa-unlock" aria-hidden="true"></i></span>
		               <input  class="form-control input-lg" type="text" id="password" name="password" size="16" placeholder="비밀번호" value="${member.getPassword()}"/>
	            </div>
	            <br>
	            <br> 
	            
	            <div class="input-group">
		              <span class="input-group-addon"><i class="fa fa-id-card" aria-hidden="true"></i></span>
		              <input id="Memberlevel" name="Memberlevel" class="form-control input-lg" type="text" size="16" placeholder="회원등급" value="${member.getMemberlevel()}"/>
	            </div>            
	            <br>
	            <br>
	            
	            <div class="input-group">
		              <span class="input-group-addon"><i class="fa fa-id-card" aria-hidden="true"></i></span>
		              <input id="Point" name="Point" class="form-control input-lg" type="text" size="16" placeholder="포인트" value="${member.getPoint()}"/>
	            </div>            
	            <br>
	            <br>	
                
        	 </div>
      </div>
	            <br>
	            <br>    
      <div class="row">
         <div class="col-md-4"><span></span></div>
         <div class="col-md-4">

		      <div align="center">
		          <button id="save" type="button" class="btn btn-info btn-lg">&nbsp;&nbsp;수정&nbsp;&nbsp;</button>
		          <span>&nbsp;&nbsp;</span>
		          <span>&nbsp;&nbsp;</span>
		          <button name="cancel"  type="button"  class="btn btn-info btn-lg">&nbsp;취소&nbsp;</button>
	          </div>
            
         </div>
       </div>
      	<br>
	 	<br>
	 	<br>
	 	<br>
   </div>
</form>
</body>
</html>