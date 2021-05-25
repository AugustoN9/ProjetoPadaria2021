package senairs.poo.aps.padaria.modelo;

import java.util.ArrayList;
import java.util.List;


public class Carrinho {
	
	private int item;
	private int idProduto;
	private String nome;
	private Double precocompra;
	private int quantidade;
	private Double subtotal;
	
	public Carrinho() {
		
	}
	
	public int getItem() {
		return item;
	}
	public void setItem(int item) {
		this.item = item;
	}
	public int getIdProduto() {
		return idProduto;
	}
	public void setIdProduto(int idProduto) {
		this.idProduto = idProduto;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public Double getPrecocompra() {
		return precocompra;
	}
	public void setPrecocompra(Double precocompra) {
		this.precocompra = precocompra;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	public Double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}
	
	
}
