package modelo.datos;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.beans.Horarios;

public class HorariosDAO {


  public void insertarHorarios(Date horaInicio, Date horaFin, String dias, String estatus)
  {
	  String sql = "insert into Horarios (horaInicio,horaFin,dias,estatus) values('"+horaInicio+"','"+horaFin+"','"+dias+"','"+estatus+"')";
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
			ps.setInt(5, h.getDias());
			ps.setInt(6,h.getIdEmpleado());
			ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("Error al actualizar el horario"+e.getMessage());
		}
	}
  
}
