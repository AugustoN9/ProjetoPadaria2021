	<% 
	HttpSession sessao = request.getSession(false);
	if(sessao != null) {
		sessao.invalidate();
	}
	response.sendRedirect("index.jsp");
	
	%>