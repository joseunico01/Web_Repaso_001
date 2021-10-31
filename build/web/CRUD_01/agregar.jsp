<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
                <title>Agregar registro</title>
        </head>
        <body>
                <div class="container">
                <h1>Agregar Registro</h1>
                <hr>
                <form action="" method="post" class="form-control" style="width: 500px; height: 225px">
                        DNI:
                        <input type="text" name="txtDNI" class="form-control">
                        Nombres:
                        <input type="text" name="txtNom" class="form-control">
                        <br>
                        <br>
                        <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                        <a href="index.jsp">Regresar</a>
                </form>
                </div>
        </body>
</html>
<%
        //Conectando a la base de datos:
        Connection con;
        String url="jdbc:mysql://localhost:3306/registro";
        String Driver="com.mysql.cj.jdbc.Driver";
        String user="root";
        String clave="vasquez";
        Class.forName(Driver);
        con=DriverManager.getConnection(url, user, clave);
        PreparedStatement ps;
        String dni, nom;
        dni=request.getParameter("txtDNI");
        nom=request.getParameter("txtNom");
        if(nom!=null && dni!=null){
                ps=con.prepareStatement("insert into persona(DNI,Nombres)values('"+dni+"','"+nom+"')");
                ps.executeUpdate();
                response.sendRedirect("index.jsp");
        }
%>