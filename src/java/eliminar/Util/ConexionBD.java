package eliminar.Util;

import java.sql.*;

public class ConexionBD {
	
	public static Connection getConexionBD(){
Connection cn=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost/bdunfvsamanta","root","vasquez");
			System.out.println("Se connecto !!!!!");
		} catch (Exception e) {
			System.out.println("No se connecto !!!!");
		}
		
		return cn;
	}

	public static void main(String[] args) {
		getConexionBD();
	}
	
}
