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
<title>Padaria Cadastro Cliente </title>
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
	<jsp:include page="menuTopoAdm.jsp"></jsp:include>
</div>


<div id="conteudoCadUser">

	<div class="container col-lg-12">
	<form id="cadastroPao" action="salvacadastroUsuario.jsp" method="post" >
	
	<div class="form-group text-center">		
		<h3 class="fontp"><strong>Cadastro de Usuario</strong></h3>
	</div>
		<h5>Dados de Pessoais</h5>
		<label>Nome </label>
		<input class="form-control" type="text" name="nomeuser" placeholder="Informe o Nome do Usuario">
		
		<div class="row">
		<div class="col-sm-3">
		<div class="form-group">
		<label>CPF</label>
		<input class="form-control" type="text" name="cpf" placeholder="Informe o cpf">	
		</div>
		</div>
		<div class="col-sm-3">
		<div class="form-group">			
		<label>Data de Nascimento</label>
		<input class="form-control" type="date" name="nasci" placeholder="Informe a data do nascimento">		
		</div>
		</div>
		<div class="col-sm-3">
		<div class="form-group">			
		<label>Email</label>
		<input class="form-control" type="text" name="email" placeholder="Informe email para contato">		
		</div>
		</div>		
		</div>
		
		<h5>Dados de Acesso</h5>
		<div class="row">
		<div class="col-sm-3">
		<div class="form-group">			
		<label>Username</label>
		<input class="form-control" type="text" name="username" placeholder="Defina um username">	
		</div>
		</div>
		<div class="col-sm-3">
		<div class="form-group">			
		<label>Senha</label>
		<input class="form-control" type="password" name="senha" placeholder="Defina uma senha">	
		</div>
		</div>	
		<div class="col-sm-3">
		<div class="form-group">			
		<label>Acesso</label>
			<select class="form-control" name="acesso" id="logradouro" >
				<option value="cliente">Cliente</option>
				<option value="administrador">Administrador</option>
				<option value="colaborador">Colaborador</option>
				<option value="tecnico">Tecnico</option>
			</select>	
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
		<input class="form-control" type="text" name="nome_logradouro" placeholder="Nome do logradouro">	
		</div>
		</div>	
		<div class="col-sm-1">
		<div class="form-group">			
		<label>Número</label><br>
		<input class="form-control" type="text"  value="" name="numero_logradouro" placeholder="0">	
		</div>
		</div>
		<div class="col-sm-3">
		<div class="form-group">			
		<label>Complemento</label><br>
		<input class="form-control" type="text" name="complemento" placeholder="Informe o complemento">	
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
		<input class="btn btn-danger btn-block" type="submit" name="acao" value="Cadastrar">
		</div>
		</div>
		</div>
		
	</form>
	</div>
</div>

<div id="conteudoCadUser">
	<div class="container col-lg-12 font4"> 
		<h2>Lista de Usuarios</h2>
		
		<%		
			List<Usuario> listaUsuario = (List<Usuario>)request.getAttribute("lista");
		%>
		
	<div id="lista">
		<table>
		 <thead>
			<tr bgcolor="#161616">
				<th width="85px">CODIGO</th>
				<th width="400px">NOME</th>
				<th width="200px">CPF</th>
				<th width="85px">IDADE</th>
				<th width="300px">EMAIL</th>
				<th width="200px">USER</th>
				<th width="100px">ACESSO</th>
			
				<th width="50px"></th>
				<th width="50px"></th>
			</tr>
		</thead>
		
		<%	
			for(Usuario u: listaUsuario) {
		%>
		
		<tbody>			
			<tr bgcolor="7e7e7e" >
				<th>Cod-<%=u.getCod_usuario() %></th>
				<th><%=u.getNome() %></th>
				<th><%=u.getCpf() %></th>
				<th><%=u.getData_nascimento() %></th>				
				<th><%=u.getEmail() %>g</th>				
				<th><%=u.getUsername() %></th>
				<th><%=u.getAcesso() %></th>
				
 
				<th style="text-align: center;"><a href="usuarioControlador?acao=alt&id=<%=u.getCod_usuario() %>"><img src="img/icones/editar.png" height="18" width="20"></a></th>
				<th style="text-align: center;"><a href="javascript:confirmaExcluir(<%=u.getCod_usuario() %>)"><img src="img/icones/delete.png" height="18" width="20"></a></th>

			</tr> 
		</tbody>
		
		<%
			}
		%>
		
		</table>
	</div>
	</div>
	</div>
	
	<script>
		function confirmaExcluir(id){
			if(window.confirm("Tem certeza que deseja excluir este Usuario ?")){
				location.href="usuarioControlador?acao=ex&id="+ id;
			}			
		}	
	</script>


</body>
</html>