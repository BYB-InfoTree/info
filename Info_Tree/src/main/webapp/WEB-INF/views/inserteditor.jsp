<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<content tag="local_script">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	 <script src="resources/js/jquery-3.1.1.min.js"></script>
	 <script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
	
		
		
		
	
</content>	
</head>
<body>
<div class="container">
	<form class="form-horizontal" role="form" id="editorForm" method="post" action="/">
	    <div class="form-group">
	        <div class="form-group">
	            <div class="col-lg-12">
	                <textarea name="ckeditor" id="ckeditor"></textarea>
	            </div>
	        </div>
	        <div class="form-group">
	            <div class="col-lg-12" align="right">
	                <button type="submit" class="btn btn-default">저장</button>
	            </div>
	        </div>
	    </div>
	</form>     
   	
	   	<script>
	    $(function(){
	         
	        CKEDITOR.replace( 'ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용
	            width:'100%',
	            height:'400px',
	            filebrowserImageUploadUrl: 'community/imageUpload' //여기 경로로 파일을 전달하여 업로드 시킨다.
	        });
	         
	         
	        CKEDITOR.on('dialogDefinition', function( ev ){
	            var dialogName = ev.data.name;
	            var dialogDefinition = ev.data.definition;
	          
	            switch (dialogName) {
	                case 'image': //Image Properties dialog
	                    //dialogDefinition.removeContents('info');
	                 
	                    break;
	            }
	        });
	         
	    });
		</script>

</div>	 		
</body>
</html>