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
}
