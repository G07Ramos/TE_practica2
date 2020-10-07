<%@page import="com.emergentes.modelo.Libro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Libro item = (Libro) request.getAttribute("miLibro");
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
        <h1>Registro de libros</h1>
        <form action="ControladorLibro" method="post">
            <table>
                <tr>
                    <td>Id:</td>
                    <td><input type="text" name="id" value="<%= item.getId()%>"/></td>
                </tr>
                <tr>
                    <td>Titulo:</td>
                    <td><input type="text" name="titulo"  value="<%= item.getTitulo()%>"/></td>
                </tr>
                <tr>
                    <td>Autor</td>
                    <td><input type="text" name="autor" value="<%= item.getAutor()%>"/></td>
                </tr>
                <tr>
                    <td>Resumen:</td>
                    <td><textarea name="resumen" rows="5" cols="24" value="<%= item.getResumen()%>"></textarea></td>
                </tr>
                <tr>
                    <td>Medio:</td>
                    <td><input type="radio" name="medio" value="Fisico" value="<%= item.getMedio()%>"/>Fisico</td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="radio" name="medio" value="Magnetico" value="<%= item.getMedio()%>"/>Magnetico</td>
                </tr>
                <tr>
                    <input type="hidden" name="nuevo" value="<%= nuevo%>">
                    <td></td>
                    <td><input type="submit" value="Enviar"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
