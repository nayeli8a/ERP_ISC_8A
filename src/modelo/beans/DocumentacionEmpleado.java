package modelo.beans;

import java.io.InputStream;
import java.sql.Date;


public class DocumentacionEmpleado{

  private int idDocumento;
  private String nombreDocumento;
  private Date fechaEntrega;
  private InputStream documento;
  private int idEmpleado;
  private String nss;
  private String estatus;
  
  
  
public String getEstatus() {
	return estatus;
}
public void setEstatus(String estatus) {
	this.estatus = estatus;
}
public String getNss() {
	return nss;
}
public void setNss(String nss) {
	this.nss = nss;
}
public int getIdDocumento() {
	return idDocumento;
}
public void setIdDocumento(int idDocumento) {
	this.idDocumento = idDocumento;
}
public String getNombreDocumento() {
	return nombreDocumento;
}
public void setNombreDocumento(String nombreDocumento) {
	this.nombreDocumento = nombreDocumento;
}
public Date getFechaEntrega() {
	return fechaEntrega;
}
public void setFechaEntrega(Date fechaEntrega) {
	this.fechaEntrega = fechaEntrega;
}
public InputStream getDocumento() {
	return documento;
}
public void setDocumento(InputStream documento) {
	this.documento = documento;
}
public int getIdEmpleado() {
	return idEmpleado;
}
public void setIdEmpleado(int idEmpleado) {
	this.idEmpleado = idEmpleado;
}
  
  
  
}
