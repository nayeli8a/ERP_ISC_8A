package modelo.beans;

import java.io.InputStream;
import java.sql.Date;

public class Incapacidades {
	private int idIncapacidad;
	private Date fechaInicio;
	private Date fechaFin;
	private String enfermedad;
	private InputStream evidencia;
	private int idEmpleado;
	private String estatus;
	private String nss;
	
	
	
	public String getNss() {
		return nss;
	}
	public void setNss(String nss) {
		this.nss = nss;
	}
	public int getIdIncapacidad() {
		return idIncapacidad;
	}
	public void setIdIncapacidad(int idIncapacidad) {
		this.idIncapacidad = idIncapacidad;
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
	public String getEnfermedad() {
		return enfermedad;
	}
	public void setEnfermedad(String enfermedad) {
		this.enfermedad = enfermedad;
	}
	public InputStream getEvidencia() {
		return evidencia;
	}
	public void setEvidencia(InputStream evidencia) {
		this.evidencia = evidencia;
	}
	public int getIdEmpleado() {
		return idEmpleado;
	}
	public void setIdEmpleado(int idEmpleado) {
		this.idEmpleado = idEmpleado;
	}
	public String getEstatus() {
		return estatus;
	}
	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}
	
	
	
}
