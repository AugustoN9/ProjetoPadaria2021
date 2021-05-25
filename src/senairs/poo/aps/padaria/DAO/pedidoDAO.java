package senairs.poo.aps.padaria.DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import senairs.poo.aps.padaria.config.Conexao;
import senairs.poo.aps.padaria.modelo.Pedido;


public class pedidoDAO {
	
	private Connection con = Conexao.getConnection();

	public void cadastro(Pedido pedido) {
		
		String sql ="INSERT INTO public.pedidos ( produto_id, usuario_id, quantidade, preco_unidade_peso ) VALUES ( ?, ?, ?, ?)";

		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			
			preparador.setInt(1, pedido.getProduto().getCodProduto());
			preparador.setInt(2, pedido.getUsuario().getCod_usuario());
			preparador.setInt(3, pedido.getQuantidade());
			preparador.setDouble(4, pedido.getPreco_unid_peso());
						
			preparador.execute();
			preparador.close();
			
			System.out.println("Cadastrado um pedido com sucesso!");
		}catch(SQLException e) {
			System.out.println("Erro SQL CADASTRO - "+e.getMessage());
		}
	}

	public void editar(Pedido pedido) {
		
		String sql =" UPDATE public.pedidos SET produto_id = ?, usuario_id = ?, quantidade = ?, preco_unidade_peso = ? WHERE id = ?" ;
		
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			
			preparador.setInt(1, pedido.getProduto().getCodProduto());
			preparador.setInt(2, pedido.getUsuario().getCod_usuario());
			preparador.setInt(3, pedido.getQuantidade());
			preparador.setDouble(4, pedido.getPreco_unid_peso());
			preparador.setInt(5, pedido.getCod_pedido());
			
			preparador.execute();
			preparador.close();
			
			System.out.println("Alterado pedido com sucesso!");
		}catch(SQLException e) {
			System.out.println("Erro EDITAR PedidoDAO - "+e.getMessage());
		}
	}
	
	public void excluir(Pedido pedido) {
		String sql ="DELETE FROM public.pedidos WHERE id = ?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, pedido.getCod_pedido());
			
			preparador.execute();
			preparador.close();
			
			System.out.println("Excluido pedido com sucesso!");
		}catch(SQLException e) {
			System.out.println("Erro - "+e.getMessage());
		}
	}
	
	public List<Pedido> buscarTodos(Pedido pedido){
		
		String sql = "SELECT * FROM public.pedidos WHERE categoria='pao' ORDER BY cod_prod ASC";
		List<Pao> lista = new ArrayList<Pao>();
		
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			ResultSet resultados = preparador.executeQuery();
			while(resultados.next()) {
				
				Pao pao1 = new Pao();
			
				pao1.setCodProduto(resultados.getInt("cod_prod"));
				pao1.setNome(resultados.getString("nomeprod"));
				pao1.setValidade(resultados.getString("validade"));
				pao1.setTipo_farinha(resultados.getString("tipo"));
				pao1.setPeso(resultados.getString("peso"));
				pao1.setCategoria(resultados.getString("categoria"));
				pao1.setPreco(resultados.getDouble("precokg"));
				pao1.setImagem(resultados.getString("imagem"));
				
				lista.add(pao1);

			}
			
		}catch(SQLException e) {
			System.out.println("Erro SQL PaoDao- "+e.getMessage());
		}
		return lista;
	}
	
	public List<Pao> buscarTodasCuca(Pao pao){
		String sql = "SELECT * FROM public.produtos WHERE categoria='cuca' ORDER BY cod_prod ASC";
		List<Pao> lista = new ArrayList<Pao>();
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			ResultSet resultados = preparador.executeQuery();
			while(resultados.next()) {
				
				Pao pao1 = new Pao();
			
				pao1.setCodProduto(resultados.getInt("cod_prod"));
				pao1.setNome(resultados.getString("nomeprod"));
				pao1.setValidade(resultados.getString("validade"));
				pao1.setTipo_farinha(resultados.getString("tipo"));
				pao1.setPeso(resultados.getString("peso"));
				pao1.setCategoria(resultados.getString("categoria"));
				pao1.setPreco(resultados.getDouble("precokg"));
				pao1.setImagem(resultados.getString("imagem"));
				
				lista.add(pao1);

			}
			
		}catch(SQLException e) {
			System.out.println("Erro - "+e.getMessage());
		}
		return lista;
	}
	
	public List<Pao> buscarTodosBolos(Pao pao){
		String sql = "SELECT * FROM public.produtos WHERE categoria='bolo' ORDER BY cod_prod ASC";
		List<Pao> lista = new ArrayList<Pao>();
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			ResultSet resultados = preparador.executeQuery();
			while(resultados.next()) {
				
				Pao pao1 = new Pao();
			
				pao1.setCodProduto(resultados.getInt("cod_prod"));
				pao1.setNome(resultados.getString("nomeprod"));
				pao1.setValidade(resultados.getString("validade"));
				pao1.setTipo_farinha(resultados.getString("tipo"));
				pao1.setPeso(resultados.getString("peso"));
				pao1.setCategoria(resultados.getString("categoria"));
				pao1.setPreco(resultados.getDouble("precokg"));	
				pao1.setImagem(resultados.getString("imagem"));
				
				lista.add(pao1);

			}
			
		}catch(SQLException e) {
			System.out.println("Erro - "+e.getMessage());
		}
		return lista;
	}
	
	public List<Pao> listarprodutos() {
		
		String sql = "SELECT * FROM public.produtos ORDER BY cod_prod ASC";
		List<Pao> paes = new ArrayList<Pao>();
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			ResultSet resultados = preparador.executeQuery();
			
			while(resultados.next()) {
				
				Pao pao = new Pao();
				pao.setCodProduto(resultados.getInt("cod_prod"));
				pao.setNome(resultados.getString("nomeprod"));
				pao.setValidade(resultados.getString("validade"));
				pao.setTipo_farinha(resultados.getString("tipo"));
				pao.setPeso(resultados.getString("peso"));
				pao.setCategoria(resultados.getString("categoria"));
				pao.setPreco(resultados.getDouble("precokg"));
				pao.setImagem(resultados.getString("imagem"));
				
				paes.add(pao);
			}
			
		} catch (Exception e) {
			
		}
		return paes;
		
	}
	
	public Pao buscarPaoporID(Integer codProduto){
		Pao paoRetorno = null;
		String sql = "SELECT * FROM public.produtos WHERE cod_prod = ?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, codProduto);
			//retorno da consulta em Resultset
			ResultSet resultado = preparador.executeQuery();
			//se tem registro
			if(resultado.next()) {
			
				paoRetorno = new Pao();
				
				paoRetorno.setCodProduto(resultado.getInt("cod_prod"));
				paoRetorno.setNome(resultado.getString("nomeprod"));
				paoRetorno.setValidade(resultado.getString("validade"));
				paoRetorno.setTipo_farinha(resultado.getString("tipo"));
				paoRetorno.setCategoria(resultado.getString("categoria"));
				paoRetorno.setPreco(resultado.getDouble("precokg"));
				paoRetorno.setPeso(resultado.getString("peso"));
				paoRetorno.setImagem(resultado.getString("imagem"));
				
			}
			System.out.println("Encontrado produto com sucesso!");			
		}catch(SQLException e) {
			System.out.println("Erro de SQL - "+e.getMessage());
		}
		return paoRetorno;
	}

	public int quantospaoRegistrados() throws SQLException {
			
			Statement preparador = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); 
			ResultSet resultado = preparador.executeQuery("SELECT COUNT(*) FROM public.produtos WHERE categoria='pao' ");
			
			resultado.next();
			int registros = resultado.getInt(1);
			
		    return registros;
	}
	
	public int quantoscucaRegistrados() throws SQLException {
		
		Statement preparador = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); 
		ResultSet resultado = preparador.executeQuery("SELECT COUNT(*) FROM public.produtos WHERE categoria='cuca' ");
		
		resultado.next();
		int registros = resultado.getInt(1);
		
	    return registros;
	}
	
	public int quantosboloRegistrados() throws SQLException {
		
		Statement preparador = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); 
		ResultSet resultado = preparador.executeQuery("SELECT COUNT(*) FROM public.produtos WHERE categoria='bolo' ");
		
		resultado.next();
		int registros = resultado.getInt(1);
		
	    return registros;
	}

	
	
}
