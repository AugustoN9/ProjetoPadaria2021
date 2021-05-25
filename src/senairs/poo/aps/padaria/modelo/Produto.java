package senairs.poo.aps.padaria.modelo;

public abstract class Produto {
	
	public Integer codProduto;
	public String nome;
	public String validade;
	public String categoria;
	public Double preco;
	public String imagem;
	public Double quantidade;
	
	public Produto() {
		
	}

	public Produto(Integer codProduto, String nome, String validade, String categoria, Double preco, String imagem,
			Double quantidade) {
		this.codProduto = codProduto;
		this.nome = nome;
		this.validade = validade;
		this.categoria = categoria;
		this.preco = preco;
		this.imagem = imagem;
		this.quantidade = quantidade;
	}

	public Integer getCodProduto() {
		return codProduto;
	}

	public void setCodProduto(Integer codProduto) {
		this.codProduto = codProduto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getValidade() {
		return validade;
	}

	public void setValidade(String validade) {
		this.validade = validade;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public Double getPreco() {
		return preco;
	}
	
	public void setPreco(Double preco) {
		this.preco = preco;
	}
	
	//SOBRECARGA DE METODO

	public void setPreco(Double preco, int quant) {
		preco = preco * quant;
	}
	
	public void setPreco(Double preco, float peso) {
		preco = preco * peso;
	}
	
	//

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public Double getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Double quantidade) {
		this.quantidade = quantidade;
	}
	
	public double precoQuantidade(double preco, double quantidade) {
		double precoReal = preco * quantidade;
		return precoReal;
	}
	
	public double precoQuantidade(double preco, int quantidade) {
		double precoReal = preco * quantidade;
		return precoReal;
	}
	
	public float precoQuantidade(float preco, int quantidade) {
		float precoReal = preco * quantidade;
		return precoReal;
	}
	
	//METODO PARA SER SOBREESCRITO
	
	public double aplicaDesconto() {
		int quantidade = 0;
		if(quantidade > 5) {
			preco = preco - 0.1f;
		}
		return preco;
	}
	
}
