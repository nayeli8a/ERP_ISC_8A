package modelo.beans;

import java.sql.Date;

public class AusenciasJustificadas{

  private int idAusencia;
  private Date fechaSolicitud;
  private Date fechaInicio;
  private Date fechaFin;
  private String tipo;
  private String estatus;
  private String estatusAusencia;
  private int diasDescanso;
  private String nssAusente;
  private String nombreAusente;
  private String nssJefe;
  private String nombreJefe;
  
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
public String getEstatus() {
	return estatus;
}
public void setEstatus(String estatus) {
	this.estatus = estatus;
}
public String getEstatusAusencia() {
	return estatusAusencia;
}
public void setEstatusAusencia(String estatusAusencia) {
	this.estatusAusencia = estatusAusencia;
}
public int getDiasDescanso() {
	return diasDescanso;
}
public void setDiasDescanso(int diasDescanso) {
	this.diasDescanso = diasDescanso;
}
public String getNssAusente() {
	return nssAusente;
}
public void setNssAusente(String nssAusente) {
	this.nssAusente = nssAusente;
}
public String getNombreAusente() {
	return nombreAusente;
}
public void setNombreAusente(String nombreAusente) {
	this.nombreAusente = nombreAusente;
}
public String getNssJefe() {
	return nssJefe;
}
public void setNssJefe(String nssJefe) {
	this.nssJefe = nssJefe;
}
public String getNombreJefe() {
	return nombreJefe;
}
public void setNombreJefe(String nombreJefe) {
	this.nombreJefe = nombreJefe;
}




}
