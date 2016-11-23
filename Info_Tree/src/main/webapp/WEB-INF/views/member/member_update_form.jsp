<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<title>Insert title here</title>

<content tag="local_script">

<!-- <script src="resources/js/parsley.min.js"></script> -->
<script type="text/javascript">

   $(document).ready(function(){
	   $('#save').click(function(){
		   
		   if( $('#nickname').val() ==''){
			   alert('닉네임을 입력해주세요~!!');
			   return;
		   }
		   if( $('#presentpassword').val() =='') {
			   
			   alert("현재 비밀번호값을 입력해주세요~!");
			   return;
		   }	   
		   if( ($('#password').val() ==''&& $('#repassword').val() !='') || ($('#password').val() !='' && $('#repassword').val() =='' ) ){
			   	alert("1패스워드 확인을 부탁드립니다.");
			   	return;   
		   }else if( ($('#password').val() !=''  && $('#repassword').val() !='') && ($('#password').val() ==  $('#repassword').val()) ){
				if($('#presentpassword').val() == '${data.getPassword()}'){
						
						$('#insert_form').submit();		
				}else{
					alert("현재 비밀번호를 다시확인하여 주세요.");
					return;
				} 
		   }else if( ($('#password').val() !=''  && $('#repassword').val() !='') && ($('#password').val() !=  $('#repassword').val()) ){
			   alert("비밀번호와 새비밀번호값을 확인해주세요~~!!");
			   return;
			   
		   }else if( ($('#password').val() ==''  && $('#repassword').val() =='')  ){
			   alert("현재비번 새비번 둘다널 닉네임값만 변경");
				$('#insert_form').submit();	
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
	   
	   $('#cancel').click(function(){
					   
	   });
	});
</script>

</content>
</head>
<body>


<form id="delete_form" name="delete_form" class="form-horizontal" action="memberDelete" method="post" role="form" >
</form>

<form id="insert_form" name="insert_form" class="form-horizontal" action="memberUpdate" method="post" role="form" data-parsley-validate="ture"  >
   <div class="container">
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
<!--                <span class="input-group-btn"> -->
<!--                   <input type="hidden" id="confirm_chk"   value="no" /> -->
<!--                </span> -->
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
               <input  class="form-control input-lg" type="password" id="presentpassword" name="presentpassword" size="16" placeholder="현재 비밀번호" 
               data-parsley-required="true" data-parsley-error-message="please insert your PASSWORD" data-parsley-errors-container="div[id='validatepresent']" />
            </div>
            <div id="validatepresent" style="color:#ff0000"></div> 
            <br>
            <br> 	
            
            
           
			
                
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-unlock-alt" ></i></span>
               <input name="password" class="form-control input-lg" type="password" id="password" size="16" placeholder="새 비밀번호"
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