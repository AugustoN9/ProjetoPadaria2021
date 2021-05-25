<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="senairs.poo.aps.padaria.modelo.Pao" %>
<%@page import="senairs.poo.aps.padaria.modelo.Itempao" %>
<%@page import="senairs.poo.aps.padaria.DAO.PaoDAO" %>



<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link href="css/estilo.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	
	<title>Salvar Produto</title>
</head>	
<body>

<jsp:include page="menuAdm.jsp"></jsp:include>
	
<%
	
	
	String codprod = request.getParameter("id");
	String nomeprod = request.getParameter("nome");
	String peso = request.getParameter("peso");
	String preco = request.getParameter("preco");		
	String imagem = request.getParameter("imagem");
	String quantidade = request.getParameter("quantidade");
	Object usuario = request.getSession().getAttribute("usu_log");
	
	
	Pao padaria = new Pao();
	
	padaria.setCodProduto(Integer.parseInt(codprod));
	padaria.setNome(nomeprod);
	padaria.setPeso(peso);
	padaria.setPreco(Double.parseDouble(preco));
	padaria.setImagem(imagem);
	
	Itempao item = new Itempao();
	
	item.setPao(padaria);
	item.setQuantidade(Integer.parseInt(quantidade));
	
	
	out.println(item.getPao().getNome()+"pedido feito pelo usuario "+usuario);
		
	
	
	
%>

<div id="conteudo" class="container col-lg-8"> 
	<h4>SALVO PRODUTO COM SUCESSO!</h4>
	<br><br><br><br><br><br>
</div>
	
	
</body>
</html>