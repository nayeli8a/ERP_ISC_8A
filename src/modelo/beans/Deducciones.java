package modelo.beans;

public class Deducciones {
	private int idDeduccion;
	private String nombre;
	private String descripcion;
	private String estatus;
	private Float porcentaje;

	public int getIdDeduccion() {
		return idDeduccion;
	}
	public void setIdDeduccion(int idDeduccion) {
		this.idDeduccion = idDeduccion;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getEstatus() {
		return estatus;
	}
	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}
	public Float getPorcentaje() {
		return porcentaje;
	}
	public void setPorcentaje(Float porcentaje) {
		this.porcentaje = porcentaje;
	}




}
