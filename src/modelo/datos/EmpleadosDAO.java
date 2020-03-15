package modelo.datos;

import modelo.datos.*;
import modelo.beans.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import org.apache.el.lang.ELArithmetic;

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
}
