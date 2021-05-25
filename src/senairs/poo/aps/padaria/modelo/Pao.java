package senairs.poo.aps.padaria.modelo;

public class Pao extends Produto {
	
	private String tipo_farinha;
	private String peso;

	public String getTipo_farinha() {
		return tipo_farinha;
	}

	public void setTipo_farinha(String tipo_farinha) {
		this.tipo_farinha = tipo_farinha;
	}

	public String getPeso() {
		return peso;
	}

	public void setPeso(String peso) {
		this.peso = peso;
	}
	
	@Override
	public double aplicaDesconto() {		
		if(quantidade > 250d) {
			preco = preco - 0.1d;
		}
	return preco;
	}
}
