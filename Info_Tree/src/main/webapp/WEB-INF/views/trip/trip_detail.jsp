<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String ctx = request.getContextPath();    //콘텍스트명 얻어오기.
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<content tag="local_script">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>A Simple Page with CKEditor</title>
	<script src="resources/ckeditor/ckeditor.js"></script>
	<script src="resources/ckfinder/ckfinder.js"></script>
	
<!-- 	<script src="resources/js/jquery-3.1.1.js"></script> -->
	
	<script type="text/javascript">
  	 $(document).ready(function(){
			$('#update').click(function(){
					$('#editorForm').submit();
				});	
			$('#tlist').click(function(){
				
				
			});
	

		});
   </script>
</content>	
 </head>
 
<body>
 	<div class="container">
	 <form class="form-horizontal" role="form" id="editorForm" name="editorForm" method="post" action="tboardUpdateform" enctype="multipart/form-data">
	
        <div class="form-group">
        	<label class="col-md-3 control-label">제 목</label>
        	<div class="col-md-7">
        		<input class="form-control" id="t_title" type="text" value="${data.t_title}">
				<input class="form-control"  name="t_seq" id="t_seq" type="hidden" value="${data.t_seq}">
        	</div>
        </div>
        
        <div class="form-group">
        	<label class="col-md-3 control-label">email </label>
        	<div class="col-md-7">
        		<input class="form-control" id="t_title" type="text" value="${sessionemail}">
        	</div>
        </div>
   		
   		 <div class="form-group">
        	<label class="col-md-3 control-label"></label>
        	<div class="col-md-7">
        		${data.t_content}
        	</div>
        </div>
   		
			
	 
	        
        <div class="form-group">
           <div class="col-lg-12" align="right">
               <button id="save" type="button" class="btn btn-default">답글</button>
               <button id="update" type="button" class="btn btn-default">수정</button>
               <button id="save" type="button" class="btn btn-default">삭제</button>
               <button id="tlist" onclick="location.href='trip_listform'" type="button" class="btn btn-default">목록</button>
           </div>    
    	</div>
	  	    
	</form>
	
</div>

	

      
 
    </body>
</html>