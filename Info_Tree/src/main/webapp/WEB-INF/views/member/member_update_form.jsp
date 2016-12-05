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
		   if($('#nickname').val() == ""){
			   alert("닉네임을 입력해 주세요.");
			   return;
		   }
		   
		   if($('#password').val() == ""){
			   alert("현재 비밀번호를 입력해 주세요.");
			   return;
		   }
		   
		   if($('#password').val() != "" && ($('#newpassword').val() == "" && $('#repassword').val() == "")){
			   if($('#password').val() == '${data.getPassword()}'){
				   	alert("정보가 변경되었습니다");
			   		$('#update_form').submit();
			   }else{
				  	alert('현재 비밀번호가 일치하지 않습니다.');
				  	return;
			   }
		   }
		   
		   if($('#newpassword').val() !=  $('#repassword').val()){
			   alert("비밀번호가 일치하지 않습니다.");
			   return;
		   }
		});
	   
	   $('#goout').click(function(){
		    var result = confirm("삭제하시겠습니까?");
		    if(result){
			  	if($('#presentpassword').val() == '${data.getPassword()}') {
	
					$('#delete_form').submit();
			  		
			  	}else{
			  		alert('현재 비밀번호를 다시 확인해주세요.');
			  		return;
			  	} 	
		    }else{
		    	return;
		    }   
	   });
	});
</script>

</content>
</head>
<body>


<form id="delete_form" name="delete_form" class="form-horizontal" action="memberDelete" method="post" role="form" >


</form>






<form id="update_form" name="update_form" class="form-horizontal" action="memberUpdate" method="post" role="form" data-parsley-validate="ture"  >
   <div class="contatiner">
     <span class="text-success text-center"><h1>정보나무 정보 수정</h1></span>
 	 <br>
 	 <br> 	
      <div class="row">
         <div class="col-md-4"><span></span></div>
         <div class="col-md-4">
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
               <input id="email" name="email" class="form-control input-lg" type="email" text="text" size="16" placeholder="E-MAIL" value="${data.getEmail()}"
               readonly="readonly" data-parsley-required="true" data-parsley-error-message="please insert your E-MAIL" data-parsley-errors-container="div[id='validateEmail']" />
            </div>
            <div id="validateEmail" style="color:#ff0000"></div>
             <br>
             <br>
             
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-id-card" aria-hidden="true"></i></span>
               <input id="nickname" name="nickname" class="form-control input-lg" type="text" size="16" placeholder="ID or Name or NickName" value="${data.getNickname()}"
               data-parsley-required="true" data-parsley-error-message="please insert your NICKNAME" data-parsley-errors-container="div[id='validatenickname']" />
            </div>            
            <div id="validatenickname" style="color:#ff0000"></div>    
            <br>
            <br>
            
            
    		
            
          
            
    		 <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-unlock" aria-hidden="true"></i></span>
               <input  class="form-control input-lg" type="password" id="password" name="password" size="16" placeholder="현재 비밀번호" 
               data-parsley-required="true" data-parsley-error-message="please insert your PASSWORD" data-parsley-errors-container="div[id='validatepresent']" />
            </div>
            <div id="validatepresent" style="color:#ff0000"></div> 
            <br>
            <br> 	
            
            
           
			
                
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-unlock-alt" ></i></span>
               <input name="newpassword" class="form-control input-lg" type="password" id="newpassword" size="16" placeholder="새 비밀번호"
               data-parsley-required="true" data-parsley-error-message="please insert your PASSWORD" data-parsley-errors-container="div[id='validatePassword']" />
            </div>
            <div id="validatePassword" style="color:#ff0000"></div> 
            <br>
            <br> 	
            
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-unlock-alt" ></i></span>
               <input name="repassword" class="form-control input-lg" type="password" id="repassword" size="16" placeholder="새 비밀번호 확인"
               data-parsley-required="true" data-parsley-error-message="please insert your REPASSWORD" data-parsley-errors-container="div[id='validatePassword']" 
               data-parsley-equalto="#password"/>
            </div>
            <div id="validatePassword" style="color:#ff0000"></div>
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
		          <button name="cancel"  type="button"  class="btn btn-info btn-lg">&nbsp;Cancel&nbsp;</button>
		          <span>&nbsp;&nbsp;</span>
		          <span>&nbsp;&nbsp;</span>
		          <button name="goout" id="goout"  type="button"  class="btn btn-info btn-lg">&nbsp;탈퇴&nbsp;</button>
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