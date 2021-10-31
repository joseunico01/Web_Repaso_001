<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
                <title>index_practicando</title>
        </head>
        <body>
                <h1>INDEX</h1>
<%
Connection con;
String user="root";
String pass="vasquez";
String url="jdbc:mysql://localhost:3306/logueo";
String driver="com.mysql.cj.jdbc.Driver";
Class.forName(driver);
con=DriverManager.getConnection(url,user,pass);
//Empezar con la tabla login
PreparedStatement ps;
ResultSet rs;
ps=con.prepareStatement("select * from login");
rs=ps.executeQuery();
//Creamos la tabla en html
%>

<div class="container">
        <h2>Lista de Registro</h2>
        <br><br>
        <table>
                <tr>
                        <th>ID</th>
                        <th>Usuario</th>
                        <th>Contra</th>
                        <th>Nivel</th>
                        <th>Opciones</th>
                </tr>
                <%
                while(rs.next()){
                %>
                <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("usuario") %></td>
                        <td><%= rs.getInt("contra") %></td>
                        <td><%= rs.getInt("nivel") %></td>
                        <td>
                                <a href="editar.jsp?id=<%= rs.getInt("id")%>" class="btn btn-Danger" >Editar</a>
                        <a href="eliminar.jsp?id=<%= rs.getInt("id") %>" class="btn btn-Danger">Eliminar</a>
                        </td>
                </tr>
                <%}%>
        </table>
</div>
</body>
</html>
