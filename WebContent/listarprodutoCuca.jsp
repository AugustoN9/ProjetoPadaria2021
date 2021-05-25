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
	
	<title>Listar Produto Cuca</title>
</head>	
<body>

		<%				
				Object usu_acesso = request.getSession().getAttribute("usu_acesso");
				Object usu_log = request.getSession().getAttribute("usu_log");
				
				if(usu_log != null){
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

		<%		
			List<Pao> listaPadaria = (List<Pao>)request.getAttribute("lista");
			Object registros = (Object)request.getAttribute("registros");
		%>

	<div id="conteudo">
	
		<div class="container col-lg-12 font4"> 
		  <div class="row">
		    <div class="col-sm"><h3>Lista de Produtos Cliente</h3></div>
		    <div class="col-sm font_info"><h3><%=registros +" "%>Cucas Registradas</h3></div>	
		  </div>
		</div>
	
	<div class="container col-lg-12 font4"> 
				
	<div id="lista">
		<table>
		 <thead>
			<tr bgcolor="#161616">
				<th width="80px">IMAGEM</th>
				<th width="80px">CODIGO</th>
				<th width="250px">PRODUTO</th>
				<th width="100px">TIPO</th>
				<th width="50px">CATEGORIA</th>
				<th width="150px">PESO / Unidade</th>
				<th width="150px">PREÇO / Kg</th>
				<th width="50px">VALIDADE</th>
				<th width="50px">ADICIONAR</th>
			</tr>
		</thead>
		<%	
			for(Pao p: listaPadaria) {
		%>
		<tbody>			
			<tr bgcolor="7e7e7e" >
				<th><img src="img/produtos/cuca/<%=p.getImagem() %>" width="120" height="80"></th>
				<th>Pad-<%=p.getCodProduto() %></th>
				<th><%=p.getNome() %></th>
				<th><%=p.getTipo_farinha() %></th>
				<th><%=p.getCategoria() %></th>				
				<th><%=p.getPeso() %>g</th>				
				<th>R$<%=" "+p.getPreco() %></th>
				<th><%=p.getValidade() %></th>
 
				<th style="text-align: center;" ><a href="cucaAdmControlador?acao=det&id=<%=p.getCodProduto() %>" ><img src="img/icones/cestacompras.png" height="36" width="36"></a></th>

			</tr> 
		</tbody>
		<%
			}
		%>
		</table>
	</div>
	</div>
	</div>
	
</body>
</html>