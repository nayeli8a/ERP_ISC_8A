package modelo.datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.beans.*;

public class HistorialPuestosDAO{



  public List<HistorialPuestos> Consultar(String pagina)
	{
		ArrayList<HistorialPuestos> lista = new ArrayList<>();
		String sql = "execute sp_paginaciondinamica 'HistorialPuestos','idPuesto','"+pagina+"','10'";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				HistorialPuestos hp = new HistorialPuestos();
				hp.setIdEmpleado(rs.getInt(1));
				hp.setIdPuesto(rs.getInt(2));
				hp.setIdDepartamento(rs.getInt(3));
				hp.setFechaInicio(rs.getDate(4));
				hp.setFechaFin(rs.getDate(5));
				hp.setSalario(rs.getFloat(6));
				hp.setEstatus(rs.getString(7));
				lista.add(hp);
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
