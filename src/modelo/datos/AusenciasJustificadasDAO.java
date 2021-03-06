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
		String sql = "execute sp_paginaciondinamica 'Ausencia_empleados','tipo','"+pagina+"','5'";
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
				ausJus.setEstatus(rs.getString(6));
				ausJus.setEstatusAusencia(rs.getString(7));
				ausJus.setDiasDescanso(rs.getInt(8));
				ausJus.setNssAusente(rs.getString(9));
				ausJus.setNombreAusente(rs.getString(10));
				ausJus.setNssJefe(rs.getString(11));
				ausJus.setNombreJefe(rs.getString(12));

				lista.add(ausJus);
				
			
			}
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
		return lista;
	}

  public AusenciasJustificadas consultaIndividual(int idAusencia){
		String sql="select * from Ausencia_empleados where idAusencia=?";
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
				ausJus.setEstatus(rs.getString("estatus"));
				ausJus.setEstatusAusencia(rs.getString("estatusAusencia"));
				ausJus.setDiasDescanso(rs.getInt("diasDescanso"));
				ausJus.setNssAusente(rs.getString("nssAusente"));
				ausJus.setNombreAusente(rs.getString("nombreAusente"));
				ausJus.setNssJefe(rs.getString("nssJefe"));
				ausJus.setNombreJefe(rs.getString("nombreJefe"));
			
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
		String sql = "execute sp_EliminarLogicamente 'AusenciaJustificada','"+id+"','idAusencia','Empleados'";
		System.out.println(sql);
		try {
				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error: " + e.getMessage());
			}
	}

  public void actualizar(Date FechaSolicitud, Date FechaInicio, Date FechaFin,  String Tipo, int idAusencia)
	{
		String sql="update AusenciaJustificada set FechaSolicitud=?,FechaInicio=?,FechaFin=?,Tipo=? where idAusencia=?";
		try {
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);

			ps.setDate(1,FechaSolicitud);
			ps.setDate(2, FechaInicio);
			ps.setDate(3,FechaFin);
			ps.setString(4,Tipo);
			ps.setInt(5, idAusencia);
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println("Error al actualizar la AusenciaJustificada"+e.getMessage());
		}
	}
  
  public void actualizarIndividual(int idAusencia,String status)
  {
	  if(status.equals("A"))
	  {
		//buscamos los dias de descanso a restar
		  String aux = "select DiasDescanso,tipo,nssAusente from Ausencia_empleados where idAusencia = ? ";
		  int diasDescanso=0;
		  String tipo="";
		  String nssausente="";
		  try{
			  	PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(aux);
				ps.setInt(1, idAusencia);
				ResultSet rs=ps.executeQuery();
				if(rs.next()){
					diasDescanso = rs.getInt(1);
					tipo = rs.getString(2);
					nssausente = rs.getString(3);
				}
				
				//buscamos al empleado con el nssausente y le restamos los dias segun tipo
				if(tipo.equals("V"))
				{
					aux = "update Empleados set diasVacacionales = diasVacacionales-? where nss = ?";
					ps = Conexion.getInstance().getCN().prepareStatement(aux);
					ps.setInt(1,diasDescanso);
					ps.setString(2, nssausente);
					ps.executeUpdate();
					ps.close();
				}else if(tipo.equals("P"))
				{
					aux = "update Empleados set diasPermiso = diasPermiso-? where nss = ?";
					ps = Conexion.getInstance().getCN().prepareStatement(aux);
					ps.setInt(1,diasDescanso);
					ps.setString(2, nssausente);
					ps.executeUpdate();
					ps.close();
				}
				
				String sql = "update AusenciaJustificada set estatusAusencia=? where idAusencia=?";
				  try {
						ps = Conexion.getInstance().getCN().prepareStatement(sql);
						ps.setString(1,status);
						ps.setInt(2,idAusencia);
						ps.executeUpdate();
					} catch (Exception e) {
						System.out.println("Error al actualizar la el estatusAusencia "+e.getMessage());
					}
				
				
		  } catch(Exception e)
		  {
			  System.out.println("Error al actualizar la AusenciaJustificadaIndividual "+e.getMessage());
		  }
		  
		  
	  }else if(status.equals("R"))
	  {
		  String sql = "update AusenciaJustificada set estatusAusencia=? where idAusencia=?";
		  try {
				PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);
				ps.setString(1,status);
				ps.setInt(2,idAusencia);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error al actualizar la AusenciaJustificadaIndividual "+e.getMessage());
			}
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
