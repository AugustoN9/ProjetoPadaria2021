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
<title>Padaria Cadastro Cliente</title>
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
<jsp:include page="menuAdm.jsp"></jsp:include>

<div id="conteudo">

	<div class="container col-lg-12">
	<form id="cadastroPao" action="salvacadastroPao.jsp" method="post" >
	
	<div class="form-group text-center">		
		<h3 class="fontp"><strong>Cadastro de Pães</strong></h3>
	</div>
	
		<label>Nome do Usuario </label>
		<input class="form-control" type="text" name="nome" placeholder="Informe o Nome do Usuario">
		
		<div class="row">
		<div class="col-sm-3">
		<div class="form-group">
		<label>CPF</label>
		<input class="form-control" type="text" name="cpf" placeholder="Informe o cpf">	
		</div>
		</div>
		<div class="col-sm-3">
		<div class="form-group">			
		<label>Tipo</label><br>
			<select class="form-control" name="tipo" id="tipo" >
				<option value=""></option>
				<option value="farinha integral">farinha integral</option>
				<option value="farinha de centeio">farinha de centeio</option>
				<option value="farinha de trigo">farinha de trigo</option>
				<option value="farinha de milho">farinha de milho</option>
				<option value="farinha de aveia">farinha de aveia</option>
				<option value="farinha de chia">farinha de chia</option>
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
		<input class="form-control" type="text" name="peso" placeholder="Informe o peso em gramas">	
		</div>
		</div>					
		</div>
		
		<div class="row">
		<div class="col-sm-3">
		<div class="form-group">			
		<label>Preço</label><br>
		<input class="form-control" type="text" name="preco" placeholder="Informe o preço">	
		</div>
		</div>					
		<div class="col-sm-3">
		<div class="form-group">			
		<label>Imagem</label><br>
		<input class="form-control" type="text" name="imagem" placeholder="Nome do arquivo">	
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

<div id="conteudo">
	<div class="container col-lg-12 font4"> 
		<h2>Lista de Produtos</h2>
		
		<%		
			List<Pao> listaPadaria = (List<Pao>)request.getAttribute("lista");
		%>
		
	<div id="lista">
		<table>
		 <thead>
			<tr bgcolor="#161616">
				<th width="80px">IMAGEM</th>
				<th width="80px">CODIGO</th>
				<th width="180px">PRODUTO</th>
				<th width="180px">TIPO</th>
				<th width="80px">CATEGORIA</th>
				<th width="80px">PESO Unidade</th>
				<th width="100px">PREÇO/Kg</th>
				<th width="100px">VALIDADE</th>
				<th width="50px"></th>
				<th width="50px"></th>
			</tr>
		</thead>
		
		<%	
			for(Pao p: listaPadaria) {
		%>
		
		<tbody>			
			<tr bgcolor="7e7e7e" >
				<th><img src="img/produtos/pao/<%=p.getImagem() %>" width="120" height="80"></th>
				<th>Pad-<%=p.getCodProduto() %></th>
				<th><%=p.getNome() %></th>
				<th><%=p.getTipo_farinha() %></th>
				<th><%=p.getCategoria() %></th>				
				<th><%=p.getPeso() %>g</th>				
				<th>R$<%=" "+p.getPreco() %></th>
				<th><%=p.getValidade() %></th>
 
				<th style="text-align: center;"><a href="paoAdmControlador?acao=alt&id=<%=p.getCodProduto() %>"><img src="img/icones/editar.png" height="18" width="20"></a></th>
				<th style="text-align: center;"><a href="javascript:confirmaExcluir(<%=p.getCodProduto() %>)"><img src="img/icones/delete.png" height="18" width="20"></a></th>

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
			if(window.confirm("Tem certeza que deseja excluir este produto ?")){
				location.href="paoAdmControlador?acao=ex&id="+ id;
			}			
		}	
	</script>

</body>
</html>