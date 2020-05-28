package modelo.datos;



import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import modelo.beans.Incapacidades;


public class IncapacidadesDAO {
	  
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

	  
	
	  public void insertarIncapacidades(InputStream documento, Date fechaInicio, Date fechaFin, String enfermedad, int idEmpleado, String estatus)
	  {
		  String sql = "insert into Incapacidades values('"+fechaInicio+"','"+fechaFin+"','"+enfermedad+"',?,"+idEmpleado+",'"+estatus+"')";
	    try {
				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.setBlob(1, documento);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error al insertar la incapacidad en la BD: "+e.getMessage());
			}
	  }
	
	public List<Incapacidades> consultar(String pagina)
	{
		ArrayList<Incapacidades> lista = new ArrayList<>();
		String sql = "execute sp_paginaciondinamica 'Incapacidades_empleados','idIncapacidad','"+pagina+"','10'";
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
				in.setNss(rs.getString(7));
				in.setNombre(rs.getString(8));
				in.setApaterno(rs.getString(9));
				in.setAmaterno(rs.getString(10));
				in.setEstatus(rs.getString(11));
			
				lista.add(in);
				
			
			}
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
		return lista;
	}

	public Incapacidades consultaIndividual(int idIncapacidad){
		String sql="select * from  Incapacidades_empleados where idIncapacidad=?";
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
				in.setIdEmpleado(rs.getInt("idEmpleado"));
				in.setNss(rs.getString("nss"));
				in.setNombre(rs.getString("nombre"));
				in.setAmaterno(rs.getString("amaterno"));
				in.setApaterno(rs.getString("apaterno"));
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
		String sql = "execute sp_EliminarLogicamente 'Incapacidades','"+id+"','idIncapacidad'";
		System.out.println(sql);
		try {
				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error: " + e.getMessage());
			}
	}
	public void actualizar(Incapacidades incapacidad)
	{
		String sql="update Incapacidades set FechaInicio=?,FechaFin=?,Enfermedad=?, Evidencia=?, idEmpleado=?, Estatus=? where idIncapacidad=?";
		try {
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);
	
			ps.setDate(1, incapacidad.getFechaInicio());
			ps.setDate(2,incapacidad.getFechaFin());
			ps.setString(3,incapacidad.getEnfermedad());
			ps.setBinaryStream(4, incapacidad.getEvidencia());	
			ps.setInt(5, incapacidad.getIdEmpleado());
			ps.setString(6,incapacidad.getEstatus());
			ps.setInt(7,incapacidad.getIdIncapacidad());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("Error al actualizar la incapacidad"+e.getMessage());
		}
	}
	
    public void ListarPDF(int idIncapacidad, HttpServletResponse response)
    {
    	String sql = "select * from Incapacidades where idIncapacidad = "+idIncapacidad;
        InputStream is = null;
        OutputStream os = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");
        
        try {
			os = response.getOutputStream();
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();
	        if(rs.next())
	        {
	        	is = rs.getBinaryStream(5);
	        }
	        bufferedInputStream = new BufferedInputStream(is);
	        bufferedOutputStream = new BufferedOutputStream(os);
	        int i=0;
	        while((i=bufferedInputStream.read()) != -1)
	        {
	        	bufferedOutputStream.write(i);
	        }
		} catch (Exception e) {
			System.out.println("error dentro de IncapacidadesDAO: "+e.getMessage());
		}
    }
	
	}

