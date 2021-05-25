package senairs.poo.aps.padaria.controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import senairs.poo.aps.padaria.DAO.UsuarioDAO;
import senairs.poo.aps.padaria.modelo.Usuario;



/**
 * Servlet implementation class loginControlador
 */
@WebServlet("/loginControlador")
public class loginControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginControlador() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sessao = request.getSession(false);
		if(sessao != null) {
			sessao.invalidate();
		}
		response.sendRedirect("index.jsp");


	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String username_log = request.getParameter("login_usuario");
		String senha_log = request.getParameter("login_senha");
		
		Usuario usu = new Usuario();
		usu.setUsername(username_log);
		usu.setSenha(senha_log);
		
		UsuarioDAO usuDao = new UsuarioDAO();
		String Status = usuDao.Logon(usu);	
		
		String cli ="cliente";
		String col = "colaborador";
		String adm ="administrador";	
		
		String acesso = usu.getAcesso();
		
		if(Status == "true") {	
				
			  if(usu.getAcesso().equals(cli)){
				  Object usulog = username_log;
				  Object usuacesso = acesso;
				  request.getSession().setAttribute("usu_log", usulog);
				  request.getSession().setAttribute("usu_acesso", usuacesso);

				  response.sendRedirect("home.jsp");
				  System.out.println( usu.getUsername() + " Logado com sucesso");
				  System.out.println("Usuario possui o nivel de acesso: " + usu.getAcesso());
                	            

			  }else if(usu.getAcesso().equals(col)){
				  Object usulog = username_log;
				  Object usuacesso = acesso;
				  request.getSession().setAttribute("usu_log", usulog);
				  request.getSession().setAttribute("usu_acesso", usuacesso);

				  response.sendRedirect("homeAtendimentos.jsp");
				  System.out.println( usu.getUsername() + " Logado com sucesso");
				  System.out.println("Usuario possui o nivel de acesso: " + usu.getAcesso());
                
//			  }else if(usu.getNivel_acesso().equals(adm)){
//				  String usulog = username_log;
//				  String usuacesso = acesso;
//				  request.setAttribute("usu_log", usulog);
//				  request.setAttribute("usu_acesso", usuacesso);
//				  request.getRequestDispatcher("homeGeral.jsp").forward(request, response);
//				  //response.sendRedirect("homeGeral.jsp");
//	              System.out.println( usu.getUsername() + " Logado com sucesso");
//	              System.out.println("Usuario possui o nivel de acesso: " + usu.getNivel_acesso());		              
//			  }
			 }else if(usu.getAcesso().equals(adm)){
				  Object usulog = username_log;
				  Object usuacesso = acesso;
				  request.getSession().setAttribute("usu_log", usulog);
				  request.getSession().setAttribute("usu_acesso", usuacesso);
				  //request.getRequestDispatcher("homeGeral.jsp").forward(request, response);
				  response.sendRedirect("indexAdm.jsp");
	              System.out.println( usu.getUsername() + " Logado com sucesso");
	              System.out.println("Usuario possui o nivel de acesso: " + usu.getAcesso());		              
			  }
			  
			  
			  System.out.println(acesso);
			  String usulog = ("Usuario "+usu.getUsername()+" possui o nivel de acesso: " + usu.getAcesso());
//			  request.setAttribute("usulog", usulog);
//              request.getRequestDispatcher("homeGeral.jsp").forward(request, response);
			  System.out.println(usulog);
			  
		} else {
        System.out.println("Erro de login");            
        response.sendRedirect("erroLogin.jsp");
		}
	}

}
