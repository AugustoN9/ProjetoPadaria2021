package senairs.poo.aps.padaria.controlador;

import java.io.IOException;
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


@WebServlet("/cucaAdmControlador")
public class cucaAdmControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public cucaAdmControlador() {
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
				RequestDispatcher saida = request.getRequestDispatcher("cadastroCuca.jsp");
				saida.forward(request, response);	
//			}else {
//				List<Produto> lista = prodDao.buscarTodos(prod);			
//				request.setAttribute("lista", lista);
//				RequestDispatcher saida = request.getRequestDispatcher("listadeProdutos.jsp");
//				saida.forward(request, response);
//			}
		}
		else if(acao != null && acao.equals("ex")) {
			String id = request.getParameter("id");
			pao.setCodProduto(Integer.parseInt(id));
			paoDao.excluir(pao);			
			response.sendRedirect("cucaAdmControlador?acao=lis");
		}
		else if(acao != null && acao.equals("alt")) {
			String id = request.getParameter("id");
			Pao cucatual = paoDao.buscarPaoporID(Integer.parseInt(id));
			request.setAttribute("cucatual", cucatual);
			request.getRequestDispatcher("editacadastroCuca.jsp").forward(request, response);			
		}
		else if(acao != null && acao.equals("cad")) {
			RequestDispatcher saida = request.getRequestDispatcher("cadastroCuca.jsp");
			saida.forward(request, response);
		}
//		else if(acao != null && acao.equals("det")) {
//			String id = request.getParameter("id");
//			Produto produto = prodDao.buscarporID(Integer.parseInt(id));
//			request.setAttribute("produto", produto);
//			request.getRequestDispatcher("detalhesdoProduto.jsp").forward(request, response);
//		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("codProduto");
		String nomeprod = request.getParameter("nome");
		String validade = request.getParameter("validade");
		String tipo = request.getParameter("tipo");	
		String categoria = request.getParameter("categoria");
		String peso = request.getParameter("peso");
		String preco = request.getParameter("preco");
		String imagem = request.getParameter("imagem");

		Pao padaria = new Pao();
		
		padaria.setCodProduto(Integer.parseInt(id));
		padaria.setNome(nomeprod);
		padaria.setValidade(validade);
		padaria.setTipo_farinha(tipo);
		padaria.setCategoria(categoria);
		padaria.setPeso(peso);
		padaria.setPreco(Double.parseDouble(preco));
		padaria.setImagem(imagem);
				
		PaoDAO padariaDao = new PaoDAO();
		padariaDao.editar(padaria);
					
		response.sendRedirect("cucaAdmControlador?acao=lis");
	
	}

}
