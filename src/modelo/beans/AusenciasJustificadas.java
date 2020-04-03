package modelo.beans;

import java.sql.Date;

public class AusenciasJustificadas{

  private int idAusencia;
  private Date fechaSolicitud;
  private Date fechaInicio;
  private Date fechaFin;
  private String tipo;
  private int idEmpleadoS;
  private int idEmpleadoA;
public int getIdAusencia() {
	return idAusencia;
}
public void setIdAusencia(int idAusencia) {
	this.idAusencia = idAusencia;
}
public Date getFechaSolicitud() {
	return fechaSolicitud;
}
public void setFechaSolicitud(Date fechaSolicitud) {
	this.fechaSolicitud = fechaSolicitud;
}
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
public String getTipo() {
	return tipo;
}
public void setTipo(String tipo) {
	this.tipo = tipo;
}
public int getIdEmpleadoS() {
	return idEmpleadoS;
}
public void setIdEmpleadoS(int idEmpleadoS) {
	this.idEmpleadoS = idEmpleadoS;
}
public int getIdEmpleadoA() {
	return idEmpleadoA;
}
public void setIdEmpleadoA(int idEmpleadoA) {
	this.idEmpleadoA = idEmpleadoA;
}
  
  
}
