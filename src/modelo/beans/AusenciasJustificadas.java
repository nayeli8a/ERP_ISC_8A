package modelo.beans;

import java.sql.Date;

public class AusenciasJustificadas{
//Ausencias
  private int idAusencia;
  private Date fechaSolicitud;
  private Date fechaInicio;
  private Date fechaFin;
  private String tipo;
  private int idEmpleadoS;
  private int idEmpleadoA;
  private String estatusAusencias;

private String estatus;
  
  //EmpleadoAusente
  private String NSSA;
  private int diasPermiso;
  private int diasVacaciones;
  private String nombreA;
  private String apaternoA;
  private String amaternoA;
	
  
  //EmpleadoS
  private String NSSS;
  private String nombreS;
  private String apaternS;
  private String amaternoS;
	
  public String getEstatusAusencias() {
	return estatusAusencias;
}
public void setEstatusAusencias(String estatusAusencias) {
	this.estatusAusencias = estatusAusencias;
}
  

public String getNSSA() {
	return NSSA;
}
public void setNSSA(String nSSA) {
	NSSA = nSSA;
}
public int getDiasPermiso() {
	return diasPermiso;
}
public void setDiasPermiso(int diasPermiso) {
	this.diasPermiso = diasPermiso;
}
public int getDiasVacaciones() {
	return diasVacaciones;
}
public void setDiasVacaciones(int diasVacaciones) {
	this.diasVacaciones = diasVacaciones;
}
public String getNombreA() {
	return nombreA;
}
public void setNombreA(String nombreA) {
	this.nombreA = nombreA;
}
public String getApaternoA() {
	return apaternoA;
}
public void setApaternoA(String apaternoA) {
	this.apaternoA = apaternoA;
}
public String getAmaternoA() {
	return amaternoA;
}
public void setAmaternoA(String amaternoA) {
	this.amaternoA = amaternoA;
}
public String getNSSS() {
	return NSSS;
}
public void setNSSS(String nSSS) {
	NSSS = nSSS;
}
public String getNombreS() {
	return nombreS;
}
public void setNombreS(String nombreS) {
	this.nombreS = nombreS;
}
public String getApaternS() {
	return apaternS;
}
public void setApaternS(String apaternS) {
	this.apaternS = apaternS;
}
public String getAmaternoS() {
	return amaternoS;
}
public void setAmaternoS(String amaternoS) {
	this.amaternoS = amaternoS;
}
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

public String getEstatus() {
  return estatus;
}
public void setEstatus(String estatus) {
  this.estatus = estatus;
}


}
