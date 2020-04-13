package modelo.datos;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.beans.*;

public class NominasDAO {
	
	public void Insertar(int idNomina,Date fechaPago,float totalP,
			float totalD,float cantidadNeta,int diasTrabajados,
			int faltas,Date fechaInicio,Date fechaFin,int idEmpleado,
			int idFormaPago)
	{
		String sql = "insert into Nominas (fechaPago,totalP,totalD,cantidadNeta,diasTrabajados,faltas,fechaInicio,fechaFin,idEmpleado,idFormaPago)"
				+ "values('"+fechaPago+"','"+totalP+"','"+totalD+"','"+cantidadNeta+"','"+diasTrabajados+"','"+faltas+"','"+fechaInicio+"','"+fechaFin+"','"+idEmpleado+"','"+idFormaPago+"')";
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
		String sql = "execute sp_paginaciondinamica 'Nominas','idNomina','"+pagina+"','10'";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Nominas n = new Nominas();
				n.setIdNomina(rs.getInt(1));
				

				lista.add(n);
			}
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
		return lista;
	}
	
	public Nominas ConsultaIndividual()
	{
		return null;
	}
	
	public void Eliminar(int idNomina)
	{
		
	}
	
	public void Editar(Nominas nom)
	{
		
	}
	
}
