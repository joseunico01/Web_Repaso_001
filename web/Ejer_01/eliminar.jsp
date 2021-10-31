<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP elimimar</title>
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
//Recoger el parametro de nuestro index
PreparedStatement ps;
int id=Integer.parseInt(request.getParameter("id"));
ps=con.prepareStatement("delete from login where id="+id);
ps.executeUpdate();
response.sendRedirect("index.jsp");
%>

        <h1>ELIMINAR</h1>
        <div class="container"><br>
        </div>
</body>
</html>
