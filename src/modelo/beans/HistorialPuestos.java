package modelo.beans;


import java.sql.Date;


public class HistorialPuestos{

  private Date fechaInicio;
  private Date fechaFin;
  private float salario;

  private int idEmpleado;
  private String nss;

  private int idPuesto;

  private int idDepartamento;

public Date getFechaInicio() {
	return fechaInicio;
}

public void setFechaInicio(Date fechaInicio) {
	this.fechaInicio = fechaInicio;
}

public Date getFechaFin() {
	return fechaFin;
}

public void setFechaFin(Date fechaFin) {
	this.fechaFin = fechaFin;
}

public float getSalario() {
	return salario;
}

public void setSalario(float salario) {
	this.salario = salario;
}

public int getIdEmpleado() {
	return idEmpleado;
}

public void setIdEmpleado(int idEmpleado) {
	this.idEmpleado = idEmpleado;
}

public String getNss() {
	return nss;
}

public void setNss(String nss) {
	this.nss = nss;
}

public int getIdPuesto() {
	return idPuesto;
}

public void setIdPuesto(int idPuesto) {
	this.idPuesto = idPuesto;
}

public int getIdDepartamento() {
	return idDepartamento;
}

public void setIdDepartamento(int idDepartamento) {
	this.idDepartamento = idDepartamento;
}




}
