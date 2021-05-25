package senairs.poo.aps.padaria.controlador;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import senairs.poo.aps.padaria.DAO.UsuarioDAO;
import senairs.poo.aps.padaria.modelo.Usuario;
import senairs.poo.aps.padaria.modelo.Endereco;
import senairs.poo.aps.padaria.modelo.Telefone;



/**
 * Servlet implementation class usuarioControlador
 */
@WebServlet("/usuarioControlador")
public class usuarioControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public usuarioControlador() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario usu = new Usuario();
		String acao = request.getParameter("acao");
		String acesso = (String) request.getSession().getAttribute("usu_acesso");
//		String acesso = request.getParameter("usuacesso");
		UsuarioDAO usuDao = new UsuarioDAO();
		
		
		if(acao != null && acao.equals("lis")) {
			
			if(acesso.equals("administrador")) {
				List<Usuario> lista = usuDao.buscarTodos(usu);			
				request.setAttribute("lista", lista);				
				RequestDispatcher saida = request.getRequestDispatcher("listadeUsuarios.jsp");
				saida.forward(request, response);
			}else {
				List<Usuario> lista = usuDao.buscarTodos(usu);			
				request.setAttribute("lista", lista);
				RequestDispatcher saida = request.getRequestDispatcher("listadeUsuarios.jsp");
				saida.forward(request, response);	
			}
			System.out.println("Peguei o acesso "+acesso);
//		}
//		if(acao != null && acao.equals("lis")) {
//			if(acesso.equals("Administrador")) {
//				List<Usuario> lista = usuDao.buscarTodos(usu);			
//				request.setAttribute("lista", lista);				
//				RequestDispatcher saida = request.getRequestDispatcher("listadeUsuariosAdm.jsp");
//				saida.forward(request, response);
//			}else {
//				List<Usuario> lista = usuDao.buscarTodos(usu);			
//				request.setAttribute("lista", lista);
//				RequestDispatcher saida = request.getRequestDispatcher("listadeUsuarios.jsp");
//				saida.forward(request, response);	
//			}
//			System.out.println("Peguei o acesso "+acesso);
		}
		else if(acao != null && acao.equals("ex")) {
			String id = request.getParameter("id");
			usu.setCod_usuario(Integer.parseInt(id));
			usuDao.excluir(usu);			
			response.sendRedirect("usuarioControlador?acao=cad");
		}
		else if(acao != null && acao.equals("alt")) {
			String id_usu = request.getParameter("id");
			Usuario usuario = usuDao.buscarporID(Integer.parseInt(id_usu));
			request.setAttribute("usuario", usuario);
			request.getRequestDispatcher("editarUsuario.jsp").forward(request, response);			
		}
		else if(acao != null && acao.equals("cad")) {
//			RequestDispatcher saida = request.getRequestDispatcher("cadastroUsuario.jsp");
//			saida.forward(request, response);
			List<Usuario> lista = usuDao.buscarTodos(usu);			
			request.setAttribute("lista", lista);				
			RequestDispatcher saida = request.getRequestDispatcher("cadastroUsuario.jsp");
			saida.forward(request, response);
		}	
		
}

/**
 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	String cod_usuario = request.getParameter("cod_usuario");
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
		usu.setCod_usuario(Integer.parseInt(cod_usuario));
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
		usuDao.editar(usu);
						
			response.sendRedirect("usuarioControlador?acao=cad");
		
		}



}
