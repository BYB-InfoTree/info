<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<content tag ="local_script">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet"
	   href="resources/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	   <link rel="stylesheet"
	   href="resources/bootstrap-3.3.7-dist/css/bootstrap-thema.min.css">
	   <link rel="stylesheet"
	   href="resources/bootstrap-3.3.7-dist/css/member.css">
	   <link rel="stylesheet"
	   href="resources/bootstrap-3.3.7-dist/css/font-awesome.min.css">
	
	   <script src="resources/js/jquery-3.1.1.js"></script>
	   <script src="resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
	   <script src="resources/bootstrap-3.3.7-dist/js/parsley.min.js"></script>
	   </content>
</head>

<style>
	.resultPage {
		font-size: 35px;
		text-align: center !important;
		margin-top: 50px
	}
	.resultMessage {
		margin-top: 20px;
		font-size: 25px;
		background-color: #e0e0d1;
		text-align: center !important;
		line-height: 250px;
		padding: 15px;
	}
	.resultButton {
		text-align: center !important;
		margin-top: 10px;
	}
</style>


<body>
<form action="index" method="GET">
	<div class="container">
		<div class="row" style="text-align: center;">
			<div class="col-md-offset-4 col-md-4 con-new div-radius " style="border-style: solid; border-color: #FFC19E; padding: 5px; background-color: #FFF2E6;"><h3>Result</h3></div>
		</div>
		
		
		<div class="row">
			<div class="col-md-offset-4 col-md-4 div-radius" style="border-style: solid; border-color: #FFC19E; margin-top: 20px; text-align: center;">
				<br><br>
				<h3>${msg}</h3>
				<br><br>
			</div>
		</div>
			
		<div class="row" style="margin-top: 50px;">
			<button type="button" class="col-md-offset-5 col-md-2 resultButton div-radius btn btn-success" onclick="location.href='home'">확인</button>
		</div>
	</div>
</form>
</body>
</html>