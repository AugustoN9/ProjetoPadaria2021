package senairs.poo.aps.padaria.modelo;

public class Pedido {
	
	private int cod_pedido;
	private Produto produto;
	private Usuario usuario;
	private int quantidade;
	private Double preco_unid_peso;
	
	public Pedido() {
		
	}

	public int getCod_pedido() {
		return cod_pedido;
	}

	public void setCod_pedido(int cod_pedido) {
		this.cod_pedido = cod_pedido;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public Double getPreco_unid_peso() {
		return preco_unid_peso;
	}

	public void setPreco_unid_peso(Double preco_unid_peso) {
		this.preco_unid_peso = preco_unid_peso;
	}

}
