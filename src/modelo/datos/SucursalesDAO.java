package modelo.datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import modelo.datos.*;
import modelo.beans.*;

public class SucursalesDAO {
	PreparedStatement ps;
	ResultSet rs;
	
	public List<Sucursales> consultar()
	{
		String sql = "select * from Sucursales";
		ArrayList<Sucursales> lista = new ArrayList<Sucursales>();
		try {
			ps = Conexion.getInstance().getCN().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Sucursales s = new Sucursales();
				s.setIdSucursal(rs.getInt(1));
				s.setNombre(rs.getString(2));
				s.setTelefono(rs.getString(3));
				s.setDireccion(rs.getString(4));
				s.setColonia(rs.getString(5));
				s.setCodigopostal(rs.getString(6));
				s.setPresupuesto(rs.getFloat(7));
				s.setEstatus(rs.getString(8));
				s.setIdCiudad(rs.getInt(9));
				lista.add(s);
			}
			
		} catch (Exception e) {
			System.out.print("Error dentro de SurcursalDAO: "+e.getMessage());
		}
		return lista;
	}
	
}
