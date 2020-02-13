package modelo.beans;

public class Deducciones {
	private int idDeduccion;
	private String nombre;
	private String descripcion;
	private float porcentaje;
	private String estatus; 
	
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
	public float getPorcentaje() {
		return porcentaje;
	}
	public void setPorcentaje(float porcentaje) {
		this.porcentaje = porcentaje;
	}
	public String getEstatus() {
		return estatus;
	}
	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}
	
	
	
}
