package modelo.datos;



import java.io.InputStream;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.beans.Empleados;
import modelo.beans.Incapacidades;


public class IncapacidadesDAO {
	
	
	public void insertarIncapacidades(Incapacidades in)
	{
		String sql = "insert into Incapacidades (fechaInicio, fechaFin, enfermedad, evidencia, idEmpleado, estatus,) values (?,?,?,?,?,?)";
		PreparedStatement ps;
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setDate(1,in.getFechaInicio());
			ps.setDate(2, in.getFechaFin());
			ps.setString(3,in.getEnfermedad());
			ps.setBinaryStream(4, in.getEvidencia());
			ps.setInt(5, in.getIdEmpleado());
			ps.setString(6, in.getEstatus());
		
			ps.executeUpdate();
			
		} catch (SQLException ex) {
			System.out.println("Error al insertar la incapacidad en INDAO: "+ex.getMessage());
		}
	}
	public List<Incapacidades> consultar(String pagina)
	{
		ArrayList<Incapacidades> lista = new ArrayList<>();
		String sql = "execute sp_paginaciondinamica 'Incapacidades','enfermedad','"+pagina+"','5'";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Incapacidades in = new Incapacidades();
				in.setIdIncapacidad(rs.getInt(1));
				in.setFechaInicio(rs.getDate(2));
				in.setFechaFin(rs.getDate(3));
				in.setEnfermedad(rs.getString(4));
				in.setEvidencia(rs.getBinaryStream(5));
				in.setIdEmpleado(rs.getInt(6));
				in.setEstatus(rs.getNString(7));
				lista.add(in);
			}
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
		return lista;
	}

	public Incapacidades consultaIndividual(int idIncapacidad){
		String sql="select * from Incapacidades where idIncapacidad=?";
		Incapacidades in = new Incapacidades();
		try{
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setInt(1, idIncapacidad);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				in.setIdIncapacidad(rs.getInt("idIncapacidad"));
				in.setFechaInicio(rs.getDate("fechaInicio"));
				in.setFechaFin(rs.getDate("fechaFin"));
				in.setEnfermedad(rs.getString("enfermedad"));
				in.setEvidencia(rs.getBinaryStream("evidencia"));
				in.setIdEmpleado(rs.getInt("idEmpelado"));
				in.setEstatus(rs.getString("estatus"));
			}
			ps.close();
			rs.close();
		}
		catch(SQLException e){
			System.out.println("Error Incapacidades DAO:"+e.getMessage());
		}
		return in;
	}
	
	public void eliminar(String id){
		String sql = "execute sp_EliminarLogicamente 'Incapacidades','"+id+"','idIncapacidades'";
		System.out.println(sql);
		try {
				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error: " + e.getMessage());
			}
	}
	public void actualizar(Incapacidades in)
	{
		String sql="update Incapacidades set FechaInicio=?,FechaFin=?,Enfermedad=?, Evidencia=?, idEmpleado=?, Estatus=? where idIncapacidad=?";
		try {
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);

			ps.setDate(1, in.getFechaInicio());
			ps.setDate(2,in.getFechaFin());
			ps.setString(3,in.getEnfermedad());
			ps.setBinaryStream(4, in.getEvidencia());	
			ps.setInt(5, in.getIdEmpleado());
			ps.setString(6,in.getEstatus());
			ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("Error al actualizar la incapacidad"+e.getMessage());
		}
	}

}