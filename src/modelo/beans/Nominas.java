package modelo.beans;

import java.sql.Date;

public class Nominas {
	int idNomina;
	Date fechaPago;
	float totalP;
	float totalD;
	float cantidadNeta;
	int diasTrabajados;
	int faltas;
	Date fechaInicio;
	Date fechaFin;
	int idEmpleado;
	int idFormaPago;
	
	public int getIdNomina() {
		return idNomina;
	}
	public void setIdNomina(int idNomina) {
		this.idNomina = idNomina;
	}
	public Date getFechaPago() {
		return fechaPago;
	}
	public void setFechaPago(Date fechaPago) {
		this.fechaPago = fechaPago;
	}
	public float getTotalP() {
		return totalP;
	}
	public void setTotalP(float totalP) {
		this.totalP = totalP;
	}
	public float getTotalD() {
		return totalD;
	}
	public void setTotalD(float totalD) {
		this.totalD = totalD;
	}
	public float getCantidadNeta() {
		return cantidadNeta;
	}
	public void setCantidadNeta(float cantidadNeta) {
		this.cantidadNeta = cantidadNeta;
	}
	public int getDiasTrabajados() {
		return diasTrabajados;
	}
	public void setDiasTrabajados(int diasTrabajados) {
		this.diasTrabajados = diasTrabajados;
	}
	public int getFaltas() {
		return faltas;
	}
	public void setFaltas(int faltas) {
		this.faltas = faltas;
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
	public int getIdEmpleado() {
		return idEmpleado;
	}
	public void setIdEmpleado(int idEmpleado) {
		this.idEmpleado = idEmpleado;
	}
	public int getIdFormaPago() {
		return idFormaPago;
	}
	public void setIdFormaPago(int idFormaPago) {
		this.idFormaPago = idFormaPago;
	}
	
	
}
