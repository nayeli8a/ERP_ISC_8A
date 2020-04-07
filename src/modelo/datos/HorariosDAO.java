package modelo.datos;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import modelo.beans.Horarios;
import modelo.beans.Empleados;

public class HorariosDAO {


  public void insertarHorarios(int idEmpleado, String horaInicio, String horaFin, String dias, String estatus)
  {
	  String sql = "insert into Horarios (idEmpleado,horaInicio,horaFin,dias,estatus) values("+idEmpleado+",'"+horaInicio+"','"+horaFin+"','"+dias+"','"+estatus+"')";
    try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al insertar el Estado en la BD: "+e.getMessage());
		}
  }

  public void eliminar(String id){
		String sql = "execute sp_EliminarLogicamente 'Horarios','"+id+"','idHorario'";
		System.out.println(sql);
		try {
				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error: " + e.getMessage());
			}
	}

  public void actualizar(Horarios h)
	{
		String sql="update Horarios set horaInicio=?,horaFin=?,dias=?, Estatus=? where idHorario=?";
		try {
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);

			ps.setInt(1, h.getIdHorario());
			ps.setDate(2,h.getHoraInicio());
			ps.setDate(3,h.getHoraFin());
			ps.setString(4, h.getEstatus());
			ps.setString(5, h.getDias());
			ps.setInt(6,h.getIdEmpleado());
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println("Error al actualizar el horario"+e.getMessage());
		}
	}

  public int validarNSSEmpleado(String nssempleado) {
		int idEmpleado=-1;
		String sql = "SELECT idEmpleado FROM Empleados WHERE nss=?";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1, nssempleado);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				//si encuentra el nombre de un empleado, si existe el empleado
				idEmpleado = rs.getInt(1) ;
			}
			rs.close();
			ps.close();

		} catch (SQLException e) {
			System.out.println("Error al conectar con la BD " + e.getMessage());
		}
		return idEmpleado;
	}

  public List<Horarios> consultar(String pagina)
	{
		ArrayList<Horarios> lista = new ArrayList<>();
		String sql = "execute sp_paginaciondinamica 'Horarios','idEmpleado','"+pagina+"','10'";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Horarios h = new Horarios();
				h.setIdHorario(rs.getInt(1));
				h.setHoraInicio(rs.getDate(2));
				h.setHoraFin(rs.getDate(3));
				h.setDias(rs.getString(4));
				h.setIdEmpleado(rs.getInt(5));
				lista.add(h);
			}
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
		return lista;
	}


  public Horarios consultaIndividual(int idHorario){
		String sql="select * from Horarios where idHorario=?";
		Horarios h = new Horarios();
		try{
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setInt(1, idHorario);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				h.setIdHorario(rs.getInt("idHorario"));
				h.setHoraInicio(rs.getDate("horaInicio"));
				h.setHoraFin(rs.getDate("horaFin"));
				h.setDias(rs.getString("dias"));
				h.setEstatus(rs.getString("estatus"));
				h.setIdEmpleado(rs.getInt("idEmpleado"));
			}
			ps.close();
			rs.close();
		}
		catch(SQLException e){
			System.out.println("Error ESDAO:"+e.getMessage());
		}
		return h;
	}

}
