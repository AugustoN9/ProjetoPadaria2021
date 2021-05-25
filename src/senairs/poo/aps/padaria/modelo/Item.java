package senairs.poo.aps.padaria.modelo;

public class Item {
	
	private Produto produto;
	private int quantidade;
	
	public Item(Produto prod, int quant) {
		this.produto = prod;
		this.quantidade = quant;		
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	
	public void valorItem() {
		
	}

}
