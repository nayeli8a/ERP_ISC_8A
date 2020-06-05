package modelo.datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.beans.Departamentos;
import modelo.beans.Estado;

public class DepartamentosDAO {
	public boolean ValidarDepartamento(String nom_departamento) {
		boolean salida=false;
		String sql = "SELECT nombre FROM Departamentos WHERE nombre=?";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1, nom_departamento);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				//si encuentra un registro con ese nombre, marcamos que el estado ya existe
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
	
	public void insertarDepartamento(String nom_departamento,String estatus)
	{
		String sql = "insert into Departamentos (Nombre,Estatus) values('"+nom_departamento+"','"+estatus+"')";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al insertar el Estado en la BD: "+e.getMessage());
		}
	}
	
	public List<Departamentos> consultar()
	{
		String sql = "select * from departamentos";
		ArrayList<Departamentos> lista = new ArrayList<>();
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Departamentos d = new Departamentos();
				d.setIdDepartamento(rs.getInt(1));
				d.setNombre(rs.getString(2));
				d.setEstatus(rs.getString(3));
				lista.add(d);
			}
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
		return lista;
	}
	
	public List<Departamentos> consultar(String pagina)
	{
		ArrayList<Departamentos> lista = new ArrayList<>();
		String sql = "execute sp_paginaciondinamica 'Departamentos','nombre','"+pagina+"','5'";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Departamentos d = new Departamentos();
				d.setIdDepartamento(rs.getInt(1));
				d.setNombre(rs.getString(2));
				d.setEstatus(rs.getString(3));
				lista.add(d);
			}
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
		return lista;
	}
	
	public Departamentos consultaIndividual(int idDepartamento){
		String sql="select * from Departamentos where idDepartamento=?";
		Departamentos d = new Departamentos();
		try{
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setInt(1, idDepartamento);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				d.setIdDepartamento(rs.getInt("idDepartamento"));
				d.setNombre(rs.getString("nombre"));
				d.setEstatus(rs.getString("estatus"));
			}
			ps.close();
			rs.close();
		}
		catch(SQLException e){
			System.out.println("Error DEPARTAMENTOSDAO:"+e.getMessage());
		}
		return d;
	}
	
	public void eliminar(String id){
		String sql = "execute sp_EliminarLogicamente 'Departamentos','"+id+"','idDepartamento','Empleados'";
		System.out.println(sql);
		try {
				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error: " + e.getMessage());
			}
	}
	public void actualizar(Departamentos d)
	{
		String sql="update Departamentos set Nombre=?,Estatus=? where idDepartamento=?";
		try {
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);

			ps.setString(1, d.getNombre());
			ps.setString(2,d.getEstatus());
			ps.setInt(3, d.getIdDepartamento());
			ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("Error al actualizar el departamento"+e.getMessage());
		}
	}
}
