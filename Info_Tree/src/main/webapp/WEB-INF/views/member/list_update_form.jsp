<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<title>Insert title here</title>

<content tag="local_script">

<script src="resources/js/parsley.min.js"></script>
<script type="text/javascript">

   $(document).ready(function(){
	   $('#save').click(function(){
		   var result = confirm("수정 하시겠습니까?");
		    if(result){
			  	$('#insert_form').submit();
		    }else{
		    	return;
		    }   
		});
	   $('#goout').click(function(){
		    var result = confirm("삭제하시겠습니까?");
		    if(result){
			  	if($('#password').val() == '${data.getPassword()}') {
	
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
		   	$('#cancel_form').submit();
	   });
	});
</script>

</content>
</head>
<body>
<form id="delete_form" name="delete_form" class="form-horizontal" action="memberDelete" method="post" role="form" ></form>
<form id="cancel_form" name="cancel_form" class="form-horizontal" action="memberCancel" method="post" role="form" ></form>





<form id="insert_form" name="insert_form" class="form-horizontal" action="memberListUpdate" method="post" role="form" data-parsley-validate="ture"  >
   <div class="contatiner">
     <span class="text-success text-center"><h1>정보나무 정보 수정</h1></span>
 	 <br>
 	 <br> 	
      <div class="row">
         <div class="col-md-4"><span></span></div>
 
         <div class="col-md-4">
	         <br>
             E-mail
             <br>
            <div class="input-group">
                 <span class="input-group-addon"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
               <input id="email" name="email" class="form-control input-lg" type="email" text="text" size="16" placeholder="E-MAIL" value="${data.getEmail()}"
               readonly="readonly" data-parsley-required="true" data-parsley-error-message="please insert your E-MAIL" data-parsley-errors-container="div[id='validateEmail']" />
            </div>
            <div id="validateEmail" style="color:#ff0000"></div>
             <br>
             nickname
             <br>
             
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-id-card" aria-hidden="true"></i></span>
               <input id="nickname" name="nickname" class="form-control input-lg" type="text" size="16" placeholder="NickName" value="${data.getNickname()}"
               data-parsley-required="true" data-parsley-error-message="please insert your NICKNAME" data-parsley-errors-container="div[id='validatenickname']" />
            </div>            
            <div id="validatenickname" style="color:#ff0000"></div>    
            <br>
            password
            <br>
    		 <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-unlock" aria-hidden="true"></i></span>
               <input  class="form-control input-lg" type="text" id="password" name="password" size="16" placeholder="현재 비밀번호" value="${data.getPassword()}"
               data-parsley-required="true" data-parsley-error-message="please insert your PASSWORD" data-parsley-errors-container="div[id='validatepassword']" />
            </div>
            <div id="validatepresent" style="color:#ff0000"></div> 
 			<br>
            Name
            <br>
             <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-id-card" aria-hidden="true"></i></span>
               <input id="name" name="name" class="form-control input-lg" type="text" size="16" placeholder="Name" value="${data.getName()}"
               data-parsley-required="true" data-parsley-error-message="please insert your NAME" data-parsley-errors-container="div[id='validatename']" />
            </div>            
            <div id="validatename" style="color:#ff0000"></div>    
            <br>
            Point
            <br>
             <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-id-card" aria-hidden="true"></i></span>
               <input id="point" name="point" class="form-control input-lg" type="text" size="16" placeholder="Point" value="${data.getPoint()}"
               data-parsley-required="true" data-parsley-error-message="please insert your POINT" data-parsley-errors-container="div[id='validatepoint']" />
            </div>            
            <div id="validatepoint" style="color:#ff0000"></div>    
            <br>
            Phone
            <br>
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-id-card" aria-hidden="true"></i></span>
               <input id="phone" name="phone" class="form-control input-lg" type="text" size="16" placeholder="phone" value="${data.getPhone()}"
               data-parsley-required="true" data-parsley-error-message="please insert your POINT" data-parsley-errors-container="div[id='validatephone']" />
            </div>            
            <div id="validatephone" style="color:#ff0000"></div>    
            <br>
            MemberLevel
            <br>
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-id-card" aria-hidden="true"></i></span>
               <input id="memberlevel" name="memberlevel" class="form-control input-lg" type="text" size="16" placeholder="phone" value="${data.getMemberlevel()}"
               data-parsley-required="true" data-parsley-error-message="please insert your POINT" data-parsley-errors-container="div[id='validatememberlevel']" />
            </div>            
            <div id="validatememberlevel" style="color:#ff0000"></div>    
            <br>
            Seq
            <br>
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-id-card" aria-hidden="true"></i></span>
               <input id="seq" name="seq" class="form-control input-lg" type="text" size="16" placeholder="seq" value="${data.getSeq()}"
               data-parsley-required="true" data-parsley-error-message="please insert your POINT" data-parsley-errors-container="div[id='validateseq']" />
            </div>            
            <div id="validateseq" style="color:#ff0000"></div>    
            <br>
            JoinDate
            <br>
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-id-card" aria-hidden="true"></i></span>
               <input id="joindate" name="joindate" class="form-control input-lg" type="text" size="16" placeholder="joindate" value="${data.getJoindate()}"
               data-parsley-required="true" data-parsley-error-message="please insert your POINT" data-parsley-errors-container="div[id='validatejoindate']" />
            </div>            
            <div id="validatejoindate" style="color:#ff0000"></div>    
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
		          <button id="cancel"  type="button"  class="btn btn-info btn-lg">&nbsp;Cancel&nbsp;</button>
		          <span>&nbsp;&nbsp;</span>
		          <span>&nbsp;&nbsp;</span>
		          <button name="goout" id="goout"  type="button"  class="btn btn-info btn-lg">&nbsp;탈퇴&nbsp;</button>
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