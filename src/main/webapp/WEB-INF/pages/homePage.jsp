<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	
<link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/resources/css/custom.css'/>" rel="stylesheet" type="text/css">
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>

<div class="container">
	<br/>
	<div class="row">
		<div class="col-md-9">
			<h3>You are login as : <span id="user" style="color: white;"></span></h3>
			<h4>Your Email : <span id="email" style="color: white;"></span></h4>
	    </div>
		<div class="col-md-3">
			<button onClick="logout()" class="btn">Logout</button>
		</div>
	</div>
	
	<div>
		<h3>Upload file to Google Drive:</h3>
		<form method="POST" action="/upload" enctype="multipart/form-data">
	        <input class="btn" type="file" name="file" accept="image/*"  multiple="multiple">	
	        <button class="btn">Upload</button>
	    </form>
	</div>
	
	<div>
		<h3>Google Drive Files:</h3>
		<ul>
		<c:forEach var="fileName" items="${fileNames}">
			<div class="col-xs-6 col-md-3 thumbnail">
				${fileName}
			</div>
		</c:forEach>
		</ul>
	</div>

	
</div>

<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>

<script>
	$.get("/user", function(data){
		console.log(data);
		$("#user").html(data.userAuthentication.details.name);
		$("#email").html(data.userAuthentication.details.email);
	});
	var logout = function() {
		$.post("/logout",function(){
			window.location = "/";
		});
		return true;
	}
</script>


