package modelo.datos;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.beans.*;

public class NominasDAO {
	
	public void Insertar(Date fechaPago,float totalP,
			float totalD,float cantidadNeta,int diasTrabajados,
			int faltas,Date fechaInicio,Date fechaFin,int idEmpleado,
			int idFormaPago)
	{
		String sql = "insert into Nominas (EstatusNomina,estatus,fechaPago,totalP,totalD,cantidadNeta,diasTrabajados,faltas,fechaInicio,fechaFin,idEmpleado,idFormaPago)"
				+ "values('C','A','"+fechaPago+"','"+totalP+"','"+totalD+"','"+cantidadNeta+"','"+diasTrabajados+"','"+faltas+"','"+fechaInicio+"','"+fechaFin+"','"+idEmpleado+"','"+idFormaPago+"')";
	    try {
				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error al insertar la Nomina en la BD: "+e.getMessage());
			}
	}
	
	public List<Nominas> Consultar(String pagina)
	{
		ArrayList<Nominas> lista = new ArrayList<>();
		String aux = "execute sp_actualizar_nomina";
		String sql = "execute sp_paginaciondinamica 'Nominas_empleados','fechaPago','"+pagina+"','10'";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(aux);
			ps = Conexion.getInstance().getCN().prepareStatement(aux);
			ps.execute();
			
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Nominas n = new Nominas();
				n.setIdNomina(rs.getInt(1));
				n.setFechaPago(rs.getDate(2));
				n.setTotalP(rs.getFloat(3));
				n.setTotalD(rs.getFloat(4));
				n.setCantidadNeta(rs.getFloat(5));
				n.setDiasTrabajados(rs.getInt(6));
				n.setFaltas(rs.getInt(7));
				n.setFechaInicio(rs.getDate(8));
				n.setFechaFin(rs.getDate(9));
				n.setIdEmpleado(rs.getInt(10));
				n.setFormaPago(rs.getString(11));
				n.setEstatus(rs.getString(12));
				n.setNss(rs.getString(13));
				n.setNombreEmpleado(rs.getString(14));
				n.setApaterno(rs.getString(15));
				n.setAmaterno(rs.getString(16));
				n.setEstatusNomina(rs.getString(17));
				lista.add(n);
			}
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
		return lista;
	}
	
	public List<Nominas> Consultar()
	{
		ArrayList<Nominas> lista = new ArrayList<>();
		String aux = "execute sp_actualizar_nomina";
		String sql = "select * from Nominas_empleados";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(aux);
			ps = Conexion.getInstance().getCN().prepareStatement(aux);
			ps.execute();
			
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Nominas n = new Nominas();
				n.setIdNomina(rs.getInt(1));
				n.setFechaPago(rs.getDate(2));
				n.setTotalP(rs.getFloat(3));
				n.setTotalD(rs.getFloat(4));
				n.setCantidadNeta(rs.getFloat(5));
				n.setDiasTrabajados(rs.getInt(6));
				n.setFaltas(rs.getInt(7));
				n.setFechaInicio(rs.getDate(8));
				n.setFechaFin(rs.getDate(9));
				n.setIdEmpleado(rs.getInt(10));
				n.setFormaPago(rs.getString(11));
				n.setEstatus(rs.getString(12));
				n.setNss(rs.getString(13));
				n.setNombreEmpleado(rs.getString(14));
				n.setApaterno(rs.getString(15));
				n.setAmaterno(rs.getString(16));
				n.setEstatusNomina(rs.getString(17));
				lista.add(n);
			}
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
		return lista;
	}
	
	
	public Nominas ConsultaIndividual(String idNomina)
	{
		String sql = "select * from Nominas_empleados where idNomina = "+idNomina;
		Nominas n = new Nominas();
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				n.setIdEmpleado(rs.getInt(10));
				n.setIdNomina(rs.getInt(1));
				n.setFechaPago(rs.getDate(2));
				n.setTotalP(rs.getFloat(3));
				n.setTotalD(rs.getFloat(4));
				n.setCantidadNeta(rs.getFloat(5));
				n.setDiasTrabajados(rs.getInt(6));
				n.setFaltas(rs.getInt(7));
				n.setFechaInicio(rs.getDate(8));
				n.setFechaFin(rs.getDate(9));
				n.setFormaPago(rs.getString(11));
				n.setEstatus(rs.getString(12));
				n.setNss(rs.getString(13));
				n.setNombreEmpleado(rs.getString(14));
				n.setApaterno(rs.getString(15));
				n.setAmaterno(rs.getString(16));
				n.setEstatusNomina(rs.getString(17));
			}
		} catch (SQLException e) {
			System.out.println("Error al consultar individual nomina: " + e.getMessage());
		}
		return n;
	}
	
	public void Eliminar(int idNomina)
	{
		String sql = "execute sp_EliminarLogicamente 'Nominas','"+idNomina+"','idNomina','Empleados'";
		try {
				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error al eliminar Nomina: " + e.getMessage());
			}
	}
	
	public void Actualizar(Nominas nom)
	{
		String sql="update Nominas set fechaPago=?,totalP=?,totalD=?,cantidadNeta=?,diasTrabajados=?,"
				+ "faltas=?,fechaInicio=?,fechaFin=?,idEmpleado=?,idFormaPago=?,estatus=?,EstatusNomina='C' where idNomina = "+nom.getIdNomina();
		try {
			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);

			ps.setDate(1, nom.getFechaPago());
			ps.setFloat(2, nom.getTotalP());
			ps.setFloat(3, nom.getTotalD());
			ps.setFloat(4, nom.getCantidadNeta());
			ps.setInt(5, nom.getDiasTrabajados());
			ps.setInt(6, nom.getFaltas());
			ps.setDate(7, nom.getFechaInicio());
			ps.setDate(8, nom.getFechaFin());
			ps.setInt(9, nom.getIdEmpleado());
			ps.setInt(10, nom.getIdFormaPago());
			ps.setString(11, nom.getEstatus());
			
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println("Error al actualizar la nomina: "+e.getMessage());
		}
	}
	
	public int NominaEmpleado(int idEmpleado)
	{
		String sql = "select idNomina from Nominas where idEmpleado = "+idEmpleado;
		int idNomina = -1;
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				idNomina = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("Error al consultar la nomina de un empleado: " + e.getMessage());
		}
		return idNomina;
	}
	
	public float SalarioEmpleado(String nss)
	{
		String sql = "select salario from Empleados where nss = ?";
		float salario=0;
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setString(1,nss);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				salario = rs.getFloat(1);
			}
		} catch (Exception e) {
			System.out.println("Error al obtener el salario del empleado con nss: " + e.getMessage());
		}
		return salario;
	}
	
	public void PagarNomina(int idNomina)
	{
		String sql = "update Nominas set EstatusNomina = 'P' where idNomina = "+idNomina;
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al pagar la nomina: " + e.getMessage());
		}
		
	}
	
	public List<NominasPercepciones> obtenerconceptosp(int idnomina)
	{
		String sqlp = "select p.nombre,np.importe from NominasPercepciones np join Percepciones p "+ 
				      "on p.idPercepcion = np.idPercepcion and np.idNomina = "+idnomina;
		List<NominasPercepciones> datosp = new ArrayList();
		
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sqlp);
			ps = Conexion.getInstance().getCN().prepareStatement(sqlp);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				NominasPercepciones np = new NominasPercepciones();
				np.setNombre(rs.getString(1));
				np.setImporte(rs.getFloat(2));
				datosp.add(np);
			}
			
		} catch (Exception e) {
			System.out.println("Error al obtenerconceptos : " + e.getMessage());
		}
		return datosp;
	}
	
	public List<NominasDeducciones> obtenerconceptosd(int idnomina)
	{
		String sqld = "select d.nombre,nd.importe from NominasDeducciones nd join Deducciones d "+
					  "on d.idDeduccion = nd.idDeduccion and nd.idNomina = "+idnomina;
		List<NominasDeducciones> datosd = new ArrayList();
		
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sqld);
			ps = Conexion.getInstance().getCN().prepareStatement(sqld);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				NominasDeducciones nd = new NominasDeducciones();
				nd.setNombre(rs.getString(1));
				nd.setImporte(rs.getFloat(2));
				datosd.add(nd);
			}
			
		} catch (Exception e) {
			System.out.println("Error al obtenerconceptos : " + e.getMessage());
		}
		return datosd;
	}
	
	
	
}
