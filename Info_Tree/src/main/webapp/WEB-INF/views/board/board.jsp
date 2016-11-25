
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>   
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<content tag="local_script"> 
 <link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap.min.css">
 <link rel="stylesheet"  href="resources/js/jquery.dataTables.min.css">
 <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
 <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<title>Insert title here</title>
<script>
	$(document).ready(function() {
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
     			var url="memberSelectDelete?saveids="+saveids;
					$(location).attr('href',url);
			   }else{
				   return;
			   }
		   }
		   });
	 });
			
</script>
</content>
</head>

<body>
<div class="container">
	<table  id="example" class="display" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	    	        <th>사진</th>
	                <th>기사내용</th>
	                <th>기사내용</th>
	                
	                <th style="text-align: center !important;" > <input type="checkbox" id="allchk">
	            </tr>
	        </thead>
	       
	        <tbody>
	        		<c:forEach var="member" items="${members}">
	            <tr>
		            <td>${member.seq}</td>
	                <td><a href="memberUpdate?email=${member.email}">${member.email}</a></td>
	                <td>${member.password}</td>
	              
	                <td style="text-align: center !important;"> <input type="checkbox" id="unitchk"  name="unitchk" value="${member.email}"></td>
	            </tr>
	           </c:forEach>
	        </tbody>
	    </table>
	</div>
</body>
</html>