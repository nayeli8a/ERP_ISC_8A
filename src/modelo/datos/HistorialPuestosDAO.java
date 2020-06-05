package modelo.datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.beans.*;

public class HistorialPuestosDAO{



  public List<Empleados> Consultar(String pagina)
	{
		ArrayList<Empleados> lista = new ArrayList<>();
		String sql = "execute sp_paginaciondinamica 'Empleados','idEmpleado','"+pagina+"','5'";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Empleados e = new Empleados();
				e.setNombre(rs.getString("nombre")+" "+rs.getString("apaterno")+" "+rs.getString("amaterno"));
				String sql2="select * from Historialpuestos_puesto where idEmpleado = "+rs.getInt(1);
				ps = Conexion.getInstance().getCN().prepareStatement(sql2);
				ps = Conexion.getInstance().getCN().prepareStatement(sql2);
				ResultSet rs2 = ps.executeQuery();
				
				ArrayList<HistorialPuestos> listahp = new ArrayList<>();
				
				while(rs2.next())
				{
					HistorialPuestos hp = new HistorialPuestos();
					hp.setIdEmpleado(rs2.getInt(1));
					hp.setIdPuesto(rs2.getInt(2));
					hp.setIdDepartamento(rs2.getInt(3));
					hp.setFechaInicio(rs2.getDate(4));
					hp.setFechaFin(rs2.getDate(5));
					hp.setSalario(rs2.getFloat(6));
					hp.setEstatus(rs2.getString(7));
					hp.setNombrepuesto(rs2.getString(8));
					listahp.add(hp);
				}
				
				e.setPuestos(listahp);
				lista.add(e);
			}
			
			
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
		return lista;
		
		
	}


  public void Eliminar(int idPuesto)
	{
		String sql = "execute sp_EliminarLogicamente 'HistorialPuestos','"+idPuesto+"','idEmpleado','Empleados'";
		try {
				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error al eliminar HistorialPuestos: " + e.getMessage());
			}
	}
  
  public void Insertar(HistorialPuestos hp)
  {
	  String sql = "insert into HistorialPuestos values (?,?,?,?,?,(select salario from Empleados where idEmpleado = ?),'A')";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setInt(1,hp.getIdEmpleado());
			ps.setInt(2,hp.getIdPuesto());
			ps.setInt(3,hp.getIdDepartamento());
			ps.setDate(4,hp.getFechaInicio());
			ps.setDate(5,hp.getFechaFin());
			ps.setInt(6,hp.getIdEmpleado());
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al insertar en HistorialPuestos en la BD: " + e.getMessage());
		}
  }


}
