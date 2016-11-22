<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<content tag="local_script">
	 <link rel="stylesheet" href="resources/font-awesome-4.7.0/css/font-awesome.min.css">
	 <script src="resources/js/parsley.min.js"></script>
<title>Join Member Page</title>
      
   <script type="text/javascript">

   
   	$(document).ready(function(){

   		$('#update').click(function(){

   			if($('#password').val()!='${sessionpassword}'){
   				alert("현재 PASSWORD를 확인 하세요!");
   				return;
   			}
    			$('#insert_form').submit();
    		});
 
   		$('#delete').click(function() {
   			if($('#password').val()!='${sessionpassword}'){
   				alert("현재 PASSWORD를 확인 하세요!");
   				return;
   			}
	        var result = confirm('모든 정보가 지워집니다. 탈퇴하시겠습니까?');
	        if(result) {
	        	var email =$('#email').val();
	        	$.ajax({
	   				type: 'POST',
	   				data: "email=" + email,
	   				dataType: 'json',
	   				url :'memberDelete',
	        	});
	        	alert("모든 정보가 삭제 되었습니다.");
	            location.replace('home');
	        } else {
	        	location.replace('home');
	        }
	    });
   		

   	});
   </script>
   </content>
</head>
<body class="div-bgcolor-gray">

<form id="insert_form" name="insert_form" class="form-horizontal" action="memberUpdate" method="post" role="form" data-parsley-validate >
   <div class="contatiner">
     <span class="text-success text-center"><h1>회원 정보 수정 </h1></span>
 	 <br>
 	 <br> 	
      <div class="row">
         <div class="col-md-4"><span></span></div>
         <div class="col-md-4">
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
               <input id="email" name="email" class="form-control input-lg" type="email" text="text" size="16" placeholder="E-MAIL"
               data-parsley-required="true" data-parsley-error-message="please insert your E-MAIL" value="${member.getEmail()}" readonly="readonly" 
               data-parsley-errors-container="div[id='validateEmail']" />

            </div>
            <div id="validateEmail" style="color:#ff0000"></div>
            <br>
            <br>       
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-id-card" aria-hidden="true"></i></span>
               <input id="nickname" name="nickname" class="form-control input-lg" text="text" size="16" placeholder="NickName" value="${member.getNickname()}" 
               data-parsley-required="true" data-parsley-error-message="please insert your NAME" data-parsley-errors-container="div[id='validatename']" />
            </div>            
            <div id="validatename" style="color:#ff0000"></div>
            <br>
            <br>    
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-unlock-alt" ></i></span>
               <input name="newpassword" class="form-control input-lg" type="password" id="newpassword" size="16" placeholder="NEW PASSWORD"
               data-parsley-required="true" data-parsley-error-message="please insert your NEW PASSWORD" data-parsley-errors-container="div[id='validateNewPassword']" />
            </div>
            <div id="validateNewPassword" style="color:#ff0000"></div>
            <br>
            <br>    
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
               <input name="newrepassword" class="form-control input-lg" type="password" id="newrepassword" size="16" placeholder="NEW REPASSWORD"
               data-parsley-required="true" data-parsley-error-message="please check Password and RePASSWORD" data-parsley-errors-container="div[id='validateNewRePassword']" 
               data-parsley-equalto="#newpassword"/>
            </div>
            <br>
            <br>  
            <div id="validateOldPassword" style="color:#ff0000"></div>
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-unlock-alt" ></i></span>
               <input name="password" class="form-control input-lg" type="password" id="password" size="16" placeholder="PRESENT PASSWORD"
               data-parsley-required="true" data-parsley-error-message="please insert your OLD PASSWORD" data-parsley-errors-container="div[id='validateOldPassword']" />
<!--               <span class="input-group-btn"> -->
<!--                   <button   id="confirm" name="confirm" type="button" class="btn btn-info btn-lg" >본인 확인</button> -->
<!--                   <input type="hidden" id="confirm_chk"   value="no" /> -->
<!--                </span> -->
            
            </div>
            <div id="validateOldPassword" style="color:#ff0000"></div>
             
        </div>
      </div>
            <br>
            <br>
            
      
                      
                
      <div class="row">
         <div class="col-md-4"><span></span></div>
         <div class="col-md-4">

           <div align="center">
               <button  id="update" type="button" class="btn btn-info btn-lg">&nbsp;&nbsp;정보 수정&nbsp;&nbsp;</button>
               <span>&nbsp;&nbsp;</span>
               <span>&nbsp;&nbsp;</span>
               <span>&nbsp;&nbsp;</span>
               <button id="delete" type="button"  class="btn btn-info btn-lg">&nbsp;&nbsp;정보 삭제&nbsp;&nbsp;</button>
               <span>&nbsp;&nbsp;</span>
               <span>&nbsp;&nbsp;</span>
               <span>&nbsp;&nbsp;</span>
               <button name="cancel"  type="button"  class="btn btn-info btn-lg">&nbsp;Cancel&nbsp;</button>
            </div>
            <div align="right">
				<br>
				<br>
               <kbd name="inputdate">${yyyy}</kbd> 
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