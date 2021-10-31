package eliminar.DAO;

import eliminar.Bean.EmpleadoBean;
import java.util.ArrayList;
import eliminar.Util.ConexionBD;
import java.sql.*;

public class EmpleadoDAO {
	
	Connection cn=null;
	PreparedStatement pt=null;//permite preparar el sql
	ResultSet rs=null;//me permite manipular loos registros

	ArrayList<EmpleadoBean> listado=null;
	EmpleadoBean obEmpleadoBean =null;

	public ArrayList<EmpleadoBean> ListarEmpleados(){
	
		try {
		cn= ConexionBD.getConexionBD();
		cn.prepareStatement("select * from empleado;");
		pt.executeQuery();//permite ejecutar la sentencia sql
		listado=new ArrayList<EmpleadoBean>();
		while(rs.next()){
			obEmpleadoBean=new EmpleadoBean(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
		}
		pt.close();
		rs.close();
		cn.close();
		} catch (Exception e) {
		}
		return listado;
	}
	
	public void EliminarEmpleado (EmpleadoBean objEmple){
		try {
		cn= ConexionBD.getConexionBD();
		pt=cn.prepareStatement("delete from empleado where codigo =? ;");
		pt.setInt(1, objEmple.getCodigo());
		pt.executeUpdate();//permite ejecutar la sentencia sql
		pt.close();
		cn.close();
		
		} catch (Exception e) {
		}
	}
	

}
