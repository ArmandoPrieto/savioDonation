<!DOCTYPE html>
<html>
	<head>
		
		<meta charset="UTF-8">
	<title>St. Dominic Savio Donation</title>

		
		<g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
	<!-- Your META here -->
	<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0" name="viewport">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="${resource(dir: 'j-folder/css', file: 'demo.css')}">
	<link rel="stylesheet" href="${resource(dir: 'j-folder/css', file: 'font-awesome.min.css')}">
	<link rel="stylesheet" href="${resource(dir: 'j-folder/css', file: 'j-forms.css')}">

	<!-- Scripts -->
	<script src="${resource(dir: 'j-folder/js', file: 'jquery.1.11.1.min.js')}"></script>
	<script src="${resource(dir: 'j-folder/js', file: 'jquery.maskedinput.min.js')}"></script>

	<!--[if lt IE 10]>
			<script src="j-folder/js/jquery.placeholder.min.js"></script>
		<![endif]-->
		
		
	</head>
	<body class="bg-pic">
	<div class="wrapper wrapper-640">

		<div class="j-forms">
		<div class="header">
				<i class=""></i>
				<p>Error</p>
			</div>
			<!-- end /.header-->
			<div class="content">
			<h1>An error has occurred</h1>
			<g:link controller="donation" action="index"><button class="primary-btn">Try again</button></g:link>
			</div>
			
			<g:if env="development">
			<g:renderException exception="${exception}" />
		</g:if>
		<g:else>
			<ul class="errors">
				<li>An error has occurred</li>
			</ul>
		</g:else>
			
			</div>
	</div>
	<script>
		$(document).ready(function(){
			

		});
	</script>
		
	</body>
</html>
