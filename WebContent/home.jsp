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

			<%				
				Object usu_acesso = request.getSession().getAttribute("usu_acesso");
				Object usu_log = request.getSession().getAttribute("usu_log");
				
				if(usu_log != null ){
		//			out.println("Seja Bem Vindo "+ usu_acesso +" "+ usu_log);
					String msg = "Seja Bem Vindo "+ usu_acesso +" "+ usu_log;
					request.setAttribute("msg", msg);
				}
				else{
					//out.println("Esta é uma página restrita, acesse logando no sistema.");
					response.sendRedirect("index.jsp");
				}				
			%>
			
				

<div id="menutopo">
	<jsp:include page="menuTopo.jsp"></jsp:include>
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