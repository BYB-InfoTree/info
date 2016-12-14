<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<content tag="local_script">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<title>Insert title here</title>

<link rel="stylesheet"
href="resources/bootstrap-3.3.7-dist/fonts/Font-Awesome-master/css/font-awesome.css">

<link rel="stylesheet"
href="resources/font-awesome-4.6.3/css/font-awesome.css">
 <link rel="stylesheet"
   href="resources/bootstrap-3.3.7-dist/css/member.css">
<link rel="stylesheet"
href="resources/bootstrap-3.3.7-dist/css/board.css">

<link rel="stylesheet"
href="resources/bootstrap-3.3.7-dist/css/bootstrap.min.css">

<link rel="stylesheet"
href="resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css">


<script src="resources/js/parsley.min.js"></script>
<script src="resources/js/jquery-3.1.1.js"></script>
<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">
	/* Some custom styles to beautify this example */
	.demo-content{
		background: #ff0000;
	}
	.demo-content.bg-alt{
		background: #ff0000;
	}
</style>	

</content>
</head>

<body>

	<form class="form-horizontal" action="boardUpdate" method="get" role="form" data-parsley-validate="true">
				<span class="text-success text-center"><h1>Travel Board Detail</h1></span>
			     <p class="text-success text-center">이것은 연습을 하기위한 페이지 입니다.</p>
			
				<br>
				<div class="container">
			
				    				    
				    <div class="form-group">
				      <label class="col-sm-2 control-label">제   목</label>
				      <div class="col-sm-8" style="text-align:center">
				        <input class="form-control" style="text-align:center" id="b_email" type="text" name="b_email"  value="${tboard.t_title}" >
				      </div>
				    </div>
				    
				    <div class="form-group">
				      <label class="col-sm-2 control-label">제 목</label>
				      <div class="col-sm-8" style="text-align:center">
				      <input class="form-control" style="text-align:center" id="b_email" type="text" name="b_email"  value="${tboard.t_title}" >
				        
				      </div>
				    </div>
				    
				    <div class="form-group">
				      <label class="col-sm-2 control-label">내  용</label>
				      <div class="col-sm-8" style="text-align:center">
				        ${tboard.t_content}
				      </div>
				    </div>
	
	
           <c:if  test="${sessionmemberlevel == 'master' || sessionemail == board.b_email}">
  				    <div class="row col-sm-12 " style="text-align:center" >
					<div class="checkbox">
			     		<button  type="button" onclick="location.href='tBoardUpdateForm?b_seq=${tboard.t_seq}'"  class="btn btn-default">Update</button>
			   			<button type="button"  onclick="location.href='tBoardDeleteYN?b_seq=${tboard.t_seq}'"  class="btn btn-default">Delete</button>

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