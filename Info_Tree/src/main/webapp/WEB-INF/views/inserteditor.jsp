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
	 <script type="text/javascript">
// 		window.onload=function() {
		
// 			CKEDITOR.replace('aoa');
			
// 			CKEDITOR.replace('aoa',{uiColor:'#FFFFFF'});
			
// 			CKEDITOR.replace('aoa',{
// 				skin:'v2'
// 			})
// 		};
		
		
		
		$(document).ready(function(){
			$('#hoho').click(function(){
				var data = CKEDITOR.instances.aoa.getData();
				alert(data);
			});	
		});
		
	</script>
</content>	
</head>
<body>
<div class="container">
     
      <div class="row">
         <div class="col-md-1"><span></span></div>
         <div class="col-md-10" style="height: 600px; border: solid; color: blue;">	   

<!-- <textarea name="inputArticleContents"  id="aoa" class="ckeditor" rows="20" cols="50"></textarea> -->
		 	<textarea name="aoa" id="aoa" rows="20" cols="50" style="height: 600px"></textarea>
		 	
		 <script type="text/javascript">
		
		 CKEDITOR.replace( 'aoa' );
		 CKEDITOR.replace('aoa',{uiColor:'#7FFFD4'});
		</script>
		 	
		 	
		</div>
		<button  id='hoho' name="hoho" type="button" class="btn btn-info btn-lg">클릭</button>
<!-- 		  = CkEDITOR.instances.aoa.getData(); -->
	 </div>
</div>	 		
</body>
</html>