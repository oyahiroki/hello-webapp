<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html><!-- html5 -->
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hello</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="favicon-180px.png" sizes="180x180">
<link rel="icon" type="image/png" href="favicon-192px.png" sizes="192x192">
<!-- jQuery 3.5.1 -->
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<!-- bootstrap 5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style type="text/css">
</style>

<script type="text/javascript" class="init">
	$(document).ready(function() {
		console.log("hi");
		$("#btn_submittext").click(function(event) {
			event.preventDefault();
			console.log($("#txtinput").val());
			$("#out").html("... Loading ...");
			var data = new Object();
			data.param1 = $("#txtinput").val();
			postText(data, processData);
		});
	});
</script>

<script>
	function processData(data) {
		console.log(data);
		$("#out").html("param1="+data.param1+",date="+data.date);
	}
	function postText(d, callbackOnSuccess, metadata) {
		$.ajax({
			type : "POST",
			contentType : 'application/x-www-form-urlencoded',
			url : "./helloservlet3",
			data : d,
			dataType : "json",
			processData : true,
			async : true,
			success : function(x) {
				if (callbackOnSuccess) {
					callbackOnSuccess(x);
				}
			} // ,
		}).done(function(data) {
			console.log("done");
		}).fail(function(data) {
			console.log("failed");
		}).always(function(data) {
			console.log("response");
		});
	}
</script>

</head>
<body>

	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="index.jsp">Index</a></li>
			<li class="breadcrumb-item active" aria-current="page">here</li>
		</ol>
	</nav>

	<h1 class="bg-primary text-white">Hello NLP4J</h1>

	<div class="container">
		<div class="row">
			<div class="col-8">

				<div class="form-group">
					<form id="frm_input" enctype="multipart/form-data">
						<label for="txtinput">Input</label>
						<input class="form-control form-control-lg" type="text" id="txtinput" ></input>
						<div>&nbsp;</div>
						<div class="text-center">
							<button id="btn_submittext" type="submit" class="btn btn-primary">Send</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-8">

				<div class="form-group">
					<label for="out1">Response</label>
					<div id="out"></div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
