package modelado.login_usuarios;

import java.sql.*;
import javax.swing.JOptionPane;


public class Operaciones {
        String driver;
        String url;
        String uss;
        String contra;

        public Operaciones(){
                driver="com.mysql.cj.jdbc.Driver";
                url="jdbc:mysql://localhost:3306/logueo";
                uss="root";
                contra="vasquez";
        }
        public int loguear(String us, String pass){
                Connection conn;
                PreparedStatement pst;
                ResultSet rs;
                int nivel=0;
                String sql="select nivel from login where usuario='"+us+"' and contra='"+pass+"'";
                try {
                        Class.forName(this.driver);
                        conn=DriverManager.getConnection(this.url, this.uss, this.contra);
                        pst=conn.prepareStatement(sql);
                        rs=pst.executeQuery();

                        while(rs.next()){
                                nivel=rs.getInt(1);
                        }
                        conn.close();

                } catch (ClassNotFoundException | SQLException e) {
                        JOptionPane.showMessageDialog(null, "no se pudo conectar"+e);
                }
                return nivel;
        }
        
}