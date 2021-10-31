<%@page import="modelado.login_usuarios.Operaciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Login</title>
        </head>
<body>
        <h1>Formulario de Acceso</h1>
        <hr>
        <form action="login.jsp" method="POST">
                Usuario:<input type="text" name="txtUsuario"><br>
                Contraseña:<input type="password" name="txtContra"><br>
                <input type="submit" name="btnIngresar" value="Ingresar">
        </form>
<%
Operaciones op=new Operaciones();
if(request.getParameter("btnIngresar")!=null){
        String nombre=request.getParameter("txtUsuario");
        String contra=request.getParameter("txtContra");
        
        HttpSession sesion=request.getSession();
        
        switch(op.loguear(nombre, contra)){
                case 1:
                        sesion.setAttribute("user", nombre);//nombre_nuevo_atributo,atributo de quien tomara el valor
                        sesion.setAttribute("nivel", "1");
                        response.sendRedirect("indexMain.jsp");
                        break;
                case 2:
                        sesion.setAttribute("user", nombre);
                        sesion.setAttribute("nivel", "2");
                        response.sendRedirect("indexUser.jsp");
                        break;
                default:
                        out.write("Usuario no existe, o contraseña invalida NOVATO");
                        break;
                        
        }
}

if(request.getParameter("cerrar")!=null){
        session.invalidate();
}

        
%>
        
        
</body>
</html>
