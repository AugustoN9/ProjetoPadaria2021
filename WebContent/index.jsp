<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link href="css/estilo.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >
<title>Padaria Pão Artesanal</title>
</head>
<body>	

<div id="menutopo">
	<jsp:include page="menuTopoIndex.jsp"></jsp:include>
</div>
	<jsp:include page="menuCliente.jsp"></jsp:include>

<div id="logo">
	<p class="font2">Padaria</p>
	<div class="font1">
		<p>Pão Artesanal</p>
	</div>	
	<p class="font3">desde 2020 preparando seu café</p>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
</body>
</html>