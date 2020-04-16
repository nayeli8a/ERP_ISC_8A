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

	public void insertarCiudades(String nom_ciudad,String nombre_estado, String estatus)
	{
		String sql1 = "select idEstado from Estados where Nombre ='"+nombre_estado+"'";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql1);
			ResultSet rs = ps.executeQuery();
			int idEstado=0;
			
			while(rs.next())
			{
				  idEstado = rs.getInt("idEstado");
			}
			String sql = "insert into Ciudades(nombre,estatus,idEstado) values('"+nom_ciudad+"','"+estatus+"',"+idEstado+")";
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al insertar la ciudad en la BD: "+e.getMessage());
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
			System.out.println("Error al conectar con la BD al validar " + e.getMessage());
		}
		return salida;
	}
	
	/*Este metodo se encarga de listar todos los objetos de ciudades para mostrarlos en una interfaz de registro*/
	public List<Ciudades> consultar()
	{
		String sql = "select * from ciudades";
		ArrayList<Ciudades> lista = new ArrayList<>();
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
	
	/*Este metodo se encarga de listar los primeros 10 registros para mostrarlos en un html*/
	public List <Ciudades> consultar(String pagina) {
		ArrayList<Ciudades> lista = new ArrayList<>();
		String sql = "execute sp_paginaciondinamica 'Ciudades','idCiudad','"+pagina+"','5'";
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
				c.setIdCiudad(rs.getInt("idCiudad"));
				c.setNombre(rs.getString("Nombre"));
				c.setIdEstado(rs.getInt("idEstado"));
				c.setEstatus(rs.getString("Estatus"));
			}
			ps.close();
			rs.close();
		}
		catch(SQLException e){
			System.out.println("Error CDAO:"+e.getMessage());
		}
		return c;
	}
	
	public void eliminar(String id){
		String sql = "execute sp_EliminarLogicamente 'Ciudades','"+id+"','idCiudad'";
		try {
				ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error al eliminar Ciudad: " + e.getMessage());
			}
	}
	
	
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
	
	public void actualizar(Ciudades us)
	{
		String sql="update Ciudades set nombre=?,idEstado=?,Estatus=? where idCiudad=?";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1, us.getNombre());
			ps.setInt(2,us.getIdEstado());
			ps.setString(3,us.getEstatus());
			ps.setInt(4, us.getIdCiudad());
			ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("Error al actualizar la Ciudad"+e.getMessage());
		}
	}


}
