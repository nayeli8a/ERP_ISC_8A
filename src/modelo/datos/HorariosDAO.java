package modelo.datos;

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
		String sql = "execute sp_EliminarLogicamente 'Horarios','"+id+"','idHorario','Empleados'";
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

			ps.setInt(5, h.getIdHorario());
			ps.setString(1,h.getHoraInicio());
			ps.setString(2,h.getHoraFin());
			ps.setString(3, h.getDias());
			ps.setString(4, h.getEstatus());
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println("Error al actualizar el horario: "+e.getMessage());
		}
	}

  public int validarNSSEmpleado(String nssempleado) {
		int idEmpleado=-1;
		String sql="IF(Exists(select idEmpleado from Empleados where nss = ? and estatus = 'A'))"+
					"	select idEmpleado from Empleados where nss = ?;"+
					"ELSE"+
					"	select -1;";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1, nssempleado);
			ps.setString(2, nssempleado);
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
		String sql = "execute sp_paginaciondinamica 'Horarios_empleados','idEmpleado','"+pagina+"','5'";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Horarios h = new Horarios();
				h.setIdHorario(rs.getInt(1));
				h.setHoraInicio(rs.getString(2));
				h.setHoraFin(rs.getString(3));
				h.setDias(rs.getString(4));
				h.setIdEmpleado(rs.getInt(5));
				h.setNss(rs.getString(6));
				h.setNombreEmpleado(rs.getString(7));
				h.setEstatus(rs.getString(8));
			

				lista.add(h);
			}
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
		return lista;
	}


  public Horarios consultaIndividual(int idHorario){
		String sql="select * from Horarios_empleados where idHorario=?";
		Horarios h = new Horarios();
		try{
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setInt(1, idHorario);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				h.setIdHorario(rs.getInt("idhorario"));
				h.setHoraInicio(rs.getString("horaInicio"));
				h.setHoraFin(rs.getString("horaFin"));
				h.setDias(rs.getString("dias"));
				h.setIdEmpleado(rs.getInt("idempleado"));
				h.setNss(rs.getString("nss"));
				h.setNombreEmpleado(rs.getString("nombreEmpleado"));
				h.setEstatus(rs.getString("estatus"));

			}
			ps.close();
			rs.close();
		}
		catch(SQLException e){
			System.out.println("Error Horarios DAO:"+e.getMessage());
		}
		return h;
	}
  
  public List<Horarios> consultaIndividual(String idEmpleado){
	  	ArrayList<Horarios> lista = new ArrayList<>();
	  	String sql="select * from Horarios where idEmpleado=?";
		try{
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setInt(1,Integer.parseInt(idEmpleado));
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Horarios h = new Horarios();
				h.setIdHorario(rs.getInt("idHorario"));
				h.setHoraInicio(rs.getString("horaInicio"));
				h.setHoraFin(rs.getString("horaFin"));
				h.setDias(rs.getString("dias"));
				h.setEstatus(rs.getString("estatus"));
				h.setIdEmpleado(rs.getInt("idEmpleado"));
				lista.add(h);
			}
			ps.close();
			rs.close();
		}
		catch(SQLException e){
			System.out.println("Error HorariosDAO:"+e.getMessage());
		}
		return lista;
	}

}
