<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="senairs.poo.aps.padaria.modelo.Pao" %>
<%@ page import="java.util.List" %>



<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link href="css/estilo.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	
	<title>Produtos Adicionado ao Carrinho</title>
</head>	
<body>

<div id="menutopo">
	<jsp:include page="menuTopo.jsp"></jsp:include>
</div>
<jsp:include page="menuCliente.jsp"></jsp:include>

	<div id="conteudo">
	<div class="container col-lg-12 font4"> 
		<h2>Detalhe do Produto Selecionado</h2>	
		
		<%	
			int quantItens = (int)request.getAttribute("qi");			
		%>
		
	<div id="lista">
		
		<h1>Quantidades de Itens Adicionados ao carrinho <i><%=quantItens %></i></h1>
		
	</div>
	</div>
	</div>
	
</body>
</html>