<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Inicio-BBDD Regsitro</title>
		<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        </head>
<body>
<%
        //Conectando a la base de datos:
        Connection con;
        String url="jdbc:mysql://localhost:3306/registro";
        String Driver="com.mysql.cj.jdbc.Driver";
        String user="root";
        String clave="vasquez";
        Class.forName(Driver);
        con=DriverManager.getConnection(url, user, clave);
        //Empezamos con el listado de la tabla Usuario
        PreparedStatement ps;
        ResultSet rs;
        ps=con.prepareStatement("select * from persona");
        rs=ps.executeQuery();
       //Creamos la tabla
%>
<div class="container">
        <h1>Lista de Registro</h1>
        <a class="btn btn-success btn-lg" href="agregar.jsp" style="background: #000"><b>Nuevo Registro</b></a>
        <br>
        <br>
        <table class="table table-bordered">
                <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">DNI</th>
                        <th>NOMBRE</th>
                        <th class="text-center">ACCIONES</th>
                </tr>
<% 
        while(rs.next()){
%>
<tr>
        <td class="text-center"><%= rs.getInt("Id")%></td>
        <td class="text-center"><%= rs.getString("DNI")%></td>
        <td><%= rs.getString("Nombres")%></td>
        <td class="text-center">
                <a href="editar.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-warning btn-sm">Editar</a>
                <a href="delete.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-danger btn-sm">Eliminar</a>
        </td>
</tr>
<%}%>
        </table>
        
</div>
</body>
</html>
