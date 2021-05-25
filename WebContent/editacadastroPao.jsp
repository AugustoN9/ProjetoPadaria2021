<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="senairs.poo.aps.padaria.modelo.Pao" %>
<%@page import="senairs.poo.aps.padaria.DAO.PaoDAO" %>
<%@ page import="java.util.List" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link href="css/estilo.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>Padaria Pão Artesanal</title>
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

<div id="menutopo">
	<jsp:include page="menuTopo.jsp"></jsp:include>
</div>
<jsp:include page="menuAdm.jsp"></jsp:include>

		<%	
			Pao p = (Pao)request.getAttribute("paoatual");			
		%>

<div id="conteudo">

	<div class="container col-lg-12">
	<form id="cadastroPao" action="paoAdmControlador" method="post" >
	
	<div class="form-group text-center">		
		<h3 class="fontp"><strong>Editar Produto</strong></h3>
	</div>
		<div class="row">
		<div class="col-sm-3">
		<div class="form-group">
		<label>Codigo do Produto </label>
		<input class="form-control" type="text" name="codProduto" value="<%=p.getCodProduto() %>">
		</div>
		</div>
		<div class="col-sm-3">
		<div class="form-group">
		<label>Nome do Produto </label>
		<input class="form-control" type="text" name="nome" value="<%=p.getNome() %>">
		</div>
		</div>
		</div>
		
		<div class="row">
		<div class="col-sm-3">
		<div class="form-group">
		<label>Validade</label>
		<input class="form-control" type="date" name="validade" value="<%=p.getValidade() %>">	
		</div>
		</div>
		<div class="col-sm-3">
		<div class="form-group">			
		<label>Tipo</label><br>
			<select class="form-control" name="tipo" id="tipo" >
				<option value="<%=p.getTipo_farinha() %>"><%=p.getTipo_farinha() %></option>
				<option value="farinha integral">farinha integral</option>
				<option value="farinha de centeio">farinha de centeio</option>
				<option value="farinha de trigo">farinha de trigo</option>
				<option value="farinha de milho">farinha de milho</option>
				<option value="farinha de aveia">farinha de aveia</option>
				<option value="farinha de chia">farinha de chia</option>
				<option value="tipo especial">tipo especial</option>
			</select>	
		</div>
		</div>	
		<div class="col-sm-3">
		<div class="form-group">			
		<label>Categoria</label><br>
			<select class="form-control" name="categoria" id="categoria" >
				<option value="pao">Pães</option>
			</select>	
		</div>
		</div>
		<div class="col-sm-3">
		<div class="form-group">			
		<label>Peso em gramas</label><br>
		<input class="form-control" type="text" name="peso" value="<%=p.getPeso() %>">	
		</div>
		</div>					
		</div>
		
		<div class="row">
		<div class="col-sm-3">
		<div class="form-group">			
		<label>Preço</label><br>
		<input class="form-control" type="text" name="preco" value="<%=p.getPreco() %>">	
		</div>
		</div>					
		<div class="col-sm-3">
		<div class="form-group">			
		<label>Imagem</label><br>
		<input class="form-control" type="text" name="imagem" value="<%=p.getImagem() %>">	
		</div>
		</div>	
		</div>				
		
		<div class="row">		
		<div class="col-sm-6">
		<div class="form-group">		
		<input class="btn btn-danger btn-block" type="submit" name="acao" value="Atualizar">
		</div>
		</div>
		</div>
		
	</form>
	</div>
</div>


</body>
</html>