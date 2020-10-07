<%@page import="com.emergentes.modelo.Libro"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("listalibro") == null) {
        ArrayList<Libro> listaux = new ArrayList<Libro>();
        session.setAttribute("listalibro", listaux);
    }
    ArrayList<Libro> lista = (ArrayList<Libro>) session.getAttribute("listalibro");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        <h1>Lista de Libros</h1>
        <a href="ControladorLibro?op=1">Nuevo</a>
        <a href="ControladorLibro?op=4">Salir</a>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Titulo</th>
                <th>Autor</th>
                <th>Resumen</th>
                <th>Medio</th>
            </tr>
            <%
                if(lista != null){
                    for(Libro item: lista){
            %>
            <tr>
                <td><%= item.getId()%></td>
                <td><%= item.getTitulo()%></td>
                <td><%= item.getAutor()%></td>
                <td><%= item.getResumen()%></td>
                <td><%= item.getMedio()%></td>
                <td><a href="ControladorLibro?op=2&id=<%= item.getId() %>">Editar</a></td>
                <td><a href="ControladorLibro?op=3&id=<%= item.getId() %>"
                       onclick="return confirm('Esta seguro que desea eliminar el registro?')">Eliminar</a></td> 
            </tr>
            <%
                    }
                }      
            %>
        </table>
    </body>
</html>
