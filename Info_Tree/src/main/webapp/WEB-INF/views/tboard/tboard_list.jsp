
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
		
		   $('#example').DataTable();
	
	 });
			
</script>
</content>
</head>

<body>
<div class="container">
	<table  id="example" class="display" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	    	        <th>T_SEQ</th>
	                <th>T_EMAIL</th>
	                <th>T_TITLE</th>
	                <th>T_DATE</th>
	                <th>T_LEVEL</th>
	                <th>T_HIT</th>
	                <th>T_ATTACH</th>
	            </tr>
	        </thead>
	       
	        <tbody>
	        		<c:forEach var="tboard" items="${tboards}">
	            <tr>
		            
	                <td><a href="tBoardDetail?t_seq=${tboard.t_seq}">${tboard.t_seq}</a></td>
	                <td><a href="tBoardDetail?t_seq=${tboard.t_seq}">${tboard.t_title}</td>
	                <td>${tboard.t_email}</td>
	                <td>${tboard.t_date}</td>
	                <td>${tboard.t_level}</td>
	                <td>${tboard.t_hit}</td>
	                <td>${tboard.t_attach}</td>

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