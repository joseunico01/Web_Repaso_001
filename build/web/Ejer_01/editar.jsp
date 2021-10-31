<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP editar</title>
        </head>
        <body>
<%
Connection con;
String url="jdbc:mysql://localhost:3306/logueo";
String user="root";
String pass="vasquez";
String Driver="com.mysql.cj.jdbc.Driver";
Class.forName(Driver);
con=DriverManager.getConnection(url,user,pass);
//Recoger los datos
PreparedStatement ps;
ResultSet rs;
int id=Integer.parseInt(request.getParameter("id"));
ps=con.prepareStatement("select * from login where id="+id);

rs=ps.executeQuery();
while(rs.next()){
%>
        <srript> system.out.document(id)</srript>
                <h1>EDITAR</h1>
                <div class="container">
                        <form action="" method="get">
                               ID:
                               <input type="text" readonly="" class="form-control" value="<%=rs.getInt("id")%>">
                               USUARIO:
                               <input type="text" name="txtusu" class="form-control" value="<%=rs.getString("usuario")%>">
                               CONTRA:
                               <input type="text" name="txtcon" class="form-control" value="<%=rs.getInt("contra")%>">
                               NIVEL:
                               <input type="text" readonly="" name="txtnivel" class="form-control" value="<%=rs.getInt("nivel")%>">
                               <input type="submit" value="Guardar" class="btn btn-primary btn-lg"><br>
                               <a href="index.jsp">Regresar</a>
                        </form>
                               <%
                                       id=Integer.parseInt(request.getParameter("id"));
                                       }
                               %>
                </div> 
        </body>
</html>
<%

String usuario,contraseña;
usuario=request.getParameter("txtusu");
contraseña=request.getParameter("txtcon");
if(usuario!=null && contraseña!=null){
        ps=con.prepareStatement("update login set usuario='"+usuario+"', contra="+contraseña+", where id="+id);
        ps.executeUpdate();
        response.sendRedirect("index.jsp");
}

%>