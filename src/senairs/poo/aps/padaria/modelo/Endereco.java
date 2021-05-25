package senairs.poo.aps.padaria.modelo;

public class Endereco {
	
	private int cod_end;
	private String logradouro;
	private String nome;
	private int numero;
	private String complemento;
	private String bairro;
	private String cidade;
	private String estado;
	
	public Endereco() {}
	
	public Endereco(int cod_end, String logradouro, String nome, int numero, String complemento, String bairro, String cidade, String estado) {
		this.cod_end = cod_end;
		this.logradouro = logradouro;
		this.nome = nome;
		this.numero = numero;
		this.complemento = complemento;
		this.bairro = bairro;
		this.cidade = cidade;
		this.estado = estado;
	}

	public int getCod_end() {
		return cod_end;
	}

	public void setCod_end(int cod_end) {
		this.cod_end = cod_end;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

}
