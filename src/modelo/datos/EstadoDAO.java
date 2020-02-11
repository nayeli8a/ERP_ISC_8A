package modelo.datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import modelo.beans.*;

public class EstadoDAO {
	
	public boolean ValidarEstado(String nom_estado) {
		boolean salida=false;
		String sql = "SELECT nombre FROM Estados WHERE nombre=?";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1, nom_estado);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				//si encuentra un estado con ese nombre, marcamos que el estado ya existe
				salida = true;
			}else
			{
				salida = false;
			}
			
			rs.close();
			ps.close();
			
		} catch (SQLException e) {
			System.out.println("Error al conectar con la BD " + e.getMessage());
		}
		return salida;
	}
	
	public void insertarEstado(String nom_estado,String siglas,String estatus)
	{
		String sql = "insert into Estados (Nombre,Siglas,Estatus) values('"+nom_estado+"','"+siglas+"','"+estatus+"')";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al insertar el Estado en la BD: "+e.getMessage());
		}
	}
}
