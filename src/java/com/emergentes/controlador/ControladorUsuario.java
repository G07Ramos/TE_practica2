package com.emergentes.controlador;

import com.emergentes.modelo.Usuario;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ControladorUsuario", urlPatterns = {"/ControladorUsuario"})
public class ControladorUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int op = Integer.parseInt(request.getParameter("op"));
        int id, pos;
        HttpSession ses = request.getSession();
        ArrayList<Usuario> lista = (ArrayList<Usuario>) ses.getAttribute("listausuario");

        //nuevo
        if (op == 1) {
            Usuario usua = new Usuario();
            request.setAttribute("miUsuario", usua);
            request.getRequestDispatcher("editarusuario.jsp").forward(request, response);
        }
        //editar
        if (op == 2) {
            id = Integer.parseInt(request.getParameter("id"));
            pos = buscarPos(request, id);
            Usuario obj1 = lista.get(pos);
            request.setAttribute("miUsuario", obj1);
            request.getRequestDispatcher("editarusuario.jsp").forward(request, response);
        }
        //eliminar
        if (op == 3) {
            id = Integer.parseInt(request.getParameter("id"));
            pos = buscarPos(request, id);
            lista.remove(pos);
            ses.setAttribute("listausuario", lista);
            response.sendRedirect("indexusuario.jsp");
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
        String correo = request.getParameter("correo");
        String contraseña = request.getParameter("contraseña");
        String nuevo = request.getParameter("nuevo");
        int pos;
        Usuario user = new Usuario();
        user.setId(id);
        user.setNombre(nombre);
        user.setApellidos(apellidos);
        user.setCorreo(correo);
        user.setContraseña("Tiene");
        HttpSession ses = request.getSession();
        ArrayList<Usuario> lista = (ArrayList<Usuario>) ses.getAttribute("listausuario");

        if (nuevo.equals("true")) {
            lista.add(user);
        } else {
            pos = buscarPos(request, id);
            lista.set(pos, user);
        }
        response.sendRedirect("indexusuario.jsp");
    }
    
    private int buscarPos(HttpServletRequest request, int id) {
        HttpSession ses = request.getSession();
        ArrayList<Usuario> lista = (ArrayList<Usuario>) ses.getAttribute("listausuario");

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
