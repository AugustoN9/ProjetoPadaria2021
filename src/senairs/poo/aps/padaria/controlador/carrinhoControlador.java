package senairs.poo.aps.padaria.controlador;

import java.io.IOException;
import java.util.ArrayList;
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
import senairs.poo.aps.padaria.modelo.Carrinho;
import senairs.poo.aps.padaria.modelo.Item;
import senairs.poo.aps.padaria.modelo.Pao;


@WebServlet("/carrinhoControlador")
public class carrinhoControlador extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	Pao pao = new Pao();
	PaoDAO paoDao = new PaoDAO();
	List<Pao> produtos = new ArrayList<Pao>();
	List<Carrinho> listacarrinho = new ArrayList<Carrinho>(); 
	int item;
	double totalpagar = 0.0;
	int quantidade = 1;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String acao = request.getParameter("acao");
    	
    	if(acao != null && acao.equals("adicionar")) {
    	    		int id = Integer.parseInt(request.getParameter("id"));
    	    		pao = paoDao.buscarPaoporID(id);
    	    		item = item + 1;
    	    		Carrinho car = new Carrinho();
    	    		car.setItem(item);
    	    		car.setIdProduto(pao.getCodProduto());
    	    		car.setNome(pao.getNome());
    	    		car.setPrecocompra(pao.getPreco());
    	    		car.setQuantidade(quantidade);
    	    		car.setSubtotal(quantidade*pao.getPreco());
    	    		listacarrinho.add(car);
    	    		String quant = "10";
    	    		request.setAttribute("controlador", pao);
//    	    		request.setAttribute("controlador", listacarrinho.size());
    	    		request.getRequestDispatcher("home.jsp").forward(request, response);
    	    
    	}
    	
    }
		

}
