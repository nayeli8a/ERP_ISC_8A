package modelo.datos;

import java.sql.PreparedStatement;

public class NominasDeduccionesDAO {
	
	
	public void Insertar(int idNomina,int idDeduccion,float importe)
	{
		String sql = "insert into NominasDeducciones (idNomina,idDeduccion,importe,estatus) values(?,?,?,'A')";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setInt(1,idNomina);
			ps.setInt(2,idDeduccion);
			ps.setFloat(3,importe);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al insertar la NominaDeduccion en la BD: "+e.getMessage());
		}
	}
	
	public void actualizar(int idNomina,int idDeduccionN)
	{
		String sql = "insert into NominasDeducciones (idNomina,idDeduccion,importe,estatus) values(?,?,0,'A')";;
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setInt(2,idDeduccionN);
			ps.setInt(1,idNomina);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al actualizar la NominaDeduccion en la BD: "+e.getMessage());
		}
	}
	
	public void resetear(int idNomina)
	{
		//eliminamos las deducciones anteriores y agregamos las nuevas
		String aux = "delete NominasDeducciones where idNomina=?";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(aux);
			ps.setInt(1,idNomina);
			ps.execute();
		} catch (Exception e) {
			System.out.println("Error al resetear NominasDeducciones en la BD: "+e.getMessage());
		}
	}
}
