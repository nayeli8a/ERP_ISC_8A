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
		String sql = "execute sp_paginaciondinamica 'Empleados','idEmpleado','"+pagina+"','10'";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Empleados e = new Empleados();
				e.setNombre(rs.getString("nombre")+" "+rs.getString("apaterno")+" "+rs.getString("amaterno"));
				String sql2="select * from HistorialPuestos where idEmpledo = "+rs.getInt(1);
				ps = Conexion.getInstance().getCN().prepareStatement(sql2);
				ps = Conexion.getInstance().getCN().prepareStatement(sql2);
				ResultSet rs2 = ps.executeQuery();
				
				ArrayList<HistorialPuestos> listahp = new ArrayList<>();
				
				while(rs2.next())
				{
					HistorialPuestos hp = new HistorialPuestos();
					hp.setIdEmpleado(rs.getInt(1));
					hp.setIdPuesto(rs.getInt(2));
					hp.setIdDepartamento(rs.getInt(3));
					hp.setFechaInicio(rs.getDate(4));
					hp.setFechaFin(rs.getDate(5));
					hp.setSalario(rs.getFloat(6));
					hp.setEstatus(rs.getString(7));
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
		String sql = "execute sp_EliminarLogicamente 'HistorialPuestos','"+idPuesto+"','idEmpleado'";
		try {
				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error al eliminar HistorialPuestos: " + e.getMessage());
			}
	}


}
