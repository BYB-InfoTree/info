<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<content tag="local_script">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Member Page</title>
   <link rel="stylesheet"
   href="resources/bootstrap-3.3.7-dist/css/bootstrap.min.css">
   <link rel="stylesheet"
   href="resources/bootstrap-3.3.7-dist/css/bootstrap-thema.min.css">
   <link rel="stylesheet"
   href="resources/bootstrap-3.3.7-dist/css/itschool.css">
   <link rel="stylesheet"
   href="resources/bootstrap-3.3.7-dist/css/font-awesome.min.css">

   <script src="resources/js/jquery-3.1.1.js"></script>
   <script src="resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
   <script src="resources/js/parsley.min.js"></script>
   
</head>

<style>
	.resultPage{
		font-size:35px;
		text-align:center !important;
		margin-top:50px;
		}
	.resultMessage{
		font-size:25px;
		background-color:#e0e0d1;
		text-align:center !important;
		line-height:250px;
		margin-top:20px;
		padding:15px;
		}
	.resultButton{
		text-align:center !important;
		font-size:25px;
		margin-top:20px;
		}
</style>
</content>
<body class="div-bgcolor-gray">
	
<form action="boardList" method="GET">
   <div class="container">
      <div class="row" style="text-align: center;">
         <div class="col-md-offset-4 col-md-4 con-new resultPage" style="border-style: solid; border-color: black; background-color: #6799FF">Result Page</div>
         <div class="col-md-6"></div>
      </div>
      
      <div class="row">
            <div class="col-md-offset-4  col-md-4   resultMessage"  id="comment">
     <!--        <c:if test="${msg=='Success Insert your Info!'}">오케이</c:if>  --> 
            ${msg}</div>
      </div>
         
      <div class="row">
         <button type="submit" class="col-md-offset-4  col-md-4  btn btn-success resultButton">확인</button>
         <div class="col-md-6"></div>
      </div>
   </div>
   </form>
</body>
</html>