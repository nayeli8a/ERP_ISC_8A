package modelo.datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.beans.Deducciones;
import modelo.beans.Percepciones;

public class PercepcionesDAO {
	
	public boolean ValidarPercepciones(String nom_percepcion) {
		boolean salida=false;
		String sql = "SELECT nombre FROM Percepciones WHERE nombre=?";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1, nom_percepcion);
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
	
	
	public void insertarPercepciones(String nom_percepcion, String descripcion, int	 diasPagar, String estatus)
	{
		String sql = "insert into Percepciones (Nombre,Descripcion,diasPagar, estatus) values('"+nom_percepcion+"','"+descripcion+"','"+diasPagar+"','"+estatus+"')";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al insertar el Estado en la BD: "+e.getMessage());
		}
	}
	
	public List<Percepciones> consultar(String pagina)
	{
		ArrayList<Percepciones> lista = new ArrayList<>();
		String sql = "execute sp_paginaciondinamica 'Percepciones','nombre','"+pagina+"','5'";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Percepciones p = new Percepciones();
				p.setIdPercepcion(rs.getInt(1));
				p.setNombre(rs.getString(2));
				p.setDescripcion(rs.getString(3));
				p.setDiasPagar(rs.getInt(4));
				p.setEstatus(rs.getString(5));
				lista.add(p);
			}
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
		return lista;
	}
	public void eliminar(String id){
		String sql = "execute sp_EliminarLogicamente 'Percepciones','"+id+"','idPercepcion'";
		System.out.println(sql);
		try {
				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error: " + e.getMessage());
			}
	}
	public void actualizar(Percepciones p)
	{
		String sql="update Percepciones set Nombre=?,Descripcion=?,DiasPagar=?, Estatus=? where idPercepcion=?";
		try {
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);

			ps.setString(1, p.getNombre());
			ps.setString(2,p.getDescripcion());
			ps.setInt(3,p.getDiasPagar());
			ps.setString(4, p.getEstatus());	
			ps.setInt(5, p.getIdPercepcion());
			ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("Error al actualizar el estado"+e.getMessage());
		}
	}
	public Percepciones consultaIndividual(int idPercepcion){
		String sql="select * from Percepciones where idPercepcion=?";
		Percepciones p = new Percepciones();
		try{
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setInt(1, idPercepcion);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				p.setIdPercepcion(rs.getInt("idPercepcion"));
				p.setNombre(rs.getString("nombre"));
				p.setDescripcion(rs.getString("descripcion"));
				p.setDiasPagar(rs.getInt("diasPagar"));
				p.setEstatus(rs.getString("estatus"));
			}
			ps.close();
			rs.close();
		}
		catch(SQLException e){
			System.out.println("Error ESDAO:"+e.getMessage());
		}
		return p;
	}
}
