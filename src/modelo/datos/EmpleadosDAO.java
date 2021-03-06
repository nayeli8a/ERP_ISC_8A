package modelo.datos;

import modelo.datos.*;
import modelo.beans.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.http.HttpServletResponse;

import org.apache.el.lang.ELArithmetic;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;

public class EmpleadosDAO {
	
	PreparedStatement ps;
	ResultSet rs;
	
	public List<Empleados> consultar(String pagina)
	
	{
		ArrayList<Empleados> lista = new ArrayList<>();
		String sql = "execute sp_paginaciondinamica 'Empleados','idEmpleado','"+pagina+"','10'";
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Empleados e = new Empleados();
				e.setIdEmpleado(rs.getInt(1));
				e.setNombre(rs.getString(2));
				e.setApaterno(rs.getString(3));
				e.setAmaterno(rs.getString(4));
				e.setSexo(rs.getString(5));
				e.setFechaContratacion(rs.getDate(6));
				e.setFechaNacimiento(rs.getDate(7));
				e.setSalario(rs.getFloat(8));
				e.setNss(rs.getString(9));
				e.setEstadoCivil(rs.getString(10));
				e.setDiasVacaciones(rs.getInt(11));
				e.setDiasPermiso(rs.getInt(12));
				e.setFotografia(rs.getBinaryStream(13));
				e.setDireccion(rs.getString(14));
				e.setColonia(rs.getString(15));
				e.setCodigoPostal(rs.getString(16));
				e.setEscolaridad(rs.getString(17));
				e.setPorcentajeComision(rs.getFloat(18));
				e.setEstatus(rs.getString(19));
				e.setIdDepartamento(rs.getInt(20));
				e.setIdPuesto(rs.getInt(21));
				e.setIdCiudad(rs.getInt(22));
				e.setIdSucursal(rs.getInt(23));
				
				lista.add(e);
			}
		} catch (SQLException e) {
			System.out.println("Error al consultar empleados: " + e.getMessage());
		}
		return lista;
	}
	
	public Empleados consultaIndividual(int idEmpleado)
	{
		String sql = "select * from Empleados where idEmpleado = "+idEmpleado;
		Empleados e = new Empleados();
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				
				e.setIdEmpleado(rs.getInt(1));
				e.setNombre(rs.getString(2));
				e.setApaterno(rs.getString(3));
				e.setAmaterno(rs.getString(4));
				e.setSexo(rs.getString(5));
				e.setFechaContratacion(rs.getDate(6));
				e.setFechaNacimiento(rs.getDate(7));
				e.setSalario(rs.getFloat(8));
				e.setNss(rs.getString(9));
				e.setEstadoCivil(rs.getString(10));
				e.setDiasVacaciones(rs.getInt(11));
				e.setDiasPermiso(rs.getInt(12));
				e.setFotografia(rs.getBinaryStream(13));
				e.setDireccion(rs.getString(14));
				e.setColonia(rs.getString(15));
				e.setCodigoPostal(rs.getString(16));
				e.setEscolaridad(rs.getString(17));
				e.setPorcentajeComision(rs.getFloat(18));
				e.setEstatus(rs.getString(19));
				e.setIdDepartamento(rs.getInt(20));
				e.setIdPuesto(rs.getInt(21));
				e.setIdCiudad(rs.getInt(22));
				e.setIdSucursal(rs.getInt(23));
				
			}
		} catch (SQLException ex) {
			System.out.println("Error al consultar empleados: " + ex.getMessage());
		}
		return e;
	}
	
	public void InsertarHistorial(int idEmpleado, int idPuesto, int idDepartamento, Date fechaInicio, Date fechaFin,
			float salario) 
	{
		String sql = "insert into HistorialPuestos (estatus,idEmpleado,idPuesto,idDepartamento,fechaInicio,fechaFin,salario)"
				+ "values('A','" + idEmpleado + "','" + idPuesto + "','" + idDepartamento + "','" + fechaInicio + "','"
				+ fechaFin + "','" + salario + "')";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al insertar en HistorialPuestos en la BD: " + e.getMessage());
		}
	}

	public void insertar(Empleados e)
	{
		String sql = "insert into empleados (Nombre,Apaterno,Amaterno,"+
		"Sexo,FechaContratacion,FechaNacimiento,Salario,nss,estadocivil,"+
		"diasvacacionales,diaspermiso,fotografia,direccion,colonia,"+
		"codigopostal,escolaridad,porcentajecomision,estatus,"+
		"iddepartamento,idpuesto,idciudad,idsucursal) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps;
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1,e.getNombre());
			ps.setString(2, e.getApaterno());
			ps.setString(3,e.getAmaterno());
			ps.setString(4, e.getSexo());
			ps.setDate(5, e.getFechaContratacion());
			ps.setDate(6, e.getFechaNacimiento());
			ps.setFloat(7, e.getSalario());
			ps.setString(8,e.getNss());
			ps.setString(9,e.getEstadoCivil());
			ps.setInt(10, e.getDiasVacaciones());
			ps.setInt(11, e.getDiasPermiso());
			ps.setBinaryStream(12, e.getFotografia());
			ps.setString(13, e.getDireccion());
			ps.setString(14, e.getColonia());
			ps.setString(15, e.getCodigoPostal());
			ps.setString(16, e.getEscolaridad());
			ps.setFloat(17, e.getPorcentajeComision());
			ps.setString(18, e.getEstatus());
			ps.setInt(19, e.getIdDepartamento());
			ps.setInt(20, e.getIdPuesto());
			ps.setInt(21, e.getIdCiudad());
			ps.setInt(22, e.getIdSucursal());
			ps.executeUpdate();
			
		} catch (SQLException ex) {
			System.out.println("Error al insertar al empleado EMPLEADODAO: "+ex.getMessage());
		}
	}
	
	public void Actualizar(String Nombre, String Apaterno, String Amaterno, String sexo, Date FechaContratacion,
			Date fechaNacimiento, Float Salario, String Nss, String EstadoCivil, int DiasVacaciones, int diasPermiso,
			InputStream Fotografia, String Direccion, String Colonia, String CodigoPostal, String escolaridad, Float PorcentajeC, int idDepartamento,
			int idPuesto, int idCiudad, int idSucursal, int idEmpleado)
	{
		String sql = "UPDATE Empleados SET Nombre=?,Apaterno=?,Amaterno=?,Sexo=?,FechaContratacion=?,"
				+ "FechaNacimiento=?,Salario=?,Nss=?,EstadoCivil=?,diasVacacionales=?,diasPermiso=?,"
				+ "Fotografia=?,Direccion=?,Colonia=?,CodigoPostal=?,Escolaridad=?,"
				+ "PorcentajeComision=?,idDepartamento=?,idPuesto=?,idCiudad=?,idSucursal=? "
				+ "WHERE idEmpleado="+idEmpleado;
		try {
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);

			ps.setString(1, Nombre);
			ps.setString(2,Apaterno);
			ps.setString(3, Amaterno);
			ps.setString(4,sexo);
			ps.setDate(5, FechaContratacion);
			ps.setDate(6, fechaNacimiento);
			ps.setFloat(7, Salario);
			ps.setString(8, Nss);
			ps.setString(9, EstadoCivil);
			ps.setInt(10,DiasVacaciones);
			ps.setInt(11, diasPermiso);
			ps.setBinaryStream(12,Fotografia);
			ps.setString(13, Direccion);
			ps.setString(14, Colonia);
			ps.setString(15, CodigoPostal);
			ps.setString(16, escolaridad);
			ps.setFloat(17,  PorcentajeC);
			ps.setInt(18, idDepartamento);
			ps.setInt(19, idPuesto);
			ps.setInt(20, idCiudad);
			ps.setInt(21, idSucursal);
			
			ps.executeUpdate();
			
		} catch (Exception ex) {
			System.out.println("Error al actualizar al empleado"+ex.getMessage());
		}
	}
	
	public void ActualizarSinImagen(String Nombre, String Apaterno, String Amaterno, String sexo, Date FechaContratacion,
			Date fechaNacimiento, Float Salario, String Nss, String EstadoCivil, int DiasVacaciones, int diasPermiso,
			String Direccion, String Colonia, String CodigoPostal, String escolaridad, Float PorcentajeC, int idDepartamento,
			int idPuesto, int idCiudad, int idSucursal, int idEmpleado)
	{
		String sql = "UPDATE Empleados SET Nombre=?,Apaterno=?,Amaterno=?,Sexo=?,FechaContratacion=?,"
				+ "FechaNacimiento=?,Salario=?,Nss=?,EstadoCivil=?,diasVacacionales=?,diasPermiso=?,"
				+ "Direccion=?,Colonia=?,CodigoPostal=?,Escolaridad=?,"
				+ "PorcentajeComision=?,idDepartamento=?,idPuesto=?,idCiudad=?,idSucursal=? "
				+ "WHERE idEmpleado="+idEmpleado;
		try {
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);

			ps.setString(1, Nombre);
			ps.setString(2,Apaterno);
			ps.setString(3, Amaterno);
			ps.setString(4,sexo);
			ps.setDate(5, FechaContratacion);
			ps.setDate(6, fechaNacimiento);
			ps.setFloat(7, Salario);
			ps.setString(8, Nss);
			ps.setString(9, EstadoCivil);
			ps.setInt(10,DiasVacaciones);
			ps.setInt(11, diasPermiso);
			ps.setString(12, Direccion);
			ps.setString(13, Colonia);
			ps.setString(14, CodigoPostal);
			ps.setString(15, escolaridad);
			ps.setFloat(16,  PorcentajeC);
			ps.setInt(17, idDepartamento);
			ps.setInt(18, idPuesto);
			ps.setInt(19, idCiudad);
			ps.setInt(20, idSucursal);
			ps.executeUpdate();
			
		} catch (Exception ex) {
			System.out.println("Error al actualizar al empleado sin imagen"+ex.getMessage());
		}
	}
	public void Eliminar(int idEmpleado)
	{
		String sql = "execute sp_EliminarLogicamente 'Empleados','"+idEmpleado+"','idEmpleado','Nominas'";
		try {
				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error: " + e.getMessage());
			}
	}
	
	public void ListarImagen(int idEmpleado,HttpServletResponse response)
    {
        String sql = "select * from Empleados where idEmpleado = "+idEmpleado;
        InputStream is = null;
        OutputStream os = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");
        
        try {
			os = response.getOutputStream();
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
	        rs = ps.executeQuery();
	        if(rs.next())
	        {
	        	is = rs.getBinaryStream("fotografia");
	        }
	        bufferedInputStream = new BufferedInputStream(is);
	        bufferedOutputStream = new BufferedOutputStream(os);
	        int i=0;
	        while((i=bufferedInputStream.read()) != -1)
	        {
	        	bufferedOutputStream.write(i);
	        }
		} catch (Exception e) {
			System.out.println("error dentro de PersonaDAO: "+e.getMessage());
		}
    }
	
	public float salarioEmpleado (String nss)
	{
		String sql = "select salario from empleados where nss = '"+nss+"'";
		float salario = 0;
		
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				salario = rs.getFloat(1);
			}
		} catch (Exception e) {
			System.out.println("Error al obtener el salario del empleado: " + e.getMessage());
		}
		return salario;
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
	
}
