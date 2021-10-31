package Prueba_Basic_Conec_MYSQL;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion{

    public static final String URL = "jdbc:mysql://localhost/bdunfv2020";
    public static final String USER = "root";
    public static final String CLAVE = "vasquez";
     
    public static Connection getConexion(){
        Connection con = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = (Connection) DriverManager.getConnection(URL, USER, CLAVE);
	    System.out.println("Conectado exitosamente nov de mrd");
        }catch(Exception e){
            System.out.println("Error: " + e.getMessage());
        }
        return con;
    }
    public static void main(String[] args) {
	    getConexion();
	}
}