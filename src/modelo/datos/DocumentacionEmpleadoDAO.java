package modelo.datos;



import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.beans.DocumentacionEmpleado;


public class DocumentacionEmpleadoDAO{

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


    public void insertarDocumentacionEmpleado(String nombreDocumento, Date fechaEntrega,int idEmpleado, String estatus)
	  {
		  String sql = "insert into DocumentacionEmpleado values('"+nombreDocumento+"','"+fechaEntrega+"',null,"+idEmpleado+",'"+estatus+"')";
	    try {
				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps = Conexion.getInstance().getCN().prepareStatement(sql);
				ps.executeUpdate();
			} catch (Exception e) {
				System.out.println("Error al insertar DocumentacionEmpleado en la BD: "+e.getMessage());
			}
	  }

    public List<DocumentacionEmpleado> consultar(String pagina)
  	{
  		ArrayList<DocumentacionEmpleado> lista = new ArrayList<>();
  		String sql = "execute sp_paginaciondinamica 'DocumentacionEmpleado','idDocumento','"+pagina+"','10'";
  		try {
  			PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
  			ps = Conexion.getInstance().getCN().prepareStatement(sql);
  			ResultSet rs = ps.executeQuery();
  			while (rs.next()) {
  				DocumentacionEmpleado de = new DocumentacionEmpleado();
  				de.setIdDocumento(rs.getInt(1));
          de.setNombreDocumento(rs.getString(2));
  				de.setFechaEntrega(rs.getDate(3));
  				de.setEvidencia(rs.getBinaryStream(4));
          de.setNss(rs.getString(5));
  				de.setIdEmpleado(rs.getInt(6));
  				de.setEstatus(rs.getString(7));

  				lista.add(de);


  			}
  		} catch (SQLException e) {
  			System.out.println("Error: " + e.getMessage());
  		}
  		return lista;
  	}

    public DocumentacionEmpleado consultaIndividual(int idDocumento){
  		String sql="select * from  DocumentacionEmpleado where idDocumento=?";
  		DocumentacionEmpleado de = new DocumentacionEmpleado();
  		try{
  			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);
  			ps.setInt(1, idDocumento);
  			ResultSet rs=ps.executeQuery();
  			if(rs.next()){
  				de.setIdDocumento(rs.getInt("idDocumento"));
          de.setNombreDocumento(rs.getString("nombreDocumento"));
  				de.setFechaEntrega(rs.getDate("fechaEntrega"));
  				de.setEvidencia(rs.getBinaryStream("evidencia"));
  				de.setNss(rs.getString("nss"));
  				de.setIdEmpleado(rs.getInt("idEmpleado"));
  				de.setEstatus(rs.getString("estatus"));

  			}
  			ps.close();
  			rs.close();
  		}
  		catch(SQLException e){
  			System.out.println("Error DocumentacionEmpleado DAO:"+e.getMessage());
  		}
  		return de;
  	}

    public void eliminar(String id){
  		String sql = "execute sp_EliminarLogicamente 'DocumentacionEmpleado','"+id+"','idDocumento'";
  		System.out.println(sql);
  		try {
  				PreparedStatement ps = Conexion.getInstance().getCN().prepareStatement(sql);
  				ps = Conexion.getInstance().getCN().prepareStatement(sql);
  				ps.executeUpdate();
  			} catch (Exception e) {
  				System.out.println("Error: " + e.getMessage());
  			}
  	}

    public void actualizar(DocumentacionEmpleado documento)
  	{
  		String sql="update DocumentacionEmpleado set nombreDocumento=?,fechaEntrega=?,Documento=?,idEmpleado=?, Estatus=? where idEmpleado=?";
  		try {
  			PreparedStatement ps=Conexion.getInstance().getCN().prepareStatement(sql);

  			ps.setDate(1, DocumentacionEmpleado.getNombreDocumento());
  			ps.setDate(2,DocumentacionEmpleado.getFechaEntrega());
  			ps.setString(3,DocumentacionEmpleado.getDocumento());
  			ps.setInt(4, DocumentacionEmpleado.getIdEmpleado());
  			ps.setString(5,DocumentacionEmpleado.getEstatus());

  			ps.executeUpdate();

  		} catch (Exception e) {
  			System.out.println("Error al actualizar DocumentacionEmpleado"+e.getMessage());
  		}
  	}
}