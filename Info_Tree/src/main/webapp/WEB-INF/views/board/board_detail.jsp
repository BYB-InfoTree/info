<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<content tag="local_script">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<title>Board Detail</title>

<script src="resources/js/parsley.min.js"></script>

<style type="text/css">
	/* Some custom styles to beautify this example */
	.demo-content{
		background: #ff0000;
	}
	.demo-content.bg-alt{
		background: #ff0000;
	}
</style>	
		<script>
		$(document).ready(function(){
		   $('#delete').click(function(){
			    var result = confirm("삭제하시겠습니까?");
			    if(result){
			    		alert('확인을 누르면 삭제됩니다.');			    		
						$('#boardDelete').submit();
			    }else{
			    	return;
			    } 
		   });
		 }); 
		</script>

</content>
</head>

<body>
<form id="boardDelete" name="boardDelete" class="form-horizontal" action="boardDelete" method="post" role="form" >
   <input class="form-control" style="text-align:center" id="b_seq" type="hidden" name="b_seq"  value="${board.b_seq}" >
</form>
	<form class="form-horizontal" action="boardUpdate" method="post" role="form" data-parsley-validate="true">
				<span class="text-success text-center"><h1>Board Detail</h1></span>
			     <p class="text-success text-center">이것은 연습을 하기위한 페이지 입니다.</p>
			
				<br>
				<div class="container">
			    				    
				    <div class="form-group">
				      <label class="col-sm-2 control-label">제   목</label>
				      <div class="col-sm-8" style="text-align:center">
				        <input class="form-control" style="text-align:center" id="b_title" type="text" name="b_title"  value="${board.b_title}" >
				      </div>
				    </div>
				    
				   
				       <input class="form-control" style="text-align:center" id="b_seq" type="hidden" name="b_seq"  value="${board.b_seq}" >
			
				 </div>
				    
				    <div class="form-group">
				      <div class="col-sm-12" style="text-align:center">
				        ${board.b_content}
				      </div>
				    </div>

          
  				    <div class="row col-sm-12 " style="text-align:center" >
					<div class="checkbox">
					  <c:if  test="${sessionmemberlevel == 'master' || sessionemail == board.b_email}">
			     		<button  type="button" onclick="location.href='boardUpdateForm?b_seq=${board.b_seq}'"  class="btn btn-default">Update</button>
			   			<button  id="delete" type="button" onclick="myFunction()" class="btn btn-default">Delete</button>

 		 		 	 </c:if>	
	 		     	   	<button type="button"  onclick="location.href='boardReply?b_seq=${board.b_seq}'"  class="btn btn-default">답    글</button>
			   			<button type="button"  onclick="location.href='boardListForm'"  class="btn btn-default">목   록</button>
					</div>
					</div>	
			 </form>
			</div>
					
</form>
</body>
</html>