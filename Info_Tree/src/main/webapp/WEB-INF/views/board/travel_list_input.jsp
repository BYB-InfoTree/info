<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<content tag="local_script">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
$(function(){
    
    CKEDITOR.replace( 'contents', {//해당 이름으로 된 textarea에 에디터를 적용
        width:'100%',
        height:'400px',
        filebrowserImageUploadUrl: 'file_upload' //여기 경로로 파일을 전달하여 업로드 시킨다.
    });
     
     
    CKEDITOR.on('dialogDefinition', function( ev ){
        var dialogName = ev.data.name;
        var dialogDefinition = ev.data.definition;
      
        switch (dialogName) {
            case 'image': //Image Properties dialog
                //dialogDefinition.removeContents('info');
                dialogDefinition.removeContents('Link');
                dialogDefinition.removeContents('advanced');
                break;
        }
    });
     
});
</script>
</content>
</head>
<body>
	<div class="row">
		<div class="col-md-offset-1 col-md-10 col-md-offset-1">
			    <textarea name="contents" id="contents" rows="10" cols="100" style="height:300px;"></textarea>
		</div>
		<div class="col-md-offset-5 col-md-2" style="margin-top: 30px;">
			    <botton class="btn btn-info btn-lg" type="button" id="savebutton" value="서버전송" >입 력</botton>
		</div> 
		<div class="col-md-2" style="margin-top: 30px;">
			    <botton class="btn btn-info btn-lg" type="button" id="savebutton" value="서버전송" >취 소 </botton>
		</div>  
	</div>

</body>
</html>