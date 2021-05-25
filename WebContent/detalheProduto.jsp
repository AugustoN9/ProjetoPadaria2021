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
	
	<title> Detalhe do Produto </title>
</head>	
<body>

	<%				
				Object usu_acesso = request.getSession().getAttribute("usu_acesso");
				Object usu_log = request.getSession().getAttribute("usu_log");
				
				if(usu_log != null){
		//			out.println("Seja Bem Vindo "+ usu_acesso +" "+ usu_log);
					String msg = "Seja Bem Vindo "+ usu_acesso +" "+ usu_log;
					request.setAttribute("msg", msg);
					request.setAttribute("usu_log", usu_log);
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

	<div id="conteudo2">
	<div class="container col-lg-12 font4"> 
		<h2>Detalhe do Produto Selecionado</h2>	
		
		<%	
			Pao detalhe = (Pao)request.getAttribute("detalhe");			
		%>
	<form id="carrinho" action="salvarItem.jsp" method="post" >
	<div id="listadetalhe" class="">
		
		<table>
		 <thead>
			<tr bgcolor="#161616">
				<th width="150px">IMAGEM</th>
				<th width="100px">CODIGO</th>
				<th width="200px">PRODUTO</th>
				<th width="150px">PESO / Unidade</th>
				<th width="150px">PREÇO / Kg</th>
				<th width="50px">GRAMA(S)/UNIDADE(S)</th>
				<th width="100px">CONFIRMAR</th>
				<th width="100px">DEIXAR</th>
			</tr>
		</thead>
		<tbody>			
			<tr bgcolor="7e7e7e" >
				<th class="campodetalhe4"><img src="img/produtos/pao/<%=detalhe.getImagem() %>" width="150" height="80"></th>
				<th class="campodetalhe1"><input type="text" name="id" value="<%=detalhe.getCodProduto()%>" readonly></th>
				<th><input type="text" name="nome" value="<%=detalhe.getNome() %>" readonly></th>		
				<th class="campodetalhe3"><input type="text" name="peso" value="<%=detalhe.getPeso() %>" readonly>g</th>				
				<th class="campodetalhe3">R$<input type="text" name="preco" value="<%=" "+detalhe.getPreco() %>" readonly></th>
 				<th class="campodetalhe2"><input type="number" value="0" min="0" name="quantidade" /></th>
				<th style="text-align: center;"><a href="carrinhoControlador?acao=adicionar&id=<%=detalhe.getCodProduto() %>"><img src="img/icones/cestacompras.png" height="36" width="36"></a> </th>
				<th style="text-align: center;"><a href="paoControlador?acao=lis"><img src="img/icones/delete.png" height="24" width="24"></a></th>
			</tr> 
		</tbody>
				
		</table>
		<input type="submit" value="enviar" >
	</div>
	</form>
	
	</div>
	</div>
	
</body>
</html>