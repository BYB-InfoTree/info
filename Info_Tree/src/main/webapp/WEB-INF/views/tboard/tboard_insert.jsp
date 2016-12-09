<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String ctx = request.getContextPath();    //콘텍스트명 얻어오기.
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<content tag="local_script">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Travel Board with CKEditor</title>
	<script src="resources/ckeditor/ckeditor.js"></script>
	<script src="resources/ckfinder/ckfinder.js"></script>
	
<!-- 	<script src="resources/js/jquery-3.1.1.js"></script> -->
	
	<script type="text/javascript">
  	 $(document).ready(function(){
			$('#save').click(function(){
					$('#editorForm').submit();
				});	
	
			CKEDITOR.replace( 't_content', {//해당 이름으로 된 textarea에 에디터를 적용
	   	 	 	  width:'100%',
	     		  height:'400px',
		       filebrowserBrowseUrl:'file_upload',
		       filebrowserImageUploadUrl: 'upload'
		   });

		   CKEDITOR.on( 'dialogDefinition', function( ev ) {
			  var tab, field, dialogName = ev.data.name,
			      dialogDefinition = ev.data.definition;
			  if( dialogName == 'image' )
			  {   
			     var infoTab = dialogDefinition.getContents( 'info' );
			    txtWidth = infoTab.get( 'txtWidth' );
			    txtWidth['default'] = 550;    
			  }
			});  
		});
   </script>
</content>	
 </head>
 
<body>
	 <form class="form-horizontal" role="form" id="editorForm" name="editorForm" method="post" action="tBoardInsert" enctype="multipart/form-data">
   		<div class="container">
   		<div class="row" >
			<div class="col-md-3"></div>
			<div class="col-md-1" style="border-top-style:solid; border-top-color:#ffffff;">
				<div align="right"><label for="email">이메일</label></div>
			</div>
			<div class="col-md-5" style="border-top-style:solid; border-top-color:#ffffff;">
				<input id="t_email" name="t_email" type="text" value="${sessionemail}" class="form-control" size="30" autocomplete="off" readonly="readonly"/>
			</div>
			<div class="col-md-3"></div>
		</div>
		<br>	
		<br>	
   		<div class="row" >
			<div class="col-md-3"></div>
			<div class="col-md-1" style="border-top-style:solid; border-top-color:#ffffff;">
				<div align="right"><label for="subject">제&nbsp;&nbsp;&nbsp;&nbsp;목</label></div>
			</div>
			<div class="col-md-5" style="border-top-style:solid; border-top-color:#ffffff;">
				<input id="t_title" name="t_title" type="text" class="form-control" size="50" autocomplete="off" autofocus/>
			</div>
			<div class="col-md-3"></div>
		</div>
		<br>
		<br>
    
     <div id="ckfinder1"></div>
			
			    <div class="form-group">
			        <div class="form-group">
			            <div class="col-lg-12">
			                <textarea name="t_content" id="t_content" value="t_content"></textarea>
			            </div>
			        </div>
			        <div class="form-group">
	            <div class="col-lg-12" align="right">
	                <button id="save" type="button" class="btn btn-default">저장</button>
	            </div>
      		</div>
    </div>
</form>

	
</script>
        </div>
 
    </body>
</html>