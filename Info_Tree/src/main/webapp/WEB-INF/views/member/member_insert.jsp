<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<content tag="local_script">
	 <link rel="stylesheet" href="resources/font-awesome-4.7.0/css/font-awesome.min.css">
	 <script src="resources/js/parsley.min.js"></script>
<title>Join Member Page</title>
      
   <script type="text/javascript">
   		function doReset(){
//    				document.insert_form.id.value="";
//    				document.insert_form.nickname.value="";
//    				document.insert_form.id.value="";
//    				document.insert_form.id.value="";
   		
   			}
   
   	$(document).ready(function(){
   		$('#save').click(function(){
   			if($('#confirm_chk').val()=='no'){
   				alert("E-mail 중복 체크를 하세요!");
   				return;
   			}
   			$('#insert_form').submit();
   		});
   		
  		
   		$('#confirm').click(function(){
   			var id =$('#id').val();
   			if(id==""){
   				alert("ID or NAME or NickName를 입력하세요");
   				return;
   			}
   			$.ajax({
   				type: 'POST',
   				data: "id=" + id,
   				dataType: 'json',
   				url :'idconfirm',
   				success : function(data){
   				//		alert(data);
   					if(data==0){
   						alert("중복된 ID입니다.");
   					}else{
   						alert("사용 가능한 ID입니다.");
   						$('#confirm_chk').attr('value','yes');
   	   					}
   					return false;
     				}
   			});
  		});
   	});
   </script>
   </content>
</head>
<body class="div-bgcolor-gray" onload="doReset();">

<form id="insert_form" name="insert_form" class="form-horizontal" action="memberInsert" method="POST" role="form" data-parsley-validate  enctype="multipart/form-data">
   <div class="contatiner">
     <span class="text-success text-center"><h1>정보나무 회원가입</h1></span>
 
     <br><br>
      <div class="row">
         <div class="col-md-4"><span></span></div>
         <div class="col-md-4">
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-id-card" aria-hidden="true"></i></span>
               <input id="nickname" name="nickname" class="form-control input-lg" text="text" size="16" placeholder="ID or Name or NickName"
               data-parsley-required="true" data-parsley-error-message="please insert your NAME" data-parsley-errors-container="div[id='validatename']" />
            </div>            
            <div id="validatename" style="color:#ff0000"></div>
            <br>
            <br>            
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
               <input id="email" name="email" class="form-control input-lg" text="text" size="16" placeholder="E-MAIL"
               data-parsley-required="true" data-parsley-error-message="please insert your E-MAIL" data-parsley-errors-container="div[id='validateEmail']" />
               <span class="input-group-btn">
                  <button   id="email" type="button" class="btn btn-info btn-lg" >Confirm</button>
                  <input type="hidden" id="confirm_chk"   value="no" />
               </span>
            </div>
                <div id="validateEmail" style="color:#ff0000"></div>
            <br>
            <br>    
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-unlock-alt" ></i></span>
               <input name="password" class="form-control input-lg" type="password" id="password" size="16" placeholder="PASSWORD"
               data-parsley-required="true" data-parsley-error-message="please insert your PASSWORD" data-parsley-errors-container="div[id='validatePassword']" />
            </div>
            <div id="validatePassword" style="color:#ff0000"></div>
            <br>
            <br>    
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
               <input name="repassword" class="form-control input-lg" type="password" id="repassword" size="16" placeholder="REPASSWORD"
               data-parsley-required="true" data-parsley-error-message="please check Password and RePASSWORD" data-parsley-errors-container="div[id='validateRePassword']" 
               data-parsley-equalto="#password"/>
            </div>
            <div id="validateRePassword" style="color:#ff0000"></div>
        </div>
      </div>
                 <br>
            <br>    
      <div class="row">
         <div class="col-md-4"><span></span></div>
         <div class="col-md-4">

           <div align="center">
               <button id="save" type="submit" class="btn btn-info btn-lg">&nbsp;&nbsp;Save&nbsp;&nbsp;</button>
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