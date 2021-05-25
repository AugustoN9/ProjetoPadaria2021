package senairs.poo.aps.padaria.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import senairs.poo.aps.padaria.config.Conexao;
import senairs.poo.aps.padaria.modelo.Usuario;

public class EnderecoDAO {
	
	private Connection con = Conexao.getConnection();
	
	public void cadastro(Usuario usuario) {
		
		String sql ="INSERT INTO public.usuario (nome, cpf, endereco, email, username, senha, nivel_acesso, avatar) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, usuario.getNome());
			preparador.setString(2, usuario.getCpf());
			preparador.setString(3, usuario.getEndereco().getLogradouro()+usuario.getEndereco().getNome()+usuario.getEndereco().getNumero());
			preparador.setString(4, usuario.getEmail());
			preparador.setString(5, usuario.getUsername());
			preparador.setString(6, usuario.getSenha());
			preparador.setString(7, usuario.getAcesso());
			preparador.setString(8, usuario.getAvatar());
			
			preparador.execute();
			preparador.close();
			
			String msg = "Cadastrado de usuario com sucesso!";
			System.out.println(msg);
						
			
		}catch(SQLException e) {
			System.out.println("Erro - "+e.getMessage());
		}
	}
	
	public void editar(Usuario usuario) {
		String sql =" UPDATE public.usuario SET nome = ?, cpf= ?, endereco = ?, email = ?, username = ?, senha = ?, nivel_acesso = ?  WHERE id = ?" ;
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, usuario.getNome());
			preparador.setString(2, usuario.getCpf());
			preparador.setString(3, usuario.getEndereco());
			preparador.setString(4, usuario.getEmail());
			preparador.setString(5, usuario.getUsername());
			preparador.setString(6, usuario.getSenha());
			preparador.setString(7, usuario.getAcesso());
			preparador.setString(8, usuario.getAvatar());
			preparador.setInt(9, usuario.getCod_usuario());
			
			preparador.execute();
			preparador.close();
			
			System.out.println("Usuario alterado com sucesso!");
		}catch(SQLException e) {
			System.out.println("Erro EDITAR usuarioDAO - "+e.getMessage());
		}
	}
	
	public void excluir(Usuario usuario) {
		String sql ="DELETE FROM public.usuario WHERE id = ?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, usuario.getCod_usuario());
			
			preparador.execute();
			preparador.close();
			
			System.out.println("Excluido usuario com sucesso!");
		}catch(SQLException e) {
			System.out.println("Erro - "+e.getMessage());
		}
	}
	
	public List<Usuario> buscarTodos(Usuario usuario){
		String sql = "SELECT * FROM public.usuario ORDER BY id ASC";
		List<Usuario> lista = new ArrayList<Usuario>();
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			ResultSet resultados = preparador.executeQuery();
			while(resultados.next()) {
				
				Usuario usu = new Usuario();
				usu.setId(resultados.getInt("id"));
				usu.setNome(resultados.getString("nome"));
				usu.setCpf(resultados.getString("cpf"));
				usu.setEndereco(resultados.getString("endereco"));
				usu.setEmail(resultados.getString("email"));
				usu.setUsername(resultados.getString("username"));
				usu.setSenha(resultados.getString("senha"));
				usu.setAcesso(resultados.getString("nivel_acesso"));
				usu.setData_cadastro(resultados.getString("data_cadastro"));
				lista.add(usu);				
			}
			
		}catch(SQLException e) {
			System.out.println("Erro - "+e.getMessage());
		}
		return lista;
	}
	
	public Usuario buscarporID(Integer id){
		Usuario usuRetorno = null;
		String sql = "SELECT * FROM public.usuario WHERE id = ?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, id);
			//retorno da consulta em Resultset
			ResultSet resultado = preparador.executeQuery();
			//se tem registro
			if(resultado.next()) {
				//instancia o objeto Usuario
				usuRetorno = new Usuario();
				usuRetorno.setCod_usuario(resultado.getInt("id"));
				usuRetorno.setNome(resultado.getString("nome"));
				usuRetorno.setCpf(resultado.getString("cpf"));
				usuRetorno.setEndereco(resultado.getString("endereco"));
				usuRetorno.setEmail(resultado.getString("email"));
				usuRetorno.setUsername(resultado.getString("username"));
				usuRetorno.setSenha(resultado.getString("senha"));
				usuRetorno.setAcesso(resultado.getString("nivel_acesso"));
			}
			System.out.println("Encontrado com sucesso!");			
		}catch(SQLException e) {
			System.out.println("Erro de SQL - "+e.getMessage());
		}
		return usuRetorno;
	}
	
	public Usuario buscarUsuario(Usuario usuario){
		Usuario usuRetorno = null;
		String sql = "SELECT * FROM public.usuario WHERE username = ? and senha = ?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, username);
			preparador.setString(2, senha);
			//retorno da consulta em Resultset
			ResultSet resultado = preparador.executeQuery();
			//se tem registro
			if(resultado.next()) {
				//instancia o objeto Usuario
				usuRetorno = new Usuario();
				usuRetorno.setCod_usuario(resultado.getInt("id"));
				usuRetorno.setUsername(resultado.getString("username"));
				usuRetorno.setSenha(resultado.getString("senha"));
				usuRetorno.setAcesso(resultado.getString("nivel_acesso"));
			}
			System.out.println("Encontrado com sucesso!");			
		}catch(SQLException e) {
			System.out.println("Erro de SQL - "+e.getMessage());
		}
		return usuRetorno;
	}
	
	public Usuario autenticacao(Usuario usuario){
		Usuario usuRetorno = null;
		String sql = "SELECT * FROM public.usuario WHERE username = ? and senha = ?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, usuario.getUsername());
			preparador.setString(2, usuario.getSenha());
			//retorno da consulta em Resultset
			ResultSet resultado = preparador.executeQuery();
			//se tem registro
			if(resultado.next()) {
				//instancia o objeto Usuario
				usuRetorno = new Usuario();
				usuRetorno.setCod_usuario(resultado.getInt("id"));
				usuRetorno.setNome(resultado.getString("nome"));
				usuRetorno.setCpf(resultado.getString("cpf"));
				usuRetorno.setEndereco(resultado.getString("endereco"));
				usuRetorno.setEmail(resultado.getString("email"));
				usuRetorno.setUsername(resultado.getString("username"));
				usuRetorno.setSenha(resultado.getString("senha"));
				usuRetorno.setAcesso(resultado.getString("nivel_acesso"));
			}
			System.out.println("Encontrado usuario existente!");			
		}catch(SQLException e) {
			System.out.println("Erro de SQL - "+e.getMessage());
		}
		return usuRetorno;
	}

	public String Logon(Usuario usuario){
		
		String sql = "SELECT nivel_acesso FROM public.usuario WHERE username = ? and senha = ?";
		String Status = "";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, usuario.getUsername());
			preparador.setString(2, usuario.getSenha());
			//retorno da consulta em Resultset
			ResultSet resultado = preparador.executeQuery();
			//se tem registro
			if(resultado.next()) {
				
				Status = "true";
			}
			usuario.setAcesso(resultado.getString("nivel_acesso"));
			System.out.println("Encontrado Username existente!");			
		}catch(SQLException e) {
			System.out.println("Erro de SQL usuarioDAO - "+e.getMessage());
		}
		return Status;
	}

}
