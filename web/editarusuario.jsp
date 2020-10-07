<%@page import="com.emergentes.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario item = (Usuario) request.getAttribute("miUsuario");
    boolean nuevo = true;
    if (item.getId() > 0) {
        nuevo = false;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        <h1>Registro de usuarios</h1>
        <form action="ControladorUsuario" method="post">
            <table>
                <tr>
                    <td>Id:</td>
                    <td><input type="text" name="id" value="<%= item.getId()%>"/></td>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" name="nombre" value="<%= item.getNombre()%>"/></td>
                </tr>
                <tr>
                    <td>Apellidos:</td>
                    <td><input type="text" name="apellidos" value="<%= item.getApellidos()%>"/></td>
                </tr>
                <tr>
                    <td>Correo electronico:</td>
                    <td><input type="text" name="correo" value="<%= item.getCorreo()%>"/></td>
                </tr>
                <tr>
                    <td>Contraseña:</td>
                    <td><input type="password" name="contraseña" value="<%= item.getContraseña()%>"/></td>
                </tr>
                <tr>
                    <input type="hidden" name="nuevo" value="<%= nuevo %>">
                           <td></td>
                    <td><input type="submit" value="Enviar"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
