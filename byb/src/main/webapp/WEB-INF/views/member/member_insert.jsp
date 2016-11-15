<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<content tag ="local_script">
	<title>Member Regist</title>
	   <link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/font-awesome.min.css">
	
	   <script src="resources/bootstrap-3.3.7-dist/js/parsley.min.js"></script>
	   
	   <script type="text/javascript">
	   
		   	function doReset(){
		   		document.insert_form.email.value="";
		   		document.insert_form.password.value="";
		   		document.insert_form.repassword.value="";
		   		document.insert_form.nickname.value="";
		   	}
		   	
			
		   $(document).ready(function(){
				$('#save').click(function(){
					if($('#confirm_chk').val()=='no'){
						alert("아이디 중복체크를 하세요!");
						return;
					}
					$('#insert_form').submit();					
				});
				
				
				$('#confirm').click(function(){
					var id =$('#email').val();
					if(id == ""){
						alert("E-mail을 입력해주세요.");
						return;
					}
					
					$.ajax({
						type: 'POST',
						data:"email=" + e-mail,
						dataType : 'json',
						url : 'idconfirm',
						success : function(data) {
							alert(data + "값");
							if(data==0){
								alert("사용가능한 E-mail 입니다.");
								$('#confirm_chk').attr('value','yes');
							}else{
								alert("중복된 E-mail 입니다.")
							}
							return false;
						}
					});
				});
				
		   });
	   </script>
	   </content>
</head>
<body onload="doReset();">
<form id ="insert_form" name="insert_form" class="form-horizontal" action="#" method="POST" role="form" data-parsley-validate="true">
	<div class="container-fluid">
		<div class="row" style="text-align: center; margin-bottom: 30px;"><h1>&nbsp;&nbsp;&nbsp;&nbsp;회 원 가 입</h1></div>
		<div class="row">
			<div class="col-md-offset-4 col-md-5">
				<div class="input-group col-md-12">
					<span class="input-group-addon" style="width: 50px;"><i class="fa fa-envelope fa-3x" aria-hidden="true"></i></span>
				    <input id="email" name="email" type="email" class="form-control" style="height: 60px; font-size: 20px;" text="text" size="16" placeholder="e-mail" required="" data-parsley-error-message="E-mail을 입력해 주세요." data-parsley-errors-container="div[id='validateEmail']" autofocus/>
		            <div class="input-group-btn" >
			        	<button type="button" id=confirm class="btn btn-success" style="height: 60px;">중복체크</button>
			        	<input id="confirm_chk" type="hidden" value="no"/>
		            </div>
		        </div>
		        <div id="validateEmail" style="color:#ff0000"></div>
		        
	            <div class="input-group col-md-10 margin_top">
	            	<span class="input-group-addon" style="width: 50px;"><i class="fa fa-lock fa-3x" aria-hidden="true"></i></span>
				    <input id="password" name="password" class="form-control" style="height: 60px; font-size: 20px;" type="password" text="text" size="16" placeholder="password" maxlength="20" required="" data-parsley-error-message="Password를 입력해 주세요." data-parsley-errors-container="div[id='validatePassword']"/>
		        </div>
		        <div id="validatePassword" style="color:#ff0000"></div>
		        <div class="input-group col-md-10 margin_top">
		        	<span class="input-group-addon" style="width: 50px;"><i class="fa fa-lock fa-3x" aria-hidden="true"></i></span>
				    <input id="repassword" name="repassword" class="form-control"  style="height: 60px; font-size: 20px;" type="password" text="text" size="16" placeholder="repassword" maxlength="20" required="" data-parsley-error-message="Repassword를 입력해 주세요." data-parsley-errors-container="div[id='validateRepassword']"/>
		        </div>
		        <div id="validateRepassword" style="color:#ff0000"></div>
		        <div class="input-group col-md-10 margin_top">
		        	<span class="input-group-addon" style="width: 50px;"><i class="fa fa-user fa-3x" aria-hidden="true"></i></span>
				    <input id="nickname" name="nickname" class="form-control" style="height: 60px; font-size: 20px;" text="text" size="16" placeholder="nickname" maxlength="8" required="" data-parsley-error-message="Nick Name을 입력해 주세요." data-parsley-errors-container="div[id='validateNickname']"/>
		        </div>
		        <div id="validateNickname" style="color:#ff0000"></div>
		        <div class="col-md-10 margin_top">
		        	<div class="col-md-offset-3 col-sm-2">
		        	<button id="save" name="save" type="button" class="btn btn-success" style="font-size: 20px;">가 입</button>
		        	</div>
		        	<div class="col-md-offset-2 col-sm-2 margin_bottom">
		       		<button id="cancel" name=""cancel"" type="button" class="btn btn-info" style="font-size: 20px;" onclick="location.href='home'">취  소</button>
		        	</div>
		        </div>
			</div>
			
			<div class="col-md-offset-1 col-md-2">
				
			</div>
		</div>
	</div>
</form>
</body>
</html>