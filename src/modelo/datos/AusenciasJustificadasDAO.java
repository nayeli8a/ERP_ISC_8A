package modelo.datos;



import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.beans.AusenciasJustificadas;

public class AusenciasJustificadasDAO {
	
	  public int validarVacaciones(int idEmpleado) {
			int vacaciones = 0;
			String sql = "SELECT diasVacacionales FROM Empleados WHERE idEmpleado=?";
			try {
				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.setInt(1, idEmpleado);
				ResultSet rs = ps.executeQuery();

				if (rs.next()) {
					//si encuentra el nombre de un empleado, si existe el empleado
					vacaciones = rs.getInt(1) ;
				}
				rs.close();
				ps.close();

			} catch (SQLException e) {
				System.out.println("Error al conectar con la BD " + e.getMessage());
			}
			return vacaciones;
		}

	  public int validarPermiso(int idEmpleado) {
			int permiso = 0;
			String sql = "SELECT diasPermiso FROM Empleados WHERE idEmpleado=?";
			try {
				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.setInt(1, idEmpleado);
				ResultSet rs = ps.executeQuery();

				if (rs.next()) {
					//si encuentra el nombre de un empleado, si existe el empleado
					permiso = rs.getInt(1) ;
				}
				rs.close();
				ps.close();

			} catch (SQLException e) {
				System.out.println("Error al conectar con la BD " + e.getMessage());
			}
			return permiso;
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

  public int validarNombre(String nss ) {
		int idEmpleado=-1;
		String sql = "SELECT idEmpleado FROM Empleados WHERE nss = ?";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1, nss);

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


  public void insertarAusenciasJustificadas(Date fechaInicio, Date fechaFin, String tipo, int idEmpleadoS, int idEmpleadoA )
	{

		String sql = "execute sp_Agregar_Ausencia_Justificada '"+fechaInicio+"','"+fechaFin+"','"+tipo+"','"+idEmpleadoS+"', '"+idEmpleadoA+"'";
		PreparedStatement ps;
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();

		} catch (SQLException ex) {
			System.out.println("Error al insertar la AusenciasJustificadas en AusenciasJustificadasDAO: "+ex.getMessage());
		}
	}

  public List<AusenciasJustificadas> consultar(String pagina)
	{
		ArrayList<AusenciasJustificadas> lista = new ArrayList<>();
		String sql = "execute sp_paginaciondinamica 'AusenciaJustificada','tipo','"+pagina+"','5'";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				AusenciasJustificadas ausJus = new AusenciasJustificadas();
				ausJus.setIdAusencia(rs.getInt(1));
				ausJus.setFechaSolicitud(rs.getDate(2));
				ausJus.setFechaInicio(rs.getDate(3));
				ausJus.setFechaFin(rs.getDate(4));
				ausJus.setTipo(rs.getString(5));
				ausJus.setIdEmpleadoS(rs.getInt(6));
				ausJus.setIdEmpleadoA(rs.getInt(7));
				ausJus.setEstatus(rs.getString(8));
				lista.add(ausJus);
			}
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
		return lista;
	}

  public AusenciasJustificadas consultaIndividual(int idAusencia){
		String sql="select * from AusenciaJustificada where idAusencia=?";
		AusenciasJustificadas ausJus = new AusenciasJustificadas();
		try{
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setInt(1, idAusencia);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				ausJus.setIdAusencia(rs.getInt("idAusencia"));
				ausJus.setFechaSolicitud(rs.getDate("fechaSolicitud"));
				ausJus.setFechaInicio(rs.getDate("fechaInicio"));
				ausJus.setFechaFin(rs.getDate("fechaFin"));
				ausJus.setTipo(rs.getString("tipo"));
				ausJus.setIdEmpleadoS(rs.getInt("idEmpleadoS"));
				ausJus.setIdEmpleadoA(rs.getInt("idEmpleadoA"));
				ausJus.setEstatus(rs.getString("estatus"));
			}
			ps.close();
			rs.close();
		}
		catch(SQLException e){
			System.out.println("Error AusenciasJustificadas DAO:"+e.getMessage());
		}
		return ausJus;
	}


  public void eliminar(String id){
		String sql = "execute sp_EliminarLogicamente 'AusenciaJustificada','"+id+"','idAusencia'";
		System.out.println(sql);
		try {
				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error: " + e.getMessage());
			}
	}

  public void actualizar(AusenciasJustificadas ausJus)
	{
		String sql="update AusenciaJustificada set FechaSolicitud=?,FechaInicio=?,FechaFin=?,Tipo=?, idEmpleadoS=?, idEmpleadoA=?, Estatus=? where idAusencia=?";
		try {
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);

			ps.setDate(1, ausJus.getFechaSolicitud());
      ps.setDate(2, ausJus.getFechaInicio());
			ps.setDate(3,ausJus.getFechaFin());
			ps.setString(4,ausJus.getTipo());
			ps.setInt(5, ausJus.getIdEmpleadoS());
			ps.setInt(5, ausJus.getIdEmpleadoA());
			ps.setString(6,ausJus.getEstatus());
			ps.setInt(7, ausJus.getIdAusencia());
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println("Error al actualizar la AusenciaJustificada"+e.getMessage());
		}
	}
  
  	public List<String> nssEmpleado(String nombre,String apaterno,String amaterno)
  	{
  		String sql = "select nss from Empleados where nombre like '%"+nombre+"%' "
  				+ "and apaterno like '%"+apaterno+"%' and amaterno like '%"+amaterno+"%'";
  		ArrayList<String> lista = new ArrayList<>();
  		
  		try {
  			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				lista.add(rs.getString(1));
			}
			ps.close();
			rs.close();
		} catch (Exception e) {
			System.out.println("Error al obtener el nss del empleado AusenciaJustificada: "+e.getMessage());
		}
  		return lista;
  	}


}
