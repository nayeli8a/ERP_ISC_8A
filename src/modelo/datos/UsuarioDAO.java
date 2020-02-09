package modelo.datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import modelo.beans.*;

public class UsuarioDAO {
	
	public Usuarios ValidarUsuarios(String nom_usuario, String codigo) {
		Usuarios u = new Usuarios();
		String sql = "select nombre,contrasenia,estatus,idEmpleado,idTipoUsuario from Usuarios where nombre=? and contrasenia=?";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1, nom_usuario);
			ps.setString(2, codigo);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				u.setNombre(rs.getString("nombre"));
				u.setContrasenia(rs.getString("contrasenia"));
				u.setEstatus(rs.getString("estatus"));
				u.setidEmpleado(Integer.parseInt(rs.getString("idEmpleado")));
				u.setidTipoUsuario(Integer.parseInt(rs.getString("idTipoUsuario")));
			}
			
			rs.close();
			ps.close();
		} catch (SQLException e) {
			System.out.println("Error al conectar con la BD " + e.getMessage());
		}
		return u;
	}
}
