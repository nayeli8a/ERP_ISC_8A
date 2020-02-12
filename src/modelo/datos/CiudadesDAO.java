package modelo.datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.beans.Ciudades;

public class CiudadesDAO {

	PreparedStatement ps;
	ResultSet rs;

	public void insertarCiudades(String nom_ciudad,int id_Estado, String estatus)
	{
		String sql = "insert into ciudades(nombre,estatus) values('"+nom_ciudad+"','"+estatus+"')";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al insertar el Estado en la BD: "+e.getMessage());
		}
	}
	
	
	public boolean ValidarCiudades(String nom_ciudad) {
		boolean salida=false;
		String sql = "SELECT nombre FROM ciudades WHERE nombre=?";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1, nom_ciudad);
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
	public List <Ciudades> consultar() {
		ArrayList<Ciudades> lista = new ArrayList<>();
		String sql = "select * from ciudades";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Ciudades c = new Ciudades();
				c.setIdCiudad(rs.getInt(1));
				c.setNombre(rs.getString(2));
				c.setIdEstado(rs.getInt(3));
				c.setEstatus(rs.getString(4));
			
				lista.add(c);
			}
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
		return lista;
	}
	
	public Ciudades consultaIndividual(int idCiudad){
		String sql="select * from ciudades where idCiudad=?";
		Ciudades c=new Ciudades();
		try{
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setInt(1, idCiudad);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				c.setIdCiudad(rs.getInt("idUsuario"));
				c.setNombre(rs.getString("Nombre"));
				c.setIdEstado(rs.getInt("IdEstado"));
				c.setEstatus(rs.getString("Estatus"));
				
			}
			ps.close();
			rs.close();
			Conexion.getInstance().cerrar();
			
		}
		catch(SQLException e){
			System.out.println("Error:"+e.getMessage());
		}
		return c;
	}
	
	public void eliminar(String id){
		//if() { //estatus inactivo
			
			String sql = "delete from usuarios where idUsuario ="+id;
			try {
				ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error: " + e.getMessage());
			}
		}
	//	else {
			
		//}
	
	
	
	public Ciudades listarId(String id){
		String sql = "select * from ciudades where idCiudad="+id;
		Ciudades c = new Ciudades();
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				c.setIdCiudad(rs.getInt(1));
				c.setNombre(rs.getString(2));
				c.setIdEstado(rs.getInt(3));
				c.setEstatus(rs.getString(4));
				
			}
		} catch (Exception e) {
			System.out.println("Error en UsuarioDAO listarId");
		}
		return c;
	}


}
