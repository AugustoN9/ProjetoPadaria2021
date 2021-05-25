package senairs.poo.aps.padaria.controlador;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProdutoDAO;
import modelo.Produto;
import senairs.poo.aps.padaria.DAO.PaoDAO;
import senairs.poo.aps.padaria.modelo.Pao;


@WebServlet("/cucaControlador")
public class cucaControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public cucaControlador() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Pao pao = new Pao();
		String acao = request.getParameter("acao");
//		String acesso = (String) request.getSession().getAttribute("usu_acesso");
		PaoDAO paoDao = new PaoDAO();
		
		if(acao != null && acao.equals("lis")) {
//			if(acesso.equals("administrador")) {
				List<Pao> lista = paoDao.buscarTodasCuca(pao);			
				request.setAttribute("lista", lista);
				int registros = 0;
				try {
					registros = paoDao.quantoscucaRegistrados();
				} catch (SQLException e) {					
					e.printStackTrace();
				}
				request.setAttribute("registros", registros);
				RequestDispatcher saida = request.getRequestDispatcher("listarprodutoCuca.jsp");
				saida.forward(request, response);	
//			}else {
//				List<Produto> lista = prodDao.buscarTodos(prod);			
//				request.setAttribute("lista", lista);
//				RequestDispatcher saida = request.getRequestDispatcher("listadeProdutos.jsp");
//				saida.forward(request, response);
			}
		}
//		else if(acao != null && acao.equals("ex")) {
//			String id = request.getParameter("id");
//			prod.setId(Integer.parseInt(id));
//			prodDao.excluir(prod);			
//			response.sendRedirect("produtoControlador?acao=lis");
//		}
//		else if(acao != null && acao.equals("alt")) {
//			String id = request.getParameter("id");
//			Produto produto = prodDao.buscarporID(Integer.parseInt(id));
//			request.setAttribute("produto", produto);
//			request.getRequestDispatcher("editarProduto.jsp").forward(request, response);			
//		}
//		else if(acao != null && acao.equals("cad")) {
//			RequestDispatcher saida = request.getRequestDispatcher("cadastrodeProduto.jsp");
//			saida.forward(request, response);
//		}
//		else if(acao != null && acao.equals("det")) {
//			String id = request.getParameter("id");
//			Produto produto = prodDao.buscarporID(Integer.parseInt(id));
//			request.setAttribute("produto", produto);
//			request.getRequestDispatcher("detalhesdoProduto.jsp").forward(request, response);
//		}
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
