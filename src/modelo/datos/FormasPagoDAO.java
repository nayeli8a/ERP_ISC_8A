package modelo.datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.beans.FormasPago;

public class FormasPagoDAO {
	public boolean ValidarFormaPago(String nombre) {
		boolean salida=false;
		String sql = "SELECT nombre FROM FormasPago WHERE nombre=?";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1, nombre);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
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
	
	public void insertarFormaPago(String nombre ,String estatus)
	{
		String sql = "insert into FormasPago (Nombre,Estatus) values('"+nombre+"','"+estatus+"')";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al insertar forma de pago en la BD: "+e.getMessage());
		}
	}
	
	public List<FormasPago> consultar(String pagina)
	{
		ArrayList<FormasPago> lista = new ArrayList<>();
		String sql = "execute sp_paginaciondinamica 'FormasPago','nombre','"+pagina+"','10'";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				FormasPago pago = new FormasPago();
				pago.setIdFormaPago(rs.getInt(1));
				pago.setNombre(rs.getString(2));
				pago.setEstatus(rs.getString(3));
				lista.add(pago);
			}
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
		return lista;
	}
	
	public List<FormasPago> consultar()
	{
		ArrayList<FormasPago> lista = new ArrayList<>();
		String sql = "select * from FormasPago";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				FormasPago pago = new FormasPago();
				pago.setIdFormaPago(rs.getInt(1));
				pago.setNombre(rs.getString(2));
				pago.setEstatus(rs.getString(3));
				lista.add(pago);
			}
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
		return lista;
	}
	public FormasPago consultaIndividual(int idFormaPago){
		String sql="select * from FormasPago where idFormaPago=?";
		FormasPago pago = new FormasPago();
		try{
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setInt(1, idFormaPago);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				pago.setIdFormaPago(rs.getInt("idFormaPago"));
				pago.setNombre(rs.getString("nombre"));
				pago.setEstatus(rs.getString("estatus"));
							}
			ps.close();
			rs.close();
		}
		catch(SQLException e){
			System.out.println("Error DAO:"+e.getMessage());
		}
		return pago;
	}
	
	public void eliminar(String id){
		String sql = "execute sp_EliminarLogicamente 'FormasPago','"+id+"','idFormaPago','Pagos'";
		System.out.println(sql);
		try {
				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error: " + e.getMessage());
			}
	}
	public void actualizar(FormasPago pago)
	{
		String sql="update FormasPago set Nombre=?,Estatus=? where idFormaPago=?";
		try {
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);

			ps.setString(1, pago.getNombre());
			ps.setString(2,pago.getEstatus());
			ps.setInt(3, pago.getIdFormaPago());			
			ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("Error al actualizar "+e.getMessage());
		}
	}

}
