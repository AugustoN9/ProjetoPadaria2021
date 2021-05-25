package senairs.poo.aps.padaria.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexao {
	
	private static final String driver = "org.postgresql.Driver";
	private static final String usuario = "postgres";
	private static final String senha = "123456";
	private static final String caminho = "jdbc:postgresql://localhost:5432/SistemaPadariaArtesanal";
	
	public static Connection getConnection() {
		Connection con = null;
		 try {
			Class.forName(driver);
			con = DriverManager.getConnection(caminho,usuario,senha);
			System.out.println("Conectado com sucesso!");
		 }catch(SQLException excecao) {
			System.out.println("Erro na conexão "+excecao.getMessage());
		 }catch(ClassNotFoundException e){
			System.out.println("Erro - Driver "+e.getMessage());
		 }		 
		return con;
    }
	
	public static void closeConnection(Connection con) {
		try {
			if(con != null) {
				con.close();
			}			
		}catch(SQLException ex){
			Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	
	public static void closeConnection(Connection con, PreparedStatement stmt) {
		closeConnection(con);
		
		try {
			if(stmt != null) {
				stmt.close();
			}			
			
		}catch(SQLException ex){
			Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
	
	public static void closeConnection(Connection con, PreparedStatement stmt, ResultSet rs) {
		closeConnection(con, stmt);
		
		try {
			if(rs != null) {
				rs.close();
			}			
			
		}catch(SQLException ex){
			Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

}
