package modelo.datos;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.beans.*;

public class HistorialPuestosDAO{

  public void Insertar(int idEmpleado,int idPuesto, int idDepartamento,
                        Date fechaInicio, Date fechaFin, float salario)
  {
    String sql = "insert into HistorialPuestos (estatus,idEmpleado,idPuesto,idDepartamento,fechaInicio,fechaFin,salario)"
        + "values('A','"+idEmpleado+"','"+idPuesto+"','"+idDepartamento+"','"+fechaInicio+"','"+fechaFin+"','"+salario+"')";
      try {
        PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
        ps = Conexion.getInstance().getCN().prepareStatement(sql);
        ps.executeUpdate();
      } catch (Exception e) {
        System.out.println("Error al insertar en HistorialPuestos en la BD: "+e.getMessage());
      }
  }

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


  public HistorialPuestos ConsultaIndividual(int idEmpleado)
	{
		String sql = "select * from HistorialPuestos where idPuesto = "+idPuesto;
		HistorialPuestosDAO n = new HistorialPuestos();
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
        hp.setIdEmpleado(rs.getInt(1));
				hp.setIdPuesto(rs.getInt(2));
				hp.setIdDepartamento(rs.getInt(3));
				hp.setFechaInicio(rs.getDate(4));
        hp.setFechaFin(rs.getDate(5));
        hp.setSalario(rs.getFloat(6));
        hp.setEstatus(rs.getString(7));
			}
		} catch (SQLException e) {
			System.out.println("Error al consultar individual HistorialPuestos: " + e.getMessage());
		}
		return hp;
	}

  public void Eliminar(int idPuesto)
	{
		String sql = "execute sp_EliminarLogicamente 'HistorialPuestos','"+idEmpleado+"','idEmpleado'";
		try {
				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error al eliminar HistorialPuestos: " + e.getMessage());
			}
	}

  public void Actualizar(HistorialPuestos hp)
	{
		String sql="update HistorialPuestos set idEmpleado=?,idPuesto=?,idDepartamento=?,fechaInicio=?, fechaFin=?, salario=?, Estatus=? where idEmpleado=?";
		try {
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);

			ps.setInt(1, hp.getIdEmpleado());
      ps.setInt(2, hp.getIdPuesto());
      ps.setInt(3, hp.getIdDepartamento());
      ps.setDate(4, hp.getFechaInicio());
      ps.setDate(5, hp.getFechaFin());
      ps.setFloat(6, hp.getSalario());
      ps.setString(7, hp.getEstatus());

			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println("Error al actualizar HistorialPuestos: "+e.getMessage());
		}
	}
}
