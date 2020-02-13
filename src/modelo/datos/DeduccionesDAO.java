package modelo.datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.beans.Deducciones;
import modelo.beans.Estado;

public class DeduccionesDAO {
	
	public boolean ValidarDeducciones(String nom_deduccion) {
		boolean salida=false;
		String sql = "SELECT nombre FROM Deducciones WHERE nombre=?";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1, nom_deduccion);
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
	
	
	
	public void insertarDeducciones(String nom_deduccion,String descripcion, float porcentaje, String estatus)
	{
		String sql = "insert into Deducciones (Nombre,Descripcion,Porcentaje,estatus) values('"+nom_deduccion+"','"+descripcion+"','"+porcentaje+"','"+estatus+"')";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al insertar el Estado en la BD: "+e.getMessage());
		}
	}
	
	public List<Deducciones> consultar()
	{
		ArrayList<Deducciones> lista = new ArrayList<>();
		String sql = "select * from Deducciones";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Deducciones d = new Deducciones();
				d.setIdDeduccion(rs.getInt(1));
				d.setNombre(rs.getString(2));
				d.setDescripcion(rs.getString(3));
				d.setPorcentaje(rs.getFloat(4));
				d.setEstatus(rs.getString(5));
				lista.add(d);
			}
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
		return lista;
	}

}
