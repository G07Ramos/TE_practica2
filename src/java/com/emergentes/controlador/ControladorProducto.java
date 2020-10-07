package com.emergentes.controlador;

import com.emergentes.modelo.Producto;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ControladorProducto", urlPatterns = {"/ControladorProducto"})
public class ControladorProducto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int op = Integer.parseInt(request.getParameter("op"));
        int id, pos;
        HttpSession ses = request.getSession();
        ArrayList<Producto> lista = (ArrayList<Producto>) ses.getAttribute("listaproducto");

        //nuevo
        if (op == 1) {
            Producto p = new Producto();
            request.setAttribute("miProducto", p);
            request.getRequestDispatcher("editarproducto.jsp").forward(request, response);
        }
        //editar
        if (op == 2) {
            id = Integer.parseInt(request.getParameter("id"));
            pos = buscarPos(request, id);
            Producto obj1 = lista.get(pos);
            request.setAttribute("miProducto", obj1);
            request.getRequestDispatcher("editarproducto.jsp").forward(request, response);
        }
        //eliminar
        if (op == 3) {
            id = Integer.parseInt(request.getParameter("id"));
            pos = buscarPos(request, id);
            lista.remove(pos);
            ses.setAttribute("listaproducto", lista);
            response.sendRedirect("indexproducto.jsp");
        }
        //salir
        if (op == 4) {
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        String producto = request.getParameter("producto");
        String categoria = request.getParameter("categoria");
        String existencia = request.getParameter("existencia");
        int precio=Integer.parseInt(request.getParameter("precio"));
        String nuevo = request.getParameter("nuevo");
        int pos;
        Producto prod = new Producto();
        prod.setId(id);
        prod.setProducto(producto);
        prod.setCategoria(categoria);
        prod.setExistencia(existencia);
        prod.setPrecio(precio);

        HttpSession ses = request.getSession();
        ArrayList<Producto> lista = (ArrayList<Producto>) ses.getAttribute("listaproducto");

        if (nuevo.equals("true")) {
            lista.add(prod);
        } else {
            pos = buscarPos(request, id);
            lista.set(pos, prod);
        }
        response.sendRedirect("indexproducto.jsp");
    }

        private int buscarPos(HttpServletRequest request, int id) {
        HttpSession ses = request.getSession();
        ArrayList<Producto> lista = (ArrayList<Producto>) ses.getAttribute("listaproducto");

        int i = 0;
        if (lista.size() > 0) {
            while (i < lista.size()) {
                if (lista.get(i).getId() == id) {
                    break;
                } else {
                    i++;
                }
            }
        }
        return i;
    }
        
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
