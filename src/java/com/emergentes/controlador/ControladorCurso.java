package com.emergentes.controlador;

import com.emergentes.modelo.Curso;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ControladorCurso", urlPatterns = {"/ControladorCurso"})
public class ControladorCurso extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int op = Integer.parseInt(request.getParameter("op"));
        int id, pos;
        HttpSession ses = request.getSession();
        ArrayList<Curso> lista = (ArrayList<Curso>) ses.getAttribute("listacurso");

        //nuevo
        if (op == 1) {
            Curso c = new Curso();
            request.setAttribute("miCurso", c);
            request.getRequestDispatcher("editarcurso.jsp").forward(request, response);
        }
        //editar
        if (op == 2) {
            id = Integer.parseInt(request.getParameter("id"));
            pos = buscarPos(request, id);
            Curso obj1 = lista.get(pos);
            request.setAttribute("miCurso", obj1);
            request.getRequestDispatcher("editarcurso.jsp").forward(request, response);
        }
        //eliminar
        if (op == 3) {
            id = Integer.parseInt(request.getParameter("id"));
            pos = buscarPos(request, id);
            lista.remove(pos);
            ses.setAttribute("listacurso", lista);
            response.sendRedirect("indexcurso.jsp");
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
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String curso = request.getParameter("curso");
        String nuevo = request.getParameter("nuevo");
        int pos;
        Curso curs = new Curso();
        curs.setId(id);
        curs.setNombre(nombre);
        curs.setApellidos(apellidos);
        curs.setCurso(curso);

        HttpSession ses = request.getSession();
        ArrayList<Curso> lista = (ArrayList<Curso>) ses.getAttribute("listacurso");

        if (nuevo.equals("true")) {
            lista.add(curs);
        } else {
            pos = buscarPos(request, id);
            lista.set(pos, curs);
        }
        response.sendRedirect("indexcurso.jsp");
    }
    
    private int buscarPos(HttpServletRequest request, int id) {
        HttpSession ses = request.getSession();
        ArrayList<Curso> lista = (ArrayList<Curso>) ses.getAttribute("listacurso");

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
