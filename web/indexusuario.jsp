<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("listausuario") == null) {
        ArrayList<Usuario> listaux = new ArrayList<Usuario>();
        session.setAttribute("listausuario", listaux);
    }
    ArrayList<Usuario> lista = (ArrayList<Usuario>) session.getAttribute("listausuario");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        <h1>Lista de Usuarios</h1>
        <a href="ControladorUsuario?op=1">Nuevo</a>
        <a href="ControladorUsuario?op=4">Salir</a>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Correo electronico</th>
                <th>Contraseña</th>
            </tr>
            <%
                if(lista != null){
                    for(Usuario item: lista){
            %>
            <tr>
                <td><%= item.getId()%></td>
                <td><%= item.getNombre()%></td>
                <td><%= item.getApellidos()%></td>
                <td><%= item.getCorreo()%></td>
                <td><%= item.getContraseña()%></td>
                <td><a href="ControladorUsuario?op=2&id=<%= item.getId() %>">Editar</a></td>
                <td><a href="ControladorUsuario?op=3&id=<%= item.getId() %>"
                       onclick="return confirm('Esta seguro que desea eliminar el registro?')">Eliminar</a></td> 
            </tr>
            <%
                    }
                }      
            %>
        </table>
    </body>
</html>
