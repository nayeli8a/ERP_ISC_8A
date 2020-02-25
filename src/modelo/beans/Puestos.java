package modelo.beans;

public class Puestos {
	
	 private int idPuesto;
	 private String nombre;
	 private float salarioMinimo;
	 private float salarioMaximo;
	 private String estatus;
	 
	public int getIdPuesto() {
		return idPuesto;
	}
	public void setIdPuesto(int idPuesto) {
		this.idPuesto = idPuesto;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public float getSalarioMinimo() {
		return salarioMinimo;
	}
	public void setSalarioMinimo(float salarioMinimo) {
		this.salarioMinimo = salarioMinimo;
	}
	public float getSalarioMaximo() {
		return salarioMaximo;
	}
	public void setSalarioMaximo(float salarioMaximo) {
		this.salarioMaximo = salarioMaximo;
	}
	public String getEstatus() {
		return estatus;
	}
	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}
	 
}
