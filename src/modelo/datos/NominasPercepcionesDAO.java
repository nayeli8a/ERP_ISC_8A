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
	
	public void actualizar(int idNomina,int idPercepcionV,int idPercepcionN,float importe)
	{
		String sql = "Update NominasPercepciones set idPercepcion=?, importe=? where idNomina=? and idPercepcion=?";
		try {
			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
			ps.setInt(1,idPercepcionN);
			ps.setFloat(2,importe);
			ps.setInt(3,idNomina);
			ps.setInt(4,idPercepcionV);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al actualizar la NominaPercepcion en la BD: "+e.getMessage());
		}
	}
}
