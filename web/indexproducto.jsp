<%@page import="com.emergentes.modelo.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("listaproducto") == null) {
        ArrayList<Producto> listaux = new ArrayList<Producto>();
        session.setAttribute("listaproducto", listaux);
    }
    ArrayList<Producto> lista = (ArrayList<Producto>) session.getAttribute("listaproducto");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        <h1>Lista de Productos</h1>
        <a href="ControladorProducto?op=1">Nuevo</a>
        <a href="ControladorProducto?op=4">Salir</a>
        
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Producto</th>
                <th>Categoria</th>
                <th>Existencia</th>
                <th>Precio</th>
            </tr>
            <%
                if(lista != null){
                    for(Producto item: lista){
            %>
            <tr>
                <td><%= item.getId()%></td>
                <td><%= item.getProducto()%></td>
                <td><%= item.getCategoria()%></td>
                <td><%= item.getExistencia()%></td>
                <td><%= item.getPrecio()%></td>
                <td><a href="ControladorProducto?op=2&id=<%= item.getId() %>">Editar</a></td>
                <td><a href="ControladorProducto?op=3&id=<%= item.getId() %>"
                       onclick="return confirm('Esta seguro que desea eliminar el registro?')">Eliminar</a></td> 
            </tr>
            <%
                    }
                }      
            %>
        </table>
    </body>
</html>
