<%@page import="com.emergentes.modelo.Curso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Curso item = (Curso) request.getAttribute("miCurso");
    boolean nuevo = true;
    if (item.getId() > 0) {
        nuevo = false;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INSCRIPCION</title>
    </head>
    <body>
        <h1>Inscripcion en curso</h1>
        <form action="ControladorCurso" method="post">
            <table>
                <tr>
                    <td>Id:</td>
                    <td><input type="text" name="id" value="<%= item.getId() %>"/></td>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" name="nombre" value="<%= item.getNombre()%>"/></td>
                </tr>
                <tr>
                    <td>Apellidos:</td>
                    <td><input type="text" name="apellidos" value="<%= item.getApellidos() %>"/></td>
                </tr>
                <tr>
                    <td>Curso: </td>
                    <td><select name="curso" value="<%= item.getCurso() %>">
                    <option value="Primero">Primero</option>
                    <option value="Segundo">Segundo</option>
                    <option value="Tercero">Tercero</option>
                    <option value="Cuarto">Cuarto</option>
                    <option value="Quinto">Quinto</option>
                    <option value="Sexto">Sexto</option>
                    </select></td>
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
