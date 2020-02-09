package modelo.beans;

public class Usuarios {
	private String nombre;
	private String contrasenia;
	private String estatus;
	private int idEmpleado;
	private int idTipoUsuario;
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getContrasenia() {
		return contrasenia;
	}
	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}
	public String getEstatus() {
		return estatus;
	}
	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}
	public int getidEmpleado() {
		return idEmpleado;
	}
	public void setidEmpleado(int idEmpleado) {
		this.idEmpleado = idEmpleado;
	}
	public int getidTipoUsuario() {
		return idTipoUsuario;
	}
	public void setidTipoUsuario(int idTipoUsuario) {
		this.idTipoUsuario = idTipoUsuario;
	}
	
	
}
