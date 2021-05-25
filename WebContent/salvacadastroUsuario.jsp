<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="senairs.poo.aps.padaria.modelo.Usuario" %>
<%@page import="senairs.poo.aps.padaria.modelo.Endereco" %>
<%@page import="senairs.poo.aps.padaria.modelo.Telefone" %>
<%@page import="senairs.poo.aps.padaria.DAO.UsuarioDAO" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link href="css/estilo.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	
	<title>Salvar Usuario</title>
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
	
	
	String nome = request.getParameter("nomeuser");
	String cpf = request.getParameter("cpf");
	String nasc = request.getParameter("nasc");
	String email = request.getParameter("email");	
	String username = request.getParameter("username");
	String senha = request.getParameter("senha");
	String acesso = request.getParameter("acesso");
	String logradouro = request.getParameter("logradouro");
	String no_logra = request.getParameter("nome_logradouro");
	String nu_logra = request.getParameter("numero_logradouro");
	String compl = request.getParameter("complemento");
	String estado = request.getParameter("estado");
	String fone_tipo = request.getParameter("fone_tipo");
	String ddd = request.getParameter("ddd");
	String fone_num = request.getParameter("fone_num");
	
	if(nu_logra.equals("")){
		nu_logra = "0";
	}
	
	if(ddd.equals("")){
		ddd = "051";
	}
	
	if(fone_num.equals("")){
		fone_num = "11111111";
	}
	
	Endereco end = new Endereco();
	end.setLogradouro(logradouro);
	end.setNome(no_logra);
	end.setNumero(Integer.parseInt(nu_logra));
	end.setComplemento(compl);
	end.setEstado(estado);
	
	Telefone fone = new Telefone();
	fone.setTipo(fone_tipo);
	fone.setDdd(Integer.parseInt(ddd));
	fone.setNumero(Integer.parseInt(fone_num));
	
	Usuario usu = new Usuario();
	usu.setNome(nome);
	usu.setCpf(cpf);
	usu.setData_nascimento(nasc);
	usu.setEmail(email);
	usu.setUsername(username);
	usu.setSenha(senha);
	usu.setAcesso(acesso);
	usu.setEndereco(end);
	usu.setCelular(fone);
		
	UsuarioDAO usuDao = new UsuarioDAO();
	usuDao.cadastro(usu);
	
	
%>

<div id="conteudo" class="container col-lg-8"> 
	<h4>SALVO USUARIO COM SUCESSO!</h4>
	<br><br><br><br><br><br>
</div>
	
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
</body>
</html>