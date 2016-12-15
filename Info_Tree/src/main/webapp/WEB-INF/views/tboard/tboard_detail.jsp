<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<content tag="local_script">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<title>Travel Detail</title>

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
						$('#tBoardDelete').submit();
			    }else{
			    	return;
			    } 
		   });
		 }); 
		</script>

</content>
</head>

<body>
<form id="tBoardDelete" name="tBoardDelete" class="form-horizontal" action="tBoardDelete" method="post" role="form" >
   <input class="form-control" style="text-align:center" id="t_seq" type="hidden" name="t_seq"  value="${tboard.t_seq}" >
</form>
	<form class="form-horizontal" action="boardUpdate" method="get" role="form" data-parsley-validate="true">
				<span class="text-success text-center"><h1>Travel Board Detail</h1></span>
			     <p class="text-success text-center">이것은 연습을 하기위한 페이지 입니다.</p>
			
				<br>
				<div class="container">
			
				    				    
				    <div class="form-group">
				      <label class="col-sm-2 control-label">제   목</label>
				      <div class="col-sm-8" style="text-align:center">
				        <input class="form-control" style="text-align:center" id="t_email" type="text" name="t_email"  value="${tboard.t_title}" >
				      </div>
				    </div>
				       <input class="form-control" style="text-align:center" id="t_seq" type="hidden" name="t_seq"  value="${tboard.t_seq}" >
			
				    
				    <div class="form-group">
				      <label class="col-sm-2 control-label">내  용</label>
				      <div class="col-sm-8" style="text-align:center">
				        ${tboard.t_content}
				      </div>
				    </div>
	
            <c:if  test="${sessionmemberlevel == 'master' || sessionemail == tboard.t_email}">
  				    <div class="row col-sm-12 " style="text-align:center" >
					<div class="checkbox">
			     		<button  type="button" onclick="location.href='tBoardUpdateForm?t_seq=${tboard.t_seq}'"  class="btn btn-default">Update</button>
			   			<button  id="delete" type="button" onclick="myFunction()" class="btn btn-default">Delete</button>
 		  	 </c:if>	
	 		     	   	<button type="button"  onclick="location.href='boardReply?b_seq=${board.b_seq}'"  class="btn btn-default">답    글</button>
			   			<button type="button"  onclick="location.href='tBoardListForm'"  class="btn btn-default">목   록</button>
					</div>
					</div>	
			 </form>
			</div>
					
</form>
</body>
</html>