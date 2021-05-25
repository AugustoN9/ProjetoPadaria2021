<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="senairs.poo.aps.padaria.modelo.Pao" %>
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


		<%				
				Object usu_acesso = request.getSession().getAttribute("usu_acesso");
				Object usu_log = request.getSession().getAttribute("usu_log");
				
				if(usu_log != null && usu_acesso.equals("administrador")){
					String msg = "Seja Bem Vindo "+ usu_acesso +" "+ usu_log;
					request.setAttribute("msg", msg);
				}else
				if(usu_log != null && usu_acesso.equals("cliente")){
					response.sendRedirect("home.jsp");
				
				}else{
					//out.println("Esta é uma página restrita, acesse logando no sistema.");
					response.sendRedirect("index.jsp");
				}				
			%>
			
<jsp:include page="menuTopoAdm.jsp"></jsp:include>
<jsp:include page="menuAdm.jsp"></jsp:include>

<%
	
	String nomeprod = request.getParameter("nome");
	String validade = request.getParameter("validade");
	String tipo = request.getParameter("tipo");	
	String categoria = request.getParameter("categoria");
	String peso = request.getParameter("peso");
	String preco = request.getParameter("preco");
	String imagem = request.getParameter("imagem");
	
	if(preco.equals("")){
		preco = "0.00";
	}
	
	Pao padaria = new Pao();
	
	padaria.setNome(nomeprod);
	padaria.setValidade(validade);
	padaria.setTipo_farinha(tipo);
	padaria.setCategoria(categoria);
	padaria.setPeso(peso);
	padaria.setPreco(Double.parseDouble(preco));
	padaria.setImagem(imagem);
		
	PaoDAO padariaDao = new PaoDAO();
	padariaDao.cadastro(padaria);
	
%>

<div id="conteudo" class="container col-lg-8"> 
	<h4>SALVO PRODUTO COM SUCESSO!</h4>
	<br><br><br><br><br><br>
</div>
	
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
</body>
</html>