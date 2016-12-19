<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String ctx = request.getContextPath();    //콘텍스트명 얻어오기.%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<content tag="local_script">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<title>Travel Detail</title>
<link rel="stylesheet"   href="resources/js/jquery.dataTables.min.css">
<script src="resources/js/parsley.min.js"></script>
<script src="resources/js/jquery.dataTables.min.js"></script>
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
		$(document).ready(function() {
			$('#insertref').click(function(){
				$('#insertRef').submit();
			return;
		  	});		
		});		
		function del(){
			    var result = confirm("삭제하시겠습니까?");
					    if(result){
					    		alert('확인을 누르면 삭제됩니다.');			    		
								$('#tBoardDelete').submit();
					    }else{
					    	return;
					    } 
				  
		}
		
		$(document).ready(function() {
			$('#example').DataTable();
			return;
	
		 });

	</script>

</content>  
</head>
 
<body>
<form id="tBoardDelete" name="tBoardDelete" class="form-horizontal" action="tBoardDelete" method="post" role="form" >
   <input class="form-control" style="text-align:center" id="t_seq" type="hidden" name="t_seq"  value="${tboard.t_seq}" >
</form>

<form class="form-horizontal" role="form" id="editorForm" name="editorForm" method="post" action="tboardInsert" enctype="multipart/form-data">
   
   <div class="container" style="margin-top: 50px;">
      <div class="row">
         <div class="input-group col-md-3">
               <span class="input-group-addon" style="width: 50px; background-color: #D9E5FF;" >작 성 자</span>
               <input id="t_nickname" name="t_nickname" type="text" class="form-control" text="text" value="${tboard.t_nickname}" readonly="readonly"/>
            </div>
      <input class="form-control" style="text-align:center" id="t_seq" type="hidden" name="t_seq"  value="${tboard.t_seq}" >
         <div class="input-group col-md-6" style="margin-top: 15px;">
               <span class="input-group-addon" style="width: 50px; background-color: #D9E5FF;">제  목</span>
               <input id="t_title" name="t_title" type="text" class="form-control" text="text" value="${tboard.t_title}" readonly="readonly"/>
            </div>
      </div>
     </div>
    
   <div class="container" style="margin-top: 30px;">
      <div class="row" style="text-align: right;">
         <c:if test="${sessionmemberlevel == 'master' || sessionemail == tboard.t_email}">
         <a href="tBoardUpdateForm?t_seq=${tboard.t_seq}">수정</a> &nbsp;&nbsp;&nbsp;
         <a onclick="del()" >삭제</a></c:if> &nbsp;&nbsp;&nbsp;
         <a href="tBoardListForm">목록</a> &nbsp;&nbsp;&nbsp;작성일자 : ${tboard.t_date}
      </div>
      <div class="row" style="border-style: solid; border-color: #BDBDBD; border-width: 2px;">
         <div style="margin-top: 10px; margin-left: 10px; margin-right: 10px; margin-bottom: 10px; ">${tboard.t_content}</div>
      </div>   
    </div>
    
    <div class="container">
	<table  id="example" class="display" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	    	        <th>NUMBER</th>
	                <th>TITLE</th>
	                <th>EMAIL</th>
	                <th>DATE</th>
	                <th>TREF</th>

	            </tr>
	        </thead>
	       
	        <tbody>
	        		<c:forEach var="tboardref" items="${tboardref}">
	            <tr>
		            
	                <td><a href="tBoardDetail?t_seq=${tboardref.t_seq}">${tboardref.t_seq}</a></td>
	                <td><a href="tBoardDetail?t_seq=${tboardref.t_comment}">${tboardref.t_comment}</a></td>
	                <td>${tboardref.t_email}</td>
	                <td>${tboardref.t_date}</td>
	                <td>${tboardref.t_ref}</td>

	            </tr>
	           </c:forEach>
	        </tbody>
	    </table>
	</div>
</form>     
    
    
<form id="insertRef"  class="form-horizontal" action="insertRef" method="post" role="form" >
     <input class="form-control" style="text-align:center" id="t_seq" type="hidden" name="t_seq"  value="${tboard.t_seq}" >
     
    <div class="container" style="margin-top: 30px; border-style: solid; border-color: #BDBDBD; border-width: 2px;">
      <div class="row" style="text-align: right; padding: 5px;">
            <div class="col-md-12" style="border-bottom-style: solid; border-color: #BDBDBD; text-align: left;">
                  댓글수(${tboard.t_ref})         
            </div>
      
            <div class="col-md-12" style="background-color: #BDBDBD; padding: 5px; margin-top: 50px;">
               <div class="col-md-10">
                <textarea class="form-control" rows="5" id="t_comment" name="t_comment" style=" resize: none;"></textarea>
             </div>
			<div class="col-md-2">
 				<button  id="insertref" type="button"  class="btn btn-info resultButton" style="height: 80px; width: 100px; font-size: 20px;">입력</button>
      		</div>
      </div>
    </div>
     
</form>

</body>
</html>