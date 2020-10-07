package com.emergentes.controlador;

import com.emergentes.modelo.Libro;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ControladorLibro", urlPatterns = {"/ControladorLibro"})
public class ControladorLibro extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int op = Integer.parseInt(request.getParameter("op"));
        int id, pos;
        HttpSession ses = request.getSession();
        ArrayList<Libro> lista = (ArrayList<Libro>) ses.getAttribute("listalibro");

        //nuevo
        if (op == 1) {
            Libro lib = new Libro();
            request.setAttribute("miLibro", lib);
            request.getRequestDispatcher("editarlibro.jsp").forward(request, response);
        }
        //editar
        if (op == 2) {
            id = Integer.parseInt(request.getParameter("id"));
            pos = buscarPos(request, id);
            Libro lib1 = lista.get(pos);
            request.setAttribute("miLibro", lib1);
            request.getRequestDispatcher("editarlibro.jsp").forward(request, response);
        }
        //eliminar
        if (op == 3) {
            id = Integer.parseInt(request.getParameter("id"));
            pos = buscarPos(request, id);
            lista.remove(pos);
            ses.setAttribute("listalibro", lista);
            response.sendRedirect("indexlibro.jsp");
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
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String resumen = request.getParameter("resumen");
        String medio = request.getParameter("medio");
        String nuevo = request.getParameter("nuevo");
        int pos;
        Libro libr = new Libro();
        libr.setId(id);
        libr.setTitulo(titulo);
        libr.setAutor(autor);
        libr.setResumen(resumen);
        libr.setMedio(medio);

        HttpSession ses = request.getSession();
        ArrayList<Libro> lista = (ArrayList<Libro>) ses.getAttribute("listalibro");

        if (nuevo.equals("true")) {
            lista.add(libr);
        } else {
            pos = buscarPos(request, id);
            lista.set(pos, libr);
        }
        response.sendRedirect("indexlibro.jsp");
    }

        private int buscarPos(HttpServletRequest request, int id) {
        HttpSession ses = request.getSession();
        ArrayList<Libro> lista = (ArrayList<Libro>) ses.getAttribute("listalibro");

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
