<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Crunchify - Spring MVC Upload Multiple Files Example</title>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>

</head>
<body>
	<br>
	<br>
	<div align="center">
		<h1>Upload Multiple Files</h1>

		<form:form method="post" action="savefiles.html"
			modelAttribute="uploadForm" enctype="multipart/form-data">

			<p>Select files to upload. Press Add button to add more file
				inputs.</p>

			<table id="fileTable">
				<tr>
					<td><input name="files[0]" type="file" /></td>
				</tr>
				<tr>
					<td><input name="files[1]" type="file" /></td>
				</tr>
			</table>
			<br />
			<input type="submit" value="Upload" />
			<input id="addFile" type="button" value="Add File" />
		</form:form>

		<br />
	</div>
</body>

<script>
    $(document).ready(function() {
   		//add more file components if Add is clicked
   		$('#addFile').click(function() {
   			var fileIndex = $('#fileTable tr').children().length - 1;
   			$('#fileTable').append('<tr><td>'+'   <input type="file" name="files['+ fileIndex +']" />' + '</td></tr>');
   		});
    });
</script>

<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
</html>