<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
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
   href="resources/font-awesome-4.6.3/css/font-awesome.min.css">

   <script src="resources/js/jquery-3.1.1.js"></script>
   <script src="resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
   <script src="resources/js/parsley.min.js"></script>
   
   <script type="text/javascript">
   		function doReset(){
   				document.insert_form.id.value="";
   		
   			}
   
   	$(document).ready(function(){
   		
   		
   		$('#photo').change(function(event){
   			var tmppath=URL.createObjectURL(event.target.files[0]);
   			alert($(this).val());
   			$('#image').attr('src',tmppath);
   		});
   		
   		
   	});
   </script>
   </content>
</head>
<body class="div-bgcolor-gray" onload="doReset();">

<form id="insert_form" name="insert_form" class="form-horizontal" action="memberUpdateForm" method="POST" role="form" data-parsley-validate>
   <div class="contatiner">
     <span class="text-success text-center"><h1>Update Page</h1></span>
     <p class="text-success text-center">이것은 연습을 하기위한 페이지 입니다.</p>
     <br><br>
      <div class="row">
         <div class="col-md-4"><span></span></div>
         <div class="col-md-3">
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
               <input id="id" name="id" class="form-control" text="text"   value="${member.getId()}"  readonly="readonly"   placeholder="ID"
               data-parsley-required="true" data-parsley-error-message="please insert your ID" data-parsley-errors-container="div[id='validateId']" />
               <span class="input-group-btn">
                  <button   id="confirm" type="button" class="btn btn-default" >Confirm</button>
                  <input type="hidden" id="confirm_chk"   value="no" />
               </span>
            </div>
            <div id="validateId" style="color:#ff0000"></div>
            <br>
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
               <input name="password" class="form-control" type="password" id="password" size="16" 
               data-parsley-required="true" data-parsley-error-message="please insert your PASSWORD"  value="${member.getPassword()}" data-parsley-errors-container="div[id='validatePassword']" />
            </div>
            <div id="validatePassword" style="color:#ff0000"></div>
            <br>
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
               <input name="repassword" class="form-control" type="password" id="repassword" size="16" 
               data-parsley-required="true" data-parsley-error-message="please check Password and RePASSWORD" data-parsley-errors-container="div[id='validateRePassword']" 
               data-parsley-equalto="#password"/>
            </div>
            <div id="validateRePassword" style="color:#ff0000"></div>
            <br>
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-male" aria-hidden="true"></i></span>
               <input  name="name"  class="form-control" text="text" value="${member.getName()}"  size="20" placeholder="NAME"
               data-parsley-required="true" data-parsley-error-message="please insert your NAME" data-parsley-errors-container="div[id='validateName']" />
            </div>
            <div id="validateName" style="color:#ff0000"></div>
            <br>
         </div>
         <div class="col-md-1">
            <img id="image" src="${member.getPhoto()}" class="img-thumbnail"  value="${member.getPhoto()}" width="120px" height="120px">
            <br>
         <div align="right"> >
         <input type="file" value="${member.getPhoto()}" id="photo" name="photo">
  
            </div>
         </div>
         <div class="col-md-4"></div>
      </div>
      <br>
      <div class="row">
         <div class="col-md-4"><span></span></div>
         <div class="col-md-4">
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-phone" aria-hidden="true"  ></i></span>
                <span class="input-group-addon">
               <select id="phone1" name="phone1" class="selectpicker"  value="${member.getPhone1()}" >
  							<option value="010" <c:if test="${member.phone1=='010'}">selected</c:if>  >010</option>
  							<option value="011" <c:if test="${member.phone1=='011'}">selected</c:if>  >011</option>
  							<option value="016" <c:if test="${member.phone1=='016'}">selected</c:if>  >016</option>
  							<option value="017" <c:if test="${member.phone1=='017'}">selected</c:if>  >017</option>
  							<option value="018" <c:if test="${member.phone1=='018'}">selected</c:if>  >018</option>
  							<option value="019" <c:if test="${member.phone1=='019'}">selected</c:if>  >019</option>
  							
				</select>
               </span>
               <span class="input-group-addon">-</span>
               <input id="phone2" name="phone2" class="form-control" text="text" value="${member.getPhone2()}" size="4" placeholder="Phone" />
               <span class="input-group-addon">-</span>
               <input id="phone3" name="phone3" class="form-control" text="text" value="${member.getPhone3()}" size="4" placeholder="Number" />
            </div>
            <br>
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-location-arrow" aria-hidden="true"></i></span>
               <input id="zipcode" name="zipcode" class="form-control" text="text" value="${member.getZipcode()}" size="6" placeholder="ZIPCODE" />
               <span class="input-group-btn">
                  <button class="btn btn-default">Searching</button>
               </span>
            </div>
            <br>
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-home" aria-hidden="true"></i></span>
               <input name="addr1" class="form-control" text="text" size="50" placeholder="ADDRESS" />
            </div>
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-home" aria-hidden="true"></i></span>
               <input name="addr2" class="form-control" text="text" size="30" placeholder="DETAIL ADDRESS" />
            </div>
            <br>
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i></span>
               <input id="email" name="email" class="form-control" text="text" size="30" placeholder="E-MAIL" />
               <span class="input-group-addon"><label>@</label></span>
               <input name="email_domain"class="form-control" text="text" size="30" placeholder="example.com" />
            </div>
            <br>
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-credit-card" aria-hidden="true"></i></span>
               <input name="cardno" class="form-control" text="text" size="30" placeholder="Card No." />
            </div>
            <br>
            <div class="input-group">
               <span class="input-group-addon"><i class="fa fa-briefcase" aria-hidden="true"></i></span>
               <input name="job" class="form-control" text="text" size="30" placeholder="JOB" />
            </div>
            <br>
            <div align="center">
               <button id="update" type="submit" class="btn btn-default">Update</button>
               <span>&nbsp;&nbsp;</span>
               <span>&nbsp;&nbsp;</span>
               <button name="cancel"  type="button"  onclick="location.href='list'" class="btn btn-default">Cancel</button>
                <span>&nbsp;&nbsp;</span>
               <span>&nbsp;&nbsp;</span>
               <button name="delete" type="button"   onclick="location.href='memberDeleteYN?id=${member.id}'"  class="btn btn-default">Delete</button>
            </div>
            <div align="right">
               <kbd name="inputdate">2016.10.07</kbd> 
            </div>
         </div>
         <div class="col-md-4"></div>
      </div>
      
   </div>
</form>
</body>
</html>