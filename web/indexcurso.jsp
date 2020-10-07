<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Curso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("listacurso") == null) {
        ArrayList<Curso> listaux = new ArrayList<Curso>();
        session.setAttribute("listacurso", listaux);
    }
    ArrayList<Curso> lista = (ArrayList<Curso>) session.getAttribute("listacurso");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        <h1>Lista de Inscritos</h1>
        <a href="ControladorCurso?op=1">Nuevo</a>
        <a href="ControladorCurso?op=4">Salir</a>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Curso</th>
            </tr>
            <%
                if(lista != null){
                    for(Curso item: lista){
            %>
            <tr>
                <td><%= item.getId()%></td>
                <td><%= item.getNombre()%></td>
                <td><%= item.getApellidos()%></td>
                <td><%= item.getCurso()%></td>
                <td><a href="ControladorCurso?op=2&id=<%= item.getId() %>">Editar</a></td>
                <td><a href="ControladorCurso?op=3&id=<%= item.getId() %>"
                       onclick="return confirm('Esta seguro que desea eliminar el registro?')">Eliminar</a></td> 
            </tr>
            <%
                    }
                }      
            %>
        </table>
    </body>
</html>
