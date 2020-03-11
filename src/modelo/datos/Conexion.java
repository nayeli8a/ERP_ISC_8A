package modelo.datos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
	//datos para conexion con la bd de SQLSERVER
		String url = "jdbc:sqlserver://localhost:1433;database=ERP2020";
		public static String user = "";
		public static String pass = "";
		
		private Connection cn=null;
		static Conexion conexion=null;
		
		private Conexion()
		{
			try {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				cn = DriverManager.getConnection(url,user,pass);
			} catch (SQLException e) {
				System.out.println("CONEXION: Error al conectar con la BD");
				System.out.println(e.getMessage());
			} catch (ClassNotFoundException e) {
				System.out.println("CONEXION: Excepcion de Clase no encontrada");
				e.printStackTrace();
			}
		}
		
		public static Conexion getInstance()
		{
			if(conexion == null)
			{
				conexion = new Conexion();
			}
			return conexion;
		}
		
		public Connection getCN()
		{
			return cn;
		}
		
		public void cerrar()
		{
			try
			{
				cn.close();
			}catch(SQLException e)
			{
				System.out.println("CONEXION: Error al cerrar la conexion con la BD");
				System.out.println(e.getMessage());
			}
		}
}
