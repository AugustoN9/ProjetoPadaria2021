package senairs.poo.aps.padaria.modelo;

import java.sql.Timestamp;

public class Venda {
	
	private int codVenda;
	private String cliente;
	private Timestamp datavenda;
	
	public Venda(int codVenda, String cliente, Timestamp datavenda) {
	
		this.codVenda = codVenda;
		this.cliente = cliente;
		this.datavenda = datavenda;
	}

	public int getCodVenda() {
		return codVenda;
	}

	public void setCodVenda(int codVenda) {
		this.codVenda = codVenda;
	}

	public String getCliente() {
		return cliente;
	}

	public void setCliente(String cliente) {
		this.cliente = cliente;
	}

	public Timestamp getDatavenda() {
		return datavenda;
	}

	public void setDatavenda(Timestamp datavenda) {
		this.datavenda = datavenda;
	}

}
