<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP MAIN</title>
        </head>
        <body>
<%
HttpSession sesion=request.getSession();
String usuario;
String nivel;

if(sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null){
        usuario=sesion.getAttribute("user").toString();
        nivel=sesion.getAttribute("nivel").toString();
        out.print("<a href='login.jsp?cerrar=true'><h5>Cerrar Sesion"+usuario+"</h5> </a>");
}else{
        out.print("<script>location.replace('login.jsp');</script>");
}
%>



                <hr>
                <h1>Bienvenido ADMI</h1>
                <hr>
        </body>
</html>
