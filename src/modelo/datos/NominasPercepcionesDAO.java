package modelo.datos;

import java.sql.PreparedStatement;

public class NominasPercepcionesDAO {

	public void Insertar(int idNomina,int idPercepcion,float importe)
	{
		String sql = "insert into NominasPercepciones (idNomina,idPercepcion,importe,estatus) values(?,?,?,'A')";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setInt(1,idNomina);
			ps.setInt(2,idPercepcion);
			ps.setFloat(3,importe);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al insertar la NominaPercepcion en la BD: "+e.getMessage());
		}
	}
	
	public void actualizar(int idNomina,int idPercepcionN)
	{
		
		String sql = "insert into NominasPercepciones (idNomina,idPercepcion,importe,estatus) values(?,?,0,'A')";;
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setInt(2,idPercepcionN);
			ps.setInt(1,idNomina);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al actualizar la NominaPercepcion en la BD: "+e.getMessage());
		}
	}
	
	public void resetear(int idNomina)
	{
		//eliminamos las deducciones anteriores y agregamos las nuevas
		String aux = "delete NominasPercepciones where idNomina=?";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(aux);
			ps.setInt(1,idNomina);
			ps.execute();
		} catch (Exception e) {
			System.out.println("Error al resetear NominasPercepciones en la BD: "+e.getMessage());
		}
	}
}
