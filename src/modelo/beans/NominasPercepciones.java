package modelo.beans;

public class NominasPercepciones {
	int idNomina;
	int idPercepcion;
	float importe;
	String estatus;
	
	//nombre percepcion
	String nombre;
	
	
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getIdNomina() {
		return idNomina;
	}
	public void setIdNomina(int idNomina) {
		this.idNomina = idNomina;
	}
	public int getIdPercepcion() {
		return idPercepcion;
	}
	public void setIdPercepcion(int idPercepcion) {
		this.idPercepcion = idPercepcion;
	}
	public float getImporte() {
		return importe;
	}
	public void setImporte(float importe) {
		this.importe = importe;
	}
	public String getEstatus() {
		return estatus;
	}
	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}
	
	
}
