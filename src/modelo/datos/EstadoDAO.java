package modelo.datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<Estado> consultar(String pagina)
	{
		ArrayList<Estado> lista = new ArrayList<>();
		String sql = "execute sp_paginaciondinamica 'Estados','nombre','"+pagina+"','5'";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Estado es = new Estado();
				es.setIdEstado(rs.getInt(1));
				es.setNombre(rs.getString(2));
				es.setSiglas(rs.getString(3));
				es.setEstatus(rs.getString(4));
				lista.add(es);
			}
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
		return lista;
	}
	
	public Estado consultaIndividual(int idEstado){
		String sql="select * from Estados where idEstado=?";
		Estado c = new Estado();
		try{
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setInt(1, idEstado);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				c.setIdEstado(rs.getInt("idEstado"));
				c.setNombre(rs.getString("nombre"));
				c.setEstatus(rs.getString("estatus"));
				c.setSiglas(rs.getString("siglas"));
			}
			ps.close();
			rs.close();
		}
		catch(SQLException e){
			System.out.println("Error ESDAO:"+e.getMessage());
		}
		return c;
	}
	
	public void eliminar(String id){
		String sql = "execute sp_EliminarLogicamente 'Estados','"+id+"','idEstado'";
		System.out.println(sql);
		try {
				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error: " + e.getMessage());
			}
	}
	public void actualizar(Estado es)
	{
		String sql="update Estados set Nombre=?,Siglas=?,Estatus=? where idEstado=?";
		try {
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);

			ps.setString(1, es.getNombre());
			ps.setString(2,es.getSiglas());
			ps.setString(3,es.getEstatus());
			ps.setInt(4, es.getIdEstado());			
			ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("Error al actualizar el estado"+e.getMessage());
		}
	}
}
