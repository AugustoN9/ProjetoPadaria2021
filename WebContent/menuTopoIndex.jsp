<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

		<%	
			Object quantprodCarrinho = request.getAttribute("contador");			
		%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

  <a class="navbar-brand" href="indexAdm.jsp">Padaria Artesanal</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      
      <li class="nav-item">
        <a class="nav-link" href="#">Ofertas do dia</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link disabled" href="carrinhoControlador?acao=car" tabindex="-1" aria-disabled="true">Carrinho<i class="fas fa-cart-plus">(<label style="color: orange"> </label>)</i></a>
      </li>
     </ul>
       
    <ul class="navbar-nav" >
	     <li class="">
	        <a class="nav-link " href="login.jsp" id="" role="" >
	          Iniciar Sessão
	        </a>
	      </li>
    </ul>
  </div>

</nav>
