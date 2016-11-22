<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<content tag="local_script">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="resources/js/parsley.min.js"></script>
<script type="text/javascript">

   $(document).ready(function(){
	   $('#save').click(function(){
			if($('#presentpassword').val() == '${data.getPassword()}'){
				$('#insert_form').submit();
			}else{
				alert("현재 비밀번호를 다시확인하여 주세요.");
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

<form id="delete_form" name="delete_form" action="memberDelete">


</form>






<form id="insert_form" name="insert_form" class="form-horizontal" action="memberUpdate" method="post" role="form" data-parsley-validate="ture"  >
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
               <span class="input-group-btn">
                  <input type="hidden" id="confirm_chk"   value="no" />
               </span>
<!--                <span class="input-group-btn"> -->
<%--                   <input type="hidden" id="getpassword"   value="${data.getPassword()}" /> --%>
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
               <span class="input-group-addon"><i class="fa fa-unlock-alt" ></i></span>
               <input  class="form-control input-lg" type="password" id="presentpassword" name="presentpassword" size="16" placeholder="현재 비밀번호"
               data-parsley-required="true" data-parsley-error-message="please insert your PASSWORD" data-parsley-errors-container="div[id='validatePassword']" />
            </div>
            <div id="validatePassword" style="color:#ff0000"></div> 
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
		          <button name="goout" id="goout"  type="button"  class="btn btn-info btn-lg"><a href="memberDelete">&nbsp;탈퇴&nbsp;</a></button>
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