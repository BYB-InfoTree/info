<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<content tag ="local_script">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
   
<script src="resources/js/jquery-3.1.1.js"></script>
<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
	    $('#example').DataTable();
	    
		$('#allchk').click(function(){
			if($(this).is(':checked')){
				$("input[name=unitchk]").prop("checked", true);
			}else{
				$("input[name=unitchk]").prop("checked", false);
			}
		});
		
		$('#example_filter').append("<button id='selectdel' type='button' style='margin-left: 350px;'>선택삭제</button>");
		
		$('#selectdel').click(function(){
			var checked = $("input[name=unitchk]:checked").length;
			var saveids = new Array();
			if(checked == 0){
				alert("삭제할 항목을 선택해주세요!");
				return;
			} else {
				var returnValue = confirm("삭제하시겠습까?");
				
				if(returnValue) {
				$('#unitchk:checked').each(function(index){
					saveids[index] = $(this).val();
				});
				
				var url ="memberSelectDelete?saveids="+saveids;
				$(location).attr('href',url);
				
				} else {
					return;
				}
				
			}
		});
		
	});
</script>
</content>
</head>

<body style="margin-top: 20px">
<div class="container">
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>No</th>
                <th>E-mail</th>
                <th>Password</th>
                <th>이름</th>
                <th>닉네임</th>
                <th>전화번호</th>
                <th>회원등급</th>
                <th>포인트</th>
                <th>가입일자</th>
                <th style="text-align:center !important;"><input type="checkbox" id="allchk" name="allchk"></th>
            </tr>
        </thead>
        
        <tbody>
        	<c:forEach var="member" items="${member}" >
	            <tr>
	                <td>${member.seq}</td>
	                <td><a href="memberListUpdateForm?email=${member.email}">${member.email}</a></td>
	                <td>${member.password}</td>
	                <td>${member.name}</td>
	                <td>${member.nickname}</td>
	                <td>${member.phone}</td>
	                <td>${member.memberlevel}</td>
	                <td>${member.point}</td>
	                <td>${member.joindate}</td>
	                <td style="text-align: center !important;"><input type="checkbox" name="unitchk" id="unitchk" value="${member.seq}"></td>
	            </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
</body>
</html>