<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<content tag="local_script">
<script type="text/javascript">
$(document).ready(function(){
	$('#save').click(function(){	
		if(($('password').val() != $('repassword').val())){
				alert('비밀번호를 다시 확인해주세요.');
				return;
		}
		$('#insert_form').submit();
		
	});
});
</script>
</content>
</head>
<body>


<form id="delete_form" name="delete_form" class="form-horizontal" action="memberDelete" method="post" role="form" >
</form>

<form id="insert_form" name="insert_form" class="form-horizontal" action="memberlistupdate" method="post" role="form"   >
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
               readonly="readonly" />

            </div>
          
             <br>
             <br>
             
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-id-card" aria-hidden="true"></i></span>
               <input id="nickname" name="nickname" class="form-control input-lg" type="text" size="16" placeholder="NickName" value="${data.getNickname()}"
               />
            </div>            
          
            <br>
            <br>
            
             <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-id-card" aria-hidden="true"></i></span>
               <input id="name" name="name" class="form-control input-lg" type="text" size="16" placeholder="Name" value="${data.getName()}"
               />
            </div>            
          
            <br>
            <br>
         	
                
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-unlock-alt" ></i></span>
               <input name="password" class="form-control input-lg" type="text" id="password" size="16" placeholder="새 비밀번호" value="${data.getPassword()}"
               />
            </div>
          
            <br>
            <br> 	
            
            
            
            
             <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-unlock-alt" ></i></span>
               <input name="point" class="form-control input-lg" type="text" id="point" size="16" placeholder="포인트"  value="${data.getPoint()}" 
               />
            </div>
            <br>
            <br>
            
             <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-unlock-alt" ></i></span>
               <input name="phone" class="form-control input-lg" type="text" id="phone" size="16" placeholder="핸드폰"  value="${data.getPhone()}"    
               />
            </div>
            <br>
            <br>
            
            
             <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-unlock-alt" ></i></span>
               <input name="memberlevel" class="form-control input-lg" type="text" id="memberlevel" size="16" placeholder="멤버레벨" value="${data.getMemberlevel()}"    
               />
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