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
	
	<title>Listar Carrinho</title>
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
			Object quantprodCarrinho = request.getAttribute("contador");			
		%>
		
	<div id="lista">
		<table>
		 <thead>
			<tr bgcolor="#161616">
				<th width="80px">IMAGEM</th>
				<th width="80px">CODIGO</th>
				<th width="200px">PRODUTO</th>
				<th width="180px">TIPO</th>
				<th width="100px">PESO</th>
				<th width="100px">PREÇO/Kg</th>
				<th width="50px">GRAMA(S)/UNIDADE(S)</th>
				<th width="100px">CONFIRMAR</th>
				<th width="100px">DEIXAR</th>
			</tr>
		</thead>
		<tbody>			
			<tr bgcolor="7e7e7e" >
				<th><img src="img/produtos/pao/<%=paocarrinho.getImagem() %>" width="120" height="80"></th>
				<th>Pad-<%=paocarrinho.getCodProduto() %></th>
				<th><%=paocarrinho.getNome() %></th>
				<th><%=paocarrinho.getTipo_farinha() %></th>			
				<th><%=paocarrinho.getPeso() %></th>				
				<th>R$<%=" "+paocarrinho.getPreco() %></th>
 				<th><input class="form-control" type="number" value="0" min="0" name="quantidade" /></th>
				<th style="text-align: center;"><a href="paoAdmControlador?acao=adi&id=<%=paocarrinho.getCodProduto() %>"><img src="img/icones/cestacompras.png" height="36" width="36"></a></th>
				<th style="text-align: center;"><a href="paoControlador?acao=lis"><img src="img/icones/delete.png" height="24" width="24"></a></th>
			</tr> 
		</tbody>

		</table>
	</div>
	</div>
	</div>
	
</body>
</html>