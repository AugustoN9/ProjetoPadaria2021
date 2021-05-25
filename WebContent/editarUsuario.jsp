<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="senairs.poo.aps.padaria.modelo.Usuario" %>
<%@page import="senairs.poo.aps.padaria.DAO.UsuarioDAO" %>
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


		<%	
			Usuario u = (Usuario)request.getAttribute("usuario");			
		%>

<div id="conteudoCadUser">

	<div class="container col-lg-12">
	<form id="" action="usuarioControlador" method="post" >
	
	<div class="form-group text-center">		
		<h3 class="fontp"><strong>Atualizar Cadastro</strong></h3>
	</div>
		<h5>Dados de Pessoais</h5>
		<div class="row">
		<div class="col-sm-1">
		<div class="form-group">
		<label>Cod </label>
		<input class="form-control" type="text" name="cod_usuario" value="<%=u.getCod_usuario() %>">
		</div>
		</div>
		<div class="col-sm-6">
		<div class="form-group">
		<label>Nome </label>
		<input class="form-control" type="text" name="nomeuser" value="<%=u.getNome() %>">
		</div>
		</div>
		</div>
		
		<div class="row">
		<div class="col-sm-3">
		<div class="form-group">
		<label>CPF</label>
		<input class="form-control" type="text" name="cpf" value="<%=u.getCpf() %>">	
		</div>
		</div>
		<div class="col-sm-3">
		<div class="form-group">			
		<label>Data de Nascimento</label>
		<input class="form-control" type="date" name="nasci" value="<%=u.getData_nascimento() %>">		
		</div>
		</div>
		<div class="col-sm-3">
		<div class="form-group">			
		<label>Email</label>
		<input class="form-control" type="text" name="email" value="<%=u.getEmail() %>">		
		</div>
		</div>		
		</div>
		
		<h5>Dados de Acesso</h5>
		<div class="row">
		<div class="col-sm-3">
		<div class="form-group">			
		<label>Username</label>
		<input class="form-control" type="text" name="username" value="<%=u.getUsername() %>">	
		</div>
		</div>
			
		<div class="col-sm-3">
		<div class="form-group">			
		<label>Acesso</label>
			<select class="form-control" name="acesso" id="logradouro" >
				<option value="<%=u.getAcesso() %>"><%=u.getAcesso() %></option>
				<option value="cliente">Cliente</option>
				<option value="administrador">Administrador</option>
				<option value="colaborador">Colaborador</option>
				<option value="tecnico">Tecnico</option>
			</select>	
		</div>
		</div>	
		
		<div class="col-sm-3">
		<div class="form-group">			
		<label>Senha</label>
		<input class="form-control" type="text" name="senha" value="<%=u.getSenha() %>">	
		</div>
		</div>
						
		</div>
		
		<h5>Dados de Endereço</h5>
		<div class="row">
		<div class="col-sm-2">
		<div class="form-group">			
		<label>Logradouro</label><br>
			<select class="form-control" name="logradouro" id="logradouro" >
				<option value=""></option>
				<option value="Avenida">Avenida</option>
				<option value="Rua">Rua</option>
				<option value="Travessa">Travessa</option>
				<option value="Beco">Beco</option>
				<option value="Bloco">Bloco</option>
			</select>		
		</div>
		</div>					
		<div class="col-sm-5">
		<div class="form-group">			
		<label>Nome do logradouro</label><br>
		<input class="form-control" type="text" name="nome_logradouro" >	
		</div>
		</div>	
		<div class="col-sm-1">
		<div class="form-group">			
		<label>Número</label><br>
		<input class="form-control" type="text"  value="" name="numero_logradouro" >	
		</div>
		</div>
		<div class="col-sm-3">
		<div class="form-group">			
		<label>Complemento</label><br>
		<input class="form-control" type="text" name="complemento" >	
		</div>
		</div>
		<div class="col-sm-1">
		<div class="form-group">			
		<label>ESTADO</label><br>
			<select class="form-control" name="estado" id="estado" >
				<option value=""></option>
				<option value="RS">RS</option>
				<option value="SC">SC</option>
				<option value="PR">PR</option>
				<option value="SP">SP</option>
				<option value="RJ">RJ</option>
			</select>	
		</div>
		</div>
		</div>	
		
		<div class="row">
		<div class="col-sm-2">
		<div class="form-group">			
		<label>Tipo</label><br>
			<select class="form-control" name="fone_tipo" id="fone_tipo" >
				<option value="Fixo">Fixo</option>
				<option value="Celular">Celular</option>				
			</select>		
		</div>
		</div>	
		<div class="col-sm-1">
		<div class="form-group">			
		<label>DDD</label><br>
		<input class="form-control" type="text" name="ddd" placeholder="">		
		</div>
		</div>
		<div class="col-sm-4">
		<div class="form-group">			
		<label>Número</label><br>
		<input class="form-control" type="text" name="fone_num" placeholder="">		
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