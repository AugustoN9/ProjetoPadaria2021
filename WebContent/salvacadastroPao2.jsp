<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="senairs.poo.aps.padaria.modelo.Pao" %>
<%@page import="senairs.poo.aps.padaria.DAO.PaoDAO" %>
	
<%
	
	String nomeprod = request.getParameter("nome");
	String validade = request.getParameter("validade");
	String tipo = request.getParameter("tipo");	
	String categoria = request.getParameter("categoria");
	String peso = request.getParameter("peso");
	String preco = request.getParameter("preco");
	
	Pao padaria = new Pao();
	
	padaria.setNome(nomeprod);
	padaria.setValidade(validade);
	padaria.setTipo_farinha(tipo);
	padaria.setCategoria(categoria);
	padaria.setPeso(peso);
	padaria.setPreco(preco);
		
	PaoDAO padariaDao = new PaoDAO();
	padariaDao.cadastro(padaria);
	
%>

<% response.sendRedirect("cadastroPao.jsp"); %>	

