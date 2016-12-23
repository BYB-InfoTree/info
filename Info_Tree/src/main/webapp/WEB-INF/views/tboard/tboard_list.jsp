
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<content tag="local_script"> 
 <link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet"   href="resources/js/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">

<script src="resources/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<title>Travel Board</title>
<script>
	$(document).ready(function() {
		if("${sessionmemberlevel}"=='master'){
			$('#allchk').click(function(){
	           if($(this).is(':checked')){
		            $("input[name=unitchk]").prop("checked", true);
		         }else{
		            $("input[name=unitchk]").prop("checked", false);
		         }
		      });
			   $('#example').DataTable();
				   $('#example_filter').append("<button id='selectdel' type='button'  style='margin-left: 350px;'>선택삭제</button>"); 
			   $('#selectdel').click(function(){
				   var checked =$("input[name=unitchk]:checked").length;
				   var saveids=new Array();
				   if(checked==0){
					   alert("삭제할 항목을 체크 하세요!");
					   return;
				   }else{
					   var returnValue=confirm("삭제 하시겠습니까?");
				   if(returnValue){
					   $('#unitchk:checked').each(function(index){
						   saveids[index]=$(this).val();
			   });   
	     			var url="tBoardSelectDelete?saveids="+saveids;
						$(location).attr('href',url);
				   }else{
					   return;
				   }
			   }
			   });
		}else{
			$('#example').DataTable();
		}
	 });
			
</script>
</content>
</head>

<body>
<div class="container">
	<table  id="example" class="display" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	    	        <th>글번호</th>
	                <th>글제목</th>
	                <th>작성자</th>
	                <th>작성일자</th>
	                <th>조회순</th>
	   
	         <c:if test="${sessionmemberlevel == 'master'}"> 
	                <th style="text-align: center !important;" > <input type="checkbox" id="allchk">
	         </c:if>   
	            </tr>
	        </thead>
	       
	        <tbody>
	        		<c:forEach var="tboard" items="${tboards}">
	            <tr>
		            
	                <td><a href="tBoardDetail?t_seq=${tboard.t_seq}">${tboard.t_seq}</a></td>
	                <td><a href="tBoardDetail?t_seq=${tboard.t_seq}">${tboard.t_title}</a></td>
	                <td>${tboard.t_nickname}</td>
	                <td>${tboard.t_date}</td>
	                <td>${tboard.t_hit}</td>
	      
   	         <c:if test="${sessionmemberlevel == 'master'}">
	                <td style="text-align: center !important;"> <input type="checkbox" id="unitchk"  name="unitchk" value="${tboard.t_seq}"></td>
	         </c:if>

	            </tr>
	           </c:forEach>
	        </tbody>
	    </table>
	    <br>
	   <c:if test="${!(sessionemail == null)}">
	    <span class="col-md-offset-8 col-md-2">
					<button  type="button" onclick="location.href='tBoardInsertForm'" class="btn btn-info resultButton"><i class="fa fa-pencil" aria-hidden="true"></i> 글쓰기</button>
		</span>
	  	</c:if>
	</div>
</body>
</html>