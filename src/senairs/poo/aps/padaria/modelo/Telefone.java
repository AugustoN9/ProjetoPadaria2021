package senairs.poo.aps.padaria.modelo;

public class Telefone {
	
	private String cod_origem;
	private int ddd;
	private int numero;
	private String tipo;
	
	public Telefone() {}
	
	public Telefone(int ddd, int numero) {
		this.ddd = ddd;
		this.numero = numero;
	}
	
	public Telefone(String tipo, int ddd, int numero) {
		this.tipo = tipo;
		this.ddd = ddd;
		this.numero = numero;
	}

	public String getCod_origem() {
		return cod_origem;
	}

	public void setCod_origem(String cod_origem) {
		this.cod_origem = cod_origem;
	}

	public int getDdd() {
		return ddd;
	}

	public void setDdd(int ddd) {
		this.ddd = ddd;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

}
