package modelo.beans;

public class NominasDeducciones {
	int idNomina;
	int idDeduccion;
	float importe;
	String estatus;
	
	public int getIdNomina() {
		return idNomina;
	}
	public void setIdNomina(int idNomina) {
		this.idNomina = idNomina;
	}
	public int getIdDeduccion() {
		return idDeduccion;
	}
	public void setIdDeduccion(int idDeduccion) {
		this.idDeduccion = idDeduccion;
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
