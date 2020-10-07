<%@page import="com.emergentes.modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Producto item = (Producto) request.getAttribute("miProducto");
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
        <h1>Registro de productos</h1>
        <form action="ControladorProducto" method="post">
            <table>
                <tr>
                    <td>Id:</td>
                    <td><input type="text" name="id" value="<%= item.getId()%>"/></td>
                </tr>
                <tr>
                    <td>Producto:</td>
                    <td><input type="text" name="producto" value="<%= item.getProducto()%>"/></td>
                </tr>
                <tr>
                    <td>Categoria: </td>
                    <td><select name="categoria" value="<%= item.getCategoria()%>">
                            <option value="Accesorios">Accesorios</option>
                            <option value="Zapatos">Zapatos</option>
                            <option value="Comida">Comida</option>
                            <option value="Ropa">Ropa</option>
                            <option value="Juguetes">Juguetes</option>
                            <option value="VideoJuegos">VideoJuegos</option>
                            <option value="Electronica">Electronica</option>
                            <option value="Informatica">Informatica</option>
                            <option value="Electrodomesticos">Electrodomesticos</option>
                        </select></td>
                </tr>
                <tr>
                    <td>Existencia:</td>
                    <td><input type="text" name="existencia" value="<%= item.getExistencia()%>"/></td>
                </tr>
                <tr>
                    <td>Precio:</td>
                    <td><input type="number" name="precio" value="<%= item.getPrecio()%>"/></td>
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
