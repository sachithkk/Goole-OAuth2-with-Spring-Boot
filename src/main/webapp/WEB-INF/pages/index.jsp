<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/form" var="formUrl"/>

<title>SSD ASSIGNMENT 2</title>
	
<link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
<link href="<c:url value='/resources/css/custom.css'/>" rel="stylesheet" type="text/css">

<div class="container">
  <div class="header container">
	<h1 class="h1">SSD Assignment Up loader</h1>
  </div>
  
  <div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
      <div class="card card-signin my-5">
        <div class="card-body">
          <h5 class="card-title text-center">Sign In</h5>
          <form class="form-signin">
          
            <a class="btn btn-lg btn-google btn-block text-uppercase" href="/login"><i class="fab fa-google mr-2"></i> Sign in with Google</a>
          
          </form>
        </div>
      </div>
    </div>
  </div>
    
</div>

<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>