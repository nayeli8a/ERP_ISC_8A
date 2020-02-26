package modelo.datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.beans.Puestos;

public class PuestosDAO {
	public boolean ValidarPuesto(String nom_puestos) {
		boolean salida=false;
		String sql = "SELECT nombre FROM Puestos WHERE nombre=?";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1, nom_puestos);
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
	
	public void insertarPuesto(String nom_puestos, float SalarioMinimo,float SalarioMaximo, String estatus)
	{
		String sql = "insert into Puestos (Nombre,SalarioMinimo, SalarioMaximo, Estatus) values('"+nom_puestos+"','"+SalarioMinimo+"','"+SalarioMaximo+"','"+estatus+"')";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al insertar el Estado en la BD: "+e.getMessage());
		}
	}
	
	public List<Puestos> consultar()
	{
		ArrayList<Puestos> lista = new ArrayList<>();
		String sql = "select * from Puestos";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Puestos p = new Puestos();
				p.setIdPuesto(rs.getInt(1));
				p.setNombre(rs.getString(2));
				p.setSalarioMinimo(rs.getFloat(3));
				p.setSalarioMaximo(rs.getFloat(4));
				p.setEstatus(rs.getString(5));
				lista.add(p);
			}
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
		return lista;
	}
	
	public Puestos consultaIndividual(int idPuesto){
		String sql="select * from Puestos where idPuesto=?";
		Puestos p = new Puestos();
		try{
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setInt(1, idPuesto);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				p.setIdPuesto(rs.getInt("idPuesto"));
				p.setNombre(rs.getString("nombre"));
				p.setSalarioMinimo(rs.getFloat("SalarioMinimo"));
				p.setSalarioMaximo(rs.getFloat("SalarioMaximo"));
				p.setEstatus(rs.getString("estatus"));
			}
			ps.close();
			rs.close();
		}
		catch(SQLException e){
			System.out.println("Error PUESTOSDAO:"+e.getMessage());
		}
		return p;
	}
	
	public void eliminar(String id){
		String sql = "execute sp_EliminarLogicamente 'Puestos','"+id+"','idPuestos'";
		System.out.println(sql);
		try {
				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error: " + e.getMessage());
			}
	}
	public void actualizar(Puestos p)
	{
		String sql="update Puestos set Nombre=?, SalarioMaximo=?, SalarioMinimo=?, Estatus=? where idPuesto=?";
		try {
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);

			ps.setString(1, p.getNombre());
			ps.setFloat(2, p.getSalarioMinimo());
			ps.setFloat(3, p.getSalarioMaximo());
			ps.setString(4,p.getEstatus());	
			ps.setInt(5, p.getIdPuesto());
			ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("Error al actualizar el puesto "+e.getMessage());
		}
	}


}

